USE AdventureWorks;
GO

CREATE XML SCHEMA COLLECTION dbo.ComplexBOMSchema
AS
N'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">

  <xsd:element name="items">
    <xsd:complexType>
        <xsd:sequence>
          <xsd:element ref="item" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="item">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="name" minOccurs="1" maxOccurs="1" />
        <xsd:element name="color" minOccurs="0" maxOccurs="1" />
        <xsd:group ref="price-group" minOccurs="1" maxOccurs="1" />
        <xsd:element name="quantity" minOccurs="1" maxOccurs="1" />
        <xsd:group ref="size-group" minOccurs="0" maxOccurs="1" />
        <xsd:element ref="item" minOccurs="0" maxOccurs="unbounded" />
      </xsd:sequence>
      <xsd:attributeGroup ref="id-attr-group" />
    </xsd:complexType>
  </xsd:element>

  <xsd:attributeGroup name="id-attr-group">
    <xsd:attribute name="id" />
	<xsd:attribute name="number" />
  </xsd:attributeGroup>

  <xsd:group name="price-group">
    <xsd:choice>      
      <xsd:element name="list-price" minOccurs="1" maxOccurs="1" />
      <xsd:element name="standard-cost" minOccurs="1" maxOccurs="1" />
    </xsd:choice>
  </xsd:group>
 
  <xsd:group name="size-group">
    <xsd:sequence>
      <xsd:element name="size" minOccurs="1" maxOccurs="1" />
      <xsd:element name="unit-of-measure" minOccurs="1" maxOccurs="1" />
    </xsd:sequence>
  </xsd:group>

</xsd:schema>';
GO

DECLARE @x XML (dbo.ComplexBOMSchema);

SET @x = N'<?xml version="1.0"?>
<items>
  <item id="749" number="BK-R93R-62">
    <name>Road-150 Red, 62</name>
    <color>Red</color>
    <list-price>3578.2700</list-price>
    <quantity>1.00</quantity>
    <size>62</size>
    <unit-of-measure>CM </unit-of-measure>
    <item id="519" number="SA-R522">
      <name>HL Road Seat Assembly</name>
      <list-price>196.9200</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="717" number="FR-R92R-62">
      <name>HL Road Frame - Red, 62</name>
      <color>Red</color>
      <list-price>1431.5000</list-price>
      <quantity>1.00</quantity>
      <size>62</size>
      <unit-of-measure>CM </unit-of-measure>
    </item>
    <item id="807" number="HS-3479">
      <name>HL Headset</name>
      <list-price>124.7300</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="813" number="HB-R956">
      <name>HL Road Handlebars</name>
      <list-price>120.2700</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="820" number="FW-R820">
      <name>HL Road Front Wheel</name>
      <color>Black</color>
      <list-price>330.0600</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="828" number="RW-R820">
      <name>HL Road Rear Wheel</name>
      <color>Black</color>
      <list-price>357.0600</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="894" number="RD-2308">
      <name>Rear Derailleur</name>
      <color>Silver</color>
      <list-price>121.4600</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="907" number="RB-9231">
      <name>Rear Brakes</name>
      <color>Silver</color>
      <list-price>106.5000</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="940" number="PD-R853">
      <name>HL Road Pedal</name>
      <color>Silver/Black</color>
      <list-price>80.9900</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="945" number="FD-2342">
      <name>Front Derailleur</name>
      <color>Silver</color>
      <list-price>91.4900</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="948" number="FB-9873">
      <name>Front Brakes</name>
      <color>Silver</color>
      <list-price>106.5000</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="951" number="CS-9183">
      <name>HL Crankset</name>
      <color>Black</color>
      <list-price>404.9900</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="952" number="CH-0234">
      <name>Chain</name>
      <color>Silver</color>
      <list-price>20.2400</list-price>
      <quantity>1.00</quantity>
    </item>
    <item id="996" number="BB-9108">
      <name>HL Bottom Bracket</name>
      <list-price>121.4900</list-price>
      <quantity>1.00</quantity>
    </item>
  </item>
</items>';

SELECT @x;
GO

DROP XML SCHEMA COLLECTION dbo.ComplexBOMSchema;
GO