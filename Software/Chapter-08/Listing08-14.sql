USE AdventureWorks;
GO

DECLARE @bom xml, 
  @xslt xml;

SET @bom = (SELECT a.ComponentID AS "@id",
  p.ProductNumber AS "@number",
  p.Name AS "name",
  p.Color AS "color",
  p.ListPrice AS "list-price",
  a.PerAssemblyQty AS "quantity",
  p.Size AS "size",
  p.SizeUnitMeasureCode AS "unit-of-measure",
  (
    SELECT b.ComponentID AS "@id",
      p.ProductNumber AS "@number",
      p.Name AS "name",
      p.Color AS "color",
      p.ListPrice AS "list-price",
      b.PerAssemblyQty AS "quantity",
      p.Size AS "size",
      p.SizeUnitMeasureCode AS "unit-of-measure",
      (
        SELECT c.ComponentID AS "@id",
          p.ProductNumber AS "@number",
          p.Name AS "name",
          p.Color AS "color",
          p.ListPrice AS "list-price",
          c.PerAssemblyQty AS "quantity",
          p.Size AS "size",
          p.SizeUnitMeasureCode AS "unit-of-measure",
          (
            SELECT d.ComponentID AS "@id",
              p.ProductNumber AS "@number",
              p.Name AS "name",
              p.Color AS "color",
              p.ListPrice AS "list-price",
              d.PerAssemblyQty AS "quantity",
              p.Size AS "size",
              p.SizeUnitMeasureCode AS "unit-of-measure",
              (  
                SELECT e.ComponentID AS "@id",
                  p.ProductNumber AS "@number",
                  p.Name AS "name",
                  p.Color AS "color",
                  p.ListPrice AS "list-price",
                  e.PerAssemblyQty AS "quantity",
                  p.Size AS "size",
                  p.SizeUnitMeasureCode AS "unit-of-measure"
                FROM Production.BillOfMaterials e 
                INNER JOIN Production.Product p 
                  ON e.ComponentID = p.ProductID 
                WHERE e.ProductAssemblyID = d.ComponentID 
                  AND e.EndDate IS NULL
                FOR XML PATH (N'item'), TYPE
              )
            FROM Production.BillOfMaterials d 
            INNER JOIN Production.Product p 
              ON d.ComponentID = p.ProductID 
            WHERE d.ProductAssemblyID = c.ComponentID 
              AND d.EndDate IS NULL
            FOR XML PATH (N'item'), TYPE
          )
        FROM Production.BillOfMaterials c 
        INNER JOIN Production.Product p 
          ON c.ComponentID = p.ProductID 
        WHERE c.ProductAssemblyID = b.ComponentID
          AND c.EndDate IS NULL
        FOR XML PATH (N'item'), TYPE
      )
    FROM Production.BillOfMaterials b 
    INNER JOIN Production.Product p 
      ON b.ComponentID = p.ProductID 
    WHERE b.ProductAssemblyID = a.ComponentID 
      AND b.EndDate IS NULL
    FOR XML PATH(N'item'), TYPE
  )
FROM Production.BillOfMaterials a 
INNER JOIN Production.Product p 
  ON a.ComponentID = p.ProductID 
WHERE a.EndDate IS NULL
  AND p.FinishedGoodsFlag = 1
FOR XML PATH(N'item'), ROOT(N'items'), TYPE);

SET @xslt = N'<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="/items">
    <html>

      <head>
        <style type="text/css">
          table {
            border-width: 1px;
            border-spacing: ;
            border-style: solid;
            border-color: black;
            border-collapse: collapse;
            background-color: white;
            width: 100%;
          }

          table th {
            border-width: 1px;
            padding: 3px;
            border-style: dotted;
            border-color: gray;
            background-color: #00ffff;
            font-family: arial;
            font-size: 12px;
          }

          table td {
            border-width: 1px;
            padding: 3px;
            border-style: dotted;
            border-color: gray;
            background-color: white;
            font-family: arial;
            font-size: 12px;
          }
        </style>
      </head>

      <body>
        <h2>AdventureWorks Finished Goods List</h2>
        <table>
          <tr>
            <th>Level</th>
            <th>ID</th>
            <th>Number</th>
            <th>Name</th>
            <th>Color</th>
            <th>List Price</th>
            <th>Quantity</th>
            <th>Size</th>
            <th>UOM</th>
          </tr>
          <xsl:for-each select="item">
            <tr bgcolor="#00ffff">
              <td>1</td>
              <td>
                <xsl:value-of select="@id"/>
              </td>
              <td>
                <xsl:value-of select="@number"/>
              </td>
              <td>
                <xsl:value-of select="name"/>
              </td>
              <td>
                <xsl:value-of select="color"/>
              </td>
              <td>
                <xsl:value-of select="list-price"/>
              </td>
              <td>
                <xsl:value-of select="quantity"/>
              </td>
              <td>
                <xsl:value-of select="size"/>
              </td>
              <td>
                <xsl:value-of select="unit-of-measure"/>
              </td>
            </tr>
            <xsl:call-template name = "details">
              <xsl:with-param name="level">1</xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template name = "details">
    <xsl:param name="level" />
    <xsl:if test="item">
      <tr>
        <td colspan="9">
          <table>
            <tr>
              <th>Level</th>
              <th>ID</th>
              <th>Number</th>
              <th>Name</th>
              <th>Color</th>
              <th>List Price</th>
              <th>Quantity</th>
              <th>Size</th>
              <th>UOM</th>
            </tr>
            <xsl:for-each select="item">
              <tr>
                <td>
                  <xsl:value-of select="$level + 1"/>
                </td>
                <td>
                  <xsl:value-of select="@id"/>
                </td>
                <td>
                  <xsl:value-of select="@number"/>
                </td>
                <td>
                  <xsl:value-of select="name"/>
                </td>
                <td>
                  <xsl:value-of select="color"/>
                </td>
                <td>
                  <xsl:value-of select="list-price"/>
                </td>
                <td>
                  <xsl:value-of select="quantity"/>
                </td>
                <td>
                  <xsl:value-of select="size"/>
                </td>
                <td>
                  <xsl:value-of select="unit-of-measure"/>
                </td>
              </tr>
              <xsl:if test="item">
                <xsl:call-template name="details">
                  <xsl:with-param name="level" select="$level + 1"/>
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </table>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>';

EXEC dbo.p_XsltTransformToFile @bom, @xslt, 'C:\finished_goods_list.html';
GO