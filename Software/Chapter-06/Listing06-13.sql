USE AdventureWorks;
GO

SELECT Instructions.query('declare default element namespace 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  (//tool)[fn:position() = 3 or fn:position() = fn:last()]') AS Tools
FROM Production.ProductModel
WHERE ProductModelID = 7;
GO