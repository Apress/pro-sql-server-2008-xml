USE AdventureWorks;
GO

SELECT Instructions.query ('declare namespace ns =
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
    /ns:root/ns:Location/ns:step/ns:tool[. = "T-85A framing tool"]')
FROM Production.ProductModel;
GO