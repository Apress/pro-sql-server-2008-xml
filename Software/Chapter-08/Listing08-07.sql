USE AdventureWorks;
GO

DECLARE @source_xslt xml,
  @source_xml xml;

SELECT @source_xml =
(
  SELECT ic1.CountryRegionName AS "Country",
    (
      SELECT COUNT(*) AS "Count",
        ic2.StateProvinceName AS "State-Name"
      FROM Sales.vIndividualCustomer ic2
      WHERE ic2.CountryRegionName = ic1.CountryRegionName
      GROUP BY ic2.CountryRegionName, ic2.StateProvinceName
      FOR XML PATH ('State'), TYPE
    ) AS "Customers"
  FROM Sales.vIndividualCustomer ic1
  WHERE ic1.CountryRegionName = 'United States'
  GROUP BY CountryRegionName
  ORDER BY CountryRegionName
  FOR XML PATH ('Individual-Customer-Summary'), TYPE
);

SET @source_xslt = N'<xsl:stylesheet version = "1.0" 
  xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
  xmlns = "http://www.w3.org/1999/xhtml">

  <xsl:template match = "/Individual-Customer-Summary">
    <html>

      <head>
        <style type = "text/css">

          table {
            border-width: 1px;
            border-style: solid;
            border-color: black;
            border-collapse: collapse;
            background-color: white;
            width: 50%;
          }

          table th {
            border-width: 1px;
            padding: 3px;
            border-style: dotted;
            border-color: gray;
            background-color: #6666dd;
            font-family: arial;
            font-size: 12px;
            color: white;
          }

          table td.light {
            border-width: 1px;
            padding: 3px;
            border-style: dotted;
            border-color: gray;
            background-color: white;
            font-family: arial;
            font-size: 12px;
          }

          table td.dark {
            border-width: 1px;
            padding: 3px;
            border-style: dotted;
            border-color: gray;
            background-color: #66ffff;
            font-family: arial;
            font-size: 12px;
          }

        </style>
      </head>

      <body>
        <h2>
          AdventureWorks Customer Breakdown: <xsl:value-of select = "Country"/>
        </h2>
        <table>
          <tr>
            <th>
              State
            </th>
            <th>
              Customer Count
            </th>
          </tr>
          <xsl:for-each select="Customers/State">
            <xsl:sort select="Count" data-type="number" order="descending"/>
            <xsl:sort select="State-Name" order="ascending"/>
            <tr>
              <xsl:choose>
                <xsl:when test = "position() mod 2 = 0">
                  <td class = "dark">
                    <xsl:value-of select = "State-Name" />
                  </td>
                  <td class="dark">
                    <xsl:value-of select = "Count"/>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td class="light">
                    <xsl:value-of select = "State-Name" />
                  </td>
                  <td class="light">
                    <xsl:value-of select = "Count"/>
                  </td>
                </xsl:otherwise>
              </xsl:choose>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>';

EXEC p_XsltTransformToFile @source_xml, 
    @source_xslt, 
    N'C:\customer_report.html';
GO
