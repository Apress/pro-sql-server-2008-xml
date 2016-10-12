USE AdventureWorks;
GO
DECLARE @acme_retailers_order xml,
  @acme_xslt xml,
  @xyz_bike_repair_order xml,
  @xyz_xslt xml,
  @common_format_order xml;

SET @xyz_bike_repair_order = N'<retail-order>
  <dates order = "2003-08-17T00:00:00" due = "2003-08-29T00:00:00" />
  <account>10-4030-024952</account>
  <purchase-order>PO938345</purchase-order>
  <subtotal>71.5800</subtotal>
  <taxamount>5.7264</taxamount>
  <shipping>1.7895</shipping>
  <total>79.0959</total>
  <contact firstname = "Amanda" lastname = "Long" middlename = "A"
    emailaddress = "amanda31@adventure-works.com" emailopt = "2"
    phone = "328-555-0124" />
  <bill-to-address line1 = "10 Napa Ct."
      city = "Lebanon"
      postal = "97355"
      state = "OR" />
  <ship-to-address same-as-billing = "YES" />
  <order-items>
    <line id = "1">
       <item>TI-R982</item>
       <quantity>1</quantity>
       <price-per-unit>32.6000</price-per-unit>
    </line>
    <line id = "2">
       <item>TT-R982</item>
       <quantity>1</quantity>
       <price-per-unit>3.9900</price-per-unit>
    </line>
    <line id = "3">
       <item>HL-U509-B</item>
       <quantity>1</quantity>
       <price-per-unit>34.9900</price-per-unit>
    </line>
  </order-items>
</retail-order>';

SET @acme_retailers_order = N'<Order>
  <Order-Date>2002-03-01T00:00:00</Order-Date>
  <Due-Date>2002-03-13T00:00:00</Due-Date>
  <PO-Num>PO9802194761</PO-Num>
  <Account-Number>10-4020-000026</Account-Number>
  <Subtotal>4659.3105</Subtotal>
  <Tax>372.7448</Tax>
  <Freight>116.4828</Freight>
  <TotalDue>5148.5381</TotalDue>
  <Customer>
    <First-Name>James</First-Name>
    <Last-Name>Hamilton</Last-Name>
    <Middle-Name>R.</Middle-Name>
    <Email-Address>james7@adventure-works.com</Email-Address>
    <Email-Promotion>0</Email-Promotion>
    <Phone>418-555-0115</Phone>
    <Billing-Address>
      <Street-Address>1 Corporate Center Drive</Street-Address>
      <City>Miami</City>
      <ZIP>33127</ZIP>
      <State>FL </State>
    </Billing-Address>
    <Shipping-Address>
      <Street-Address>937 West Palm Court</Street-Address>
      <City>Miami</City>
      <ZIP>33127</ZIP>
      <State>FL </State>
    </Shipping-Address>      
  </Customer>
  <Order-Details>
    <Detail>
       <Qty>1</Qty>
       <Catalog-Num>BK-R50R-44</Catalog-Num>
       <Price>419.4589</Price>
    </Detail>
    <Detail>
       <Qty>2</Qty>
       <Catalog-Num>BK-R50B-52</Catalog-Num>
       <Price>419.4589</Price>
    </Detail>
    <Detail>
       <Qty>3</Qty>
       <Catalog-Num>BK-R68R-52</Catalog-Num>
       <Price>874.7940</Price>
    </Detail>
  </Order-Details>
</Order>';
GO