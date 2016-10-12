CREATE XML SCHEMA COLLECTION dbo.ComplexTestSchemaCollection_attribute
AS
N'<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="item">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="name" minOccurs="1" maxOccurs="1" />
        <xs:element name="color" minOccurs="0" maxOccurs="1" />
        <xs:group ref="price-group" minOccurs="1" maxOccurs="1"/>
        <xs:group ref="size-group" minOccurs="0" maxOccurs="1"/>
		<xs:element ref="item" minOccurs="0" maxOccurs="unbounded" />
      </xs:sequence>
	  <xs:attributeGroup ref="id-attr-group" />
    </xs:complexType>
  </xs:element>

  <xs:attributeGroup name="id-attr-group">
    <xs:attribute name="id" />
	<xs:attribute name="number" />
  </xs:attributeGroup>

  <xs:group name="price-group">
    <xs:choice>      
      <xs:element name="list-price" minOccurs="1" maxOccurs="1" />
      <xs:element name="standard-cost" minOccurs="1" maxOccurs="1" />
    </xs:choice>
  </xs:group>
 
  <xs:group name="size-group">
    <xs:sequence>
      <xs:element name="size" minOccurs="1" maxOccurs="1" />
      <xs:element name="unit-of-measure" minOccurs="1" maxOccurs="1" />
    </xs:sequence>
  </xs:group>

</xs:schema>';
GO

DECLARE @x XML (dbo.ComplexTestSchemaCollection_attribute);

SET @x = N'<?xml version="1.0"?>
<item id="749" number="BK-R93R-62">
  <name>Road-150 Red, 62</name>
  <color>Red</color>
  <list-price>3578.27</list-price>
  <size>62</size>
  <unit-of-measure>CM</unit-of-measure>
  <item id="717" number="FR-R92R-62">
    <name>HL Road Frame - Red, 62</name>
    <color>Red</color>
    <standard-cost>868.6342</standard-cost>
    <size>62</size>
    <unit-of-measure>CM</unit-of-measure>
    <item id="324" number="CS-2812">
      <name>Chain Stays</name>
      <standard-cost>0.00</standard-cost>
      <item id="486" number="MS-2341">
        <name>Metal Sheet 5</name>
        <standard-cost>0.00</standard-cost>
      </item>
    </item>
  </item>
</item>';

SELECT @x;
GO

DROP XML SCHEMA COLLECTION dbo.ComplexTestSchemaCollection_attribute;
