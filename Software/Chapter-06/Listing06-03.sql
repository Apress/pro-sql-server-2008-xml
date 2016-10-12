SELECT Instructions.query ('declare default element namespace 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  fn:string((/root/Location)[1])') AS Location,
  Instructions.query ('declare default element namespace
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
  fn:data((/root/Location/@LaborHours)[1])') AS LaborHours
FROM Production.ProductModel
WHERE ProductModelID = 7;
GO
