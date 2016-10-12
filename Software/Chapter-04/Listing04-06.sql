USE AdventureWorks;
GO

CREATE XML SCHEMA COLLECTION dbo.ComplexTestSchemaCollection_sequence_choice
AS
N'<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="item">
    <xs:complexType>
      <xs:sequence>
      <xs:choice>
        <xs:element name="id" />
        <xs:element name="number" />
      </xs:choice>
      <xs:element name="name" />
      <xs:element name="color" />
      <xs:choice>      
        <xs:element name="list-price" />
        <xs:element name="standard-cost" />
      </xs:choice>
      <xs:sequence>
        <xs:element name="size" />
        <xs:element name="unit-of-measure" />
      </xs:sequence>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>';
GO

DECLARE @x XML (dbo.ComplexTestSchemaCollection_sequence_choice);

SET @x = N'<?xml version="1.0"?>
<item>
  <id>749</id>
  <name>Road-150 Red, 62</name>
  <color>Red</color>
  <list-price>3578.27</list-price>
  <size>62</size>
  <unit-of-measure>CM</unit-of-measure>
</item>';

SELECT @x;
GO

DROP XML SCHEMA COLLECTION dbo.ComplexTestSchemaCollection_sequence_choice;
GO
