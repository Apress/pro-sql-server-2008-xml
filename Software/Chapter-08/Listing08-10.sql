USE AdventureWorks;
GO

SET @xyz_xslt = N'<xsl:stylesheet version = "1.0" 
  xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements = "*" />
  <xsl:output method = "xml" encoding = "utf-16" />

  <xsl:template match = "/retail-order">
    <common-format-order>
      <date-info>
        <ordered>
          <xsl:value-of select = "dates/@order" /> 
        </ordered>
        <due>
          <xsl:value-of select = "dates/@due" />
        </due>
      </date-info>
      <account-info>
        <account-number>
          <xsl:value-of select = "account" />
        </account-number>
        <purchase-order-number>
          <xsl:value-of select = "purchase-order" />
        </purchase-order-number>
        <billing-info>
          <name>
            <first>
               <xsl:value-of select = "contact/@firstname" />
            </first>
            <middle>
               <xsl:value-of select = "contact/@middlename" />
            </middle>
            <last>
               <xsl:value-of select = "contact/@lastname" />
            </last>
          </name>
          <email>
            <xsl:attribute name = "opt-in">
            <xsl:choose>
              <xsl:when test = "contact/@emailopt = 0">No</xsl:when>
              <xsl:otherwise>Yes</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select = "contact/@emailaddress" />
          </email>
          <phone>
            <xsl:value-of select = "contact/@phone" />
          </phone>
          <address>
            <street-address>
              <xsl:value-of select = "bill-to-address/@line1" />
            </street-address>
            <city>
              <xsl:value-of select = "bill-to-address/@city" />
            </city>
            <state>
              <xsl:value-of select = "bill-to-address/@state" />
            </state>
            <zip>
              <xsl:value-of select = "bill-to-address/@postal" />
            </zip>
          </address>
        </billing-info>
        <shipping-info>
          <xsl:choose>
            <xsl:when test = "ship-to-address/@same-as-billing = &apos;YES&apos;">
              <address>
                <street-address>
                  <xsl:value-of select = "bill-to-address/@line1" />
                </street-address>
                <city>
                  <xsl:value-of select = "bill-to-address/@city" />
                </city>
                <state>
                  <xsl:value-of select = "bill-to-address/@state" />
                </state>
                <zip>
                  <xsl:value-of select = "bill-to-address/@postal" />
                </zip>
              </address>
            </xsl:when>
            <xsl:otherwise>
              <address>
                <street-address>
                  <xsl:value-of select = "ship-to-address/@line1" />
                </street-address>
                <city>
                  <xsl:value-of select = "ship-to-address/@city" />
                </city>
                <state>
                  <xsl:value-of select = "ship-to-address/@state" />
                </state>
                <zip>
                  <xsl:value-of select = "ship-to-address/@postal" />
                </zip>
              </address>
            </xsl:otherwise>
          </xsl:choose>
        </shipping-info>
      </account-info>
      <order-info>
        <xsl:for-each select = "order-items/line">
          <detail-line>
            <item>
              <xsl:value-of select = "item" />
            </item>
            <quantity>
              <xsl:value-of select = "quantity" />
            </quantity>
            <price>
              <xsl:value-of select = "price-per-unit" />
            </price>
          </detail-line>
        </xsl:for-each>
        <summary>
          <subtotal>
            <xsl:value-of select = "subtotal" />
          </subtotal>
          <tax>
            <xsl:value-of select = "taxamount" />
          </tax>
          <shipping>
            <xsl:value-of select = "shipping" />
          </shipping>
          <total>
            <xsl:value-of select = "total" />
          </total>
        </summary>
        <xsl:comment>TERMS: 30 NET 5</xsl:comment>
      </order-info>
    </common-format-order>
  </xsl:template>
</xsl:stylesheet>';
GO