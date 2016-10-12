USE AdventureWorks;
GO

CREATE FULLTEXT INDEX
ON Production.ProductModel
(
  Instructions
)
KEY INDEX PK_ProductModel_ProductModelID
ON FTC_Instructions_XML;
GO