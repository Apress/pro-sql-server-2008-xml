USE AdventureWorks;
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

