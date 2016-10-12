USE AdventureWorks;
GO

SELECT ProductModelId, CatalogDescription.value ('declare namespace ns =
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription";
  (/ns:ProductDescription/ns:Specifications/Material/text())[1]', 
    'VARCHAR(100)') 
AS Material
FROM Production.ProductModel
WHERE ProductModelId = 23;
GO