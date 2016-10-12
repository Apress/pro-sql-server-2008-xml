DECLARE @x xml;
SET @x = N'<?xml version = "1.0"?>
<bookstores company = "Borders Group">

  <store name = "Borders">
    <address>
        <street>2 PENN PLAZA</street>
        <city>NEW YORK</city>
        <state>NY</state>
        <postal-code>10121-0101</postal-code>
        <country>US</country>
        <geo>
          <lat>40.749278</lat>
          <long>-73.992078</long>
        </geo>
    </address>
  </store>

  <store name = "Waldenbooks">
    <address>
        <street>318 E FAIRMOUNT AVENUE</street>
        <city>LAKEWOOD</city>
        <state>NY</state>
        <postal-code>14750-2007</postal-code>
        <country>US</country>
        <geo>
          <lat>42.098387</lat>
          <long>-79.305532</long>
        </geo>
    </address>
  </store>

  <store name = "Borders Express">
    <address>
        <street>1401 ROUTE 300</street>
        <city>NEWBURGH</city>
        <state>NY</state>
        <postal-code>12550-2990</postal-code>
        <country>US</country>
        <geo>
          <lat>41.518067</lat>
          <long>-74.068843</long>
        </geo>
    </address>
  </store>

</bookstores>';

SELECT @x.query('//street');
GO