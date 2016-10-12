USE AdventureWorks;
GO

SELECT *
FROM Production.ProductModel
WHERE FREETEXT(Instructions, 'applies')
AND Instructions.exist('declare namespace ns = 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  (//ns:step/ns:material[contains(., "aluminum")])') = 1;
GO