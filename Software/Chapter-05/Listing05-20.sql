USE AdventureWorks;
GO

DECLARE @material VARCHAR(50);

SET @material = 'Alloy';

SELECT pm.ProductModelId, pm.Name, pm.CatalogDescription
FROM Production.ProductModel pm
WHERE pm.CatalogDescription.exist('declare namespace ns = 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription";
  /ns:ProductDescription/ns:Specifications/Material
    [fn:contains( . , sql:variable("@material") ) ]') = 1;
GO