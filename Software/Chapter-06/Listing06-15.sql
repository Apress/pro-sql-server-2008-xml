USE AdventureWorks;
GO

CREATE XML SCHEMA COLLECTION QNameSchema AS 
  '<xs:schema xmlns:xs = "http://www.w3.org/2001/XMLSchema">
    <xs:element name="root" type="xs:QName"/>
  </xs:schema>';
GO

DECLARE @x xml (QNameSchema);
SET @x = N'<root xmlns:ns = "http://TestURI">ns:localName</root>';

SELECT @x.query('fn:namespace-uri-from-QName(/root[1])') AS uri,
  @x.query('fn:local-name-from-QName(/root[1])') AS localname;
GO
