USE AdventureWorks;
GO

/* Build the secondary PATH XML Index first */
CREATE XML INDEX SXML_ProductModel_Path
ON Production.ProductModel (Instructions)
USING XML INDEX PXML_ProductModel_Instructions
FOR PATH;

/* Inefficient version */
WITH XMLNAMESPACES (DEFAULT 
  'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT Instructions.query('(/root/Location//*/material)') AS Material
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;

/* Efficient version */
WITH XMLNAMESPACES (DEFAULT 
  'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT Instructions.query('(//material)') AS Material
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;
GO