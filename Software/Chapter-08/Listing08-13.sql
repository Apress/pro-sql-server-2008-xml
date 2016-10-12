USE AdventureWorks;
GO

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
GO