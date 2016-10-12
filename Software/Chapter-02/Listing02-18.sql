USE AdventureWorks;
GO
WITH XMLNAMESPACES(DEFAULT 'http://www.microsoft.com/AdventureWorksDB/Product')
SELECT p.ProductID AS "Product/@ID",
  p.Name AS "Product/Name",
  p.ProductNumber AS "Product/Number",
  p.Size AS "Product/Size/data()",
  p.SizeUnitMeasureCode AS "Product/Size/data()"
FROM Production.Product p
WHERE p.ProductID = 775
  FOR XML PATH;
GO