USE AdventureWorks;
GO

SELECT Instructions.query('declare default element namespace 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  fn:number((/root/Location/@LaborHours)[1])') AS Number,
  Instructions.query('declare default element namespace 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  fn:local-name((/root/Location)[1])') AS LocalName,
  Instructions.query('declare default element namespace 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  fn:namespace-uri((/root/Location)[1])') AS URI
FROM Production.ProductModel
WHERE ProductModelID = 7;
GO