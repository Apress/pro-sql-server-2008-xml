USE AdventureWorks;
GO

SET @acme_xslt = N'<xsl:stylesheet version = "1.0" 
  xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements = "*" />
  <xsl:output method = "xml" encoding = "utf-16" />

  <xsl:template match = "/Order">
    <common-format-order>
      <date-info>
        <ordered>
          <xsl:value-of select = "Order-Date" /> 
        </ordered>
        <due>
          <xsl:value-of select = "Due-Date" />
        </due>
      </date-info>
      <account-info>
        <account-number>
          <xsl:value-of select = "Account-Number" />
        </account-number>
        <purchase-order-number>
          <xsl:value-of select = "PO-Num" />
        </purchase-order-number>
        <billing-info>
          <name>
            <first>
               <xsl:value-of select = "Customer/First-Name" />
            </first>
            <middle>
               <xsl:value-of select = "Customer/Middle-Name" />
            </middle>
            <last>
               <xsl:value-of select = "Customer/Last-Name" />
            </last>
          </name>
          <email>
            <xsl:attribute name = "opt-in">
            <xsl:choose>
              <xsl:when test = "Customer/Email-Promotion = 0">No</xsl:when>
              <xsl:otherwise>Yes</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select = "Customer/Email-Address" />
          </email>
          <phone>
            <xsl:value-of select = "Customer/Phone" />
          </phone>
          <address>
            <street-address>
              <xsl:value-of select = "Customer/Billing-Address/Street-Address" />
            </street-address>
            <city>
              <xsl:value-of select = "Customer/Billing-Address/City" />
            </city>
            <state>
              <xsl:value-of select = "Customer/Billing-Address/State" />
            </state>
            <zip>
              <xsl:value-of select = "Customer/Billing-Address/ZIP" />
            </zip>
          </address>
        </billing-info>
        <shipping-info>
          <address>
            <street-address>
              <xsl:value-of select = "Customer/Shipping-Address/Street-Address" />
            </street-address>
            <city>
              <xsl:value-of select = "Customer/Shipping-Address/City" />
            </city>
            <state>
              <xsl:value-of select = "Customer/Shipping-Address/State" />
            </state>
            <zip>
              <xsl:value-of select = "Customer/Shipping-Address/ZIP" />
            </zip>
          </address>
        </shipping-info>
      </account-info>
      <order-info>
        <xsl:for-each select = "Order-Details/Detail">
          <detail-line>
            <item>
              <xsl:value-of select = "Catalog-Num" />
            </item>
            <quantity>
              <xsl:value-of select = "Qty" />
            </quantity>
            <price>
              <xsl:value-of select = "Price" />
            </price>
          </detail-line>
        </xsl:for-each>
        <summary>
          <subtotal>
            <xsl:value-of select = "Subtotal" />
          </subtotal>
          <tax>
            <xsl:value-of select = "Tax" />
          </tax>
          <shipping>
            <xsl:value-of select = "Freight" />
          </shipping>
          <total>
            <xsl:value-of select = "TotalDue" />
          </total>
        </summary>
        <xsl:comment>TERMS: 30 NET 10, 60 NET 5</xsl:comment>
      </order-info>
    </common-format-order>
  </xsl:template>
</xsl:stylesheet>';
GO