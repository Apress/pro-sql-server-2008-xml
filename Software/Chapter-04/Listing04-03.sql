USE AdventureWorks;
GO

DECLARE @schema xml;
SET @schema = N'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name = "item" />
</xsd:schema>';

CREATE XML SCHEMA COLLECTION dbo.SimpleTestSchemaCollection
AS @schema;
GO

DECLARE @x xml(DOCUMENT dbo.SimpleTestSchemaCollection);
SET @x = N'<?xml version="1.0"?>
<item>
</item>';

SELECT @x;

DROP XML SCHEMA COLLECTION dbo.SimpleTestSchemaCollection;
GO
