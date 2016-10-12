USE AdventureWorks;
GO

CREATE XML SCHEMA COLLECTION dbo. ComplexTestSchemaCollection_all
AS
N'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="item">
    <xsd:complexType>
      <xsd:all>
        <xsd:element name="id" />
        <xsd:element name="number" />
        <xsd:element name="name" />
        <xsd:element name="color" />
        <xsd:element name="list-price" />
        <xsd:element name="standard-cost" />
        <xsd:element name="size" />
        <xsd:element name="unit-of-measure" />
      </xsd:all>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>';
GO

DECLARE @x XML (dbo. ComplexTestSchemaCollection_all);

SET @x = N'<?xml version="1.0"?>
<item>
  <id>749</id>
  <name>Road-150 Red, 62</name>
  <number>BK-R93R-62</number>
  <color>Red</color>
  <standard-cost>2171.2942</standard-cost>
  <list-price>3578.27</list-price>
  <unit-of-measure>CM</unit-of-measure>
  <size>62</size>
</item>';

SELECT @x;
GO

DROP XML SCHEMA COLLECTION dbo.ComplexTestSchemaCollection_all;
GO
