/* This installation script combines the code from listings
   09-01 to 09-04.  Note that this script contains a dependency
   on the SQLCLR assembly and functions created in Chapter 8
   example code. That assembly and its functions must be 
   installed before you can run the AdventureWorks Product
   Browser sample program. */

USE AdventureWorks;
GO

CREATE PROCEDURE dbo.p_GetProductHierarchy
AS
BEGIN
  SELECT p.ProductID, 
    p.Name AS ProductName,
    pc.ProductCategoryID, 
    pc.Name AS ProductCategoryName,
    ps.ProductSubcategoryID, 
    ps.Name AS ProductSubcategoryName, 
    pm.ProductModelID, 
    pm.Name AS ProductModelName
  FROM Production.Product p
  INNER JOIN Production.ProductModel pm
    ON pm.ProductModelID = p.ProductModelID
  INNER JOIN Production.ProductSubcategory ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
  INNER JOIN Production.ProductCategory pc
    ON pc.ProductCategoryID = ps.ProductCategoryID
  ORDER BY pc.Name, ps.Name, pm.Name, p.Name;
END
GO

CREATE FUNCTION dbo.fn_GetProductPhoto (@ProductID INT, @Thumbnail BIT)
RETURNS VARBINARY(MAX)
AS
BEGIN
  RETURN (
    SELECT CASE @Thumbnail 
        WHEN 1 THEN pp.ThumbNailPhoto
        ELSE pp.LargePhoto 
      END
    FROM Production.Product p
    INNER JOIN Production.ProductProductPhoto ppp
      ON p.ProductID = ppp.ProductID
    INNER JOIN Production.ProductPhoto pp
      ON ppp.ProductPhotoID = pp.ProductPhotoID
    WHERE p.ProductID = @ProductID
  );
END
GO

CREATE FUNCTION dbo.fn_GetHtmlCatalogDescription (@ProductID INT)
RETURNS xml
AS
BEGIN
  DECLARE @xslt xml;
  SET @xslt = N'<?xml version=''1.0''?>
  <xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" 
    version = "1.0"
    xmlns:html = "http://www.w3.org/1999/xhtml"
    xmlns:x = "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"
    xmlns:wm = "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"
    xmlns = "http://www.w3.org/1999/xhtml"
    xmlns:p1 = "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription" 
    xmlns:wf = "http://www.adventure-works.com/schemas/OtherFeatures"
    exclude-result-prefixes="html wm x p1 wf">

  <xsl:preserve-space elements = "*"/>
  <xsl:output method = "html"/>

  <xsl:template match = "/">
    <html>
      <head>
        <style>
          body { font-family: Arial, Helvetica, sans-serif; }
          h1 { font-size: bigger; color: #336699; text-alignment: center; }
          table.specs { width: 85%; border-width: 1px; cell-spacing: 0px; cell-padding: 0px; ~CCC
            border-color: black; border-style: solid; }
          tr.specs { background-color: #336699; }
        </style>
      </head>

      <body>
        <xsl:apply-templates select="//x:ProductDescription"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="x:ProductDescription">
    <h1>
      <xsl:value-of select="@ProductModelName"/> - 
      <xsl:value-of select="@ProductModelID"/>
    </h1>
    <xsl:if test="x:Features/*">
    <table>
       <tr>
         <td>
           <ul>
             <xsl:for-each select="x:Features/*">
               <li>
                 <b>
                   <xsl:value-of select="local-name()"/>
                 </b>: 
                 <xsl:for-each select="*|text()">
                   <xsl:choose>
                     <xsl:when test = "text()">
                       <xsl:copy-of select="text()"/>
                     </xsl:when>
                     <xsl:otherwise>
                       <xsl:copy-of select="."/>
                     </xsl:otherwise>
                   </xsl:choose>
                   <xsl:text>&#32;</xsl:text>
                 </xsl:for-each>
               </li>
             </xsl:for-each>
           </ul>
         </td>
       </tr>
    </table>
    </xsl:if>
      <xsl:apply-templates select="x:Summary"/>
      <xsl:if test="x:Specifications/*">
        <table class="specs">
          <tr class="specs">
            <th colspan="2" style="color:white;">
              Specifications
            </th>
          </tr>
          <xsl:for-each select="x:Specifications/*">
          <tr valign="top"> 
            <th align="left">
              <xsl:value-of select="local-name()"/>
            </th>
            <td align="left">
              <xsl:value-of select="."/>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="x:Summary">
    <table>
      <tr>
        <td>
          <xsl:copy-of select="*"/>
        </td>
      </tr>
    </table>
  </xsl:template>

</xsl:stylesheet>';

  DECLARE @xml_catalog_description xml;

  SELECT @xml_catalog_description = pm.CatalogDescription
  FROM Production.Product p
  INNER JOIN Production.ProductModel pm
    ON p.ProductModelID = pm.ProductModelID
  WHERE p.ProductID = @ProductID;

  RETURN dbo.fn_XsltTransform(@xml_catalog_description, @xslt);
END
GO

CREATE ENDPOINT AdvWorksProductBrowser 
STATE = STARTED 
AS HTTP 
(
  PATH = '/Browser',
  AUTHENTICATION = ( INTEGRATED ), 
  PORTS = ( CLEAR ), 
  SITE = '*',
  CLEAR_PORT = 888
)
FOR SOAP 
(
  WEBMETHOD 'GetProductHierarchy'
  ( 
    NAME = 'AdventureWorks.dbo.p_GetProductHierarchy',
    SCHEMA = STANDARD,
    FORMAT = ROWSETS_ONLY
  ),
  WEBMETHOD 'GetProductPhoto'
  (
    NAME = 'AdventureWorks.dbo.fn_GetProductPhoto',
    SCHEMA = STANDARD,
    FORMAT = ALL_RESULTS
  ),
  WEBMETHOD 'GetHtmlCatalogDescription'
  (
    NAME = 'AdventureWorks.dbo.fn_GetHtmlCatalogDescription',
    SCHEMA = STANDARD,
    FORMAT = ALL_RESULTS
  ),
  BATCHES = DISABLED,
  WSDL = DEFAULT,
  LOGIN_TYPE = WINDOWS,
  DATABASE = 'AdventureWorks'
);
GO
