USE AdventureWorks;
GO
DECLARE @ProductID int;
SET @ProductID = 749;

SELECT a.ComponentID AS "@id",
  p.ProductNumber AS "@number",
  p.Name AS "name",
  p.Color AS "color",
  p.ListPrice AS "list-price",
  a.PerAssemblyQty AS "quantity",
  p.Size AS "size",
  p.SizeUnitMeasureCode AS "unit-of-measure"
FROM Production.BillOfMaterials a 
INNER JOIN Production.Product p 
  ON a.ComponentID = p.ProductID 
WHERE p.ProductID = @ProductID
  FOR XML PATH(N'item'), 
  ROOT(N'items'), 
  TYPE;
GO
