USE AdventureWorks;
GO

CREATE PROCEDURE dbo.p_GetProductHierarchy
AS
BEGIN
  SELECT p.ProductID, 
    p.Name AS ProductName,
    pc.ProductCategoryID, 
    pc.Name AS ProductCategoryName,
    ps.ProductSubcategoryID, 
    ps.Name AS ProductSubcategoryName, 
    pm.ProductModelID, 
    pm.Name AS ProductModelName
  FROM Production.Product p
  INNER JOIN Production.ProductModel pm
    ON pm.ProductModelID = p.ProductModelID
  INNER JOIN Production.ProductSubcategory ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
  INNER JOIN Production.ProductCategory pc
    ON pc.ProductCategoryID = ps.ProductCategoryID
  ORDER BY pc.Name, ps.Name, pm.Name, p.Name;
END
GO