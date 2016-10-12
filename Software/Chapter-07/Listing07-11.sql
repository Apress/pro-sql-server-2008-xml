USE AdventureWorks;
GO

SELECT *
FROM Production.ProductModel
WHERE FREETEXT (Instructions, 'applies');
GO