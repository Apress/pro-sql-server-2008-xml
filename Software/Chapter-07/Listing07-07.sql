USE AdventureWorks;
GO

SELECT ProductModelID,
  Instructions.value ('declare namespace ns =
    "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
    (/ns:root/ns:Location/ns:step/ns:material[. = "aluminum sheet MS-2341"])[1]',
      'varchar(1000)') AS Step,
  Instructions.value ('declare namespace ns = 
    "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions";
    (/ns:root/ns:Location/ns:step/ns:tool)[1]', 'varchar(200)') AS Tool
FROM Production.ProductModel
WHERE ProductModelID = 7; 
GO