DECLARE @x xml;
SET @x = N'';
SELECT Instructions.query('declare default element namespace 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  fn:count(//step)')
FROM Production.ProductModel
WHERE ProductModelID = 7;
GO