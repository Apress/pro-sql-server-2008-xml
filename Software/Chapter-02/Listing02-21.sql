USE AdventureWorks;
GO
DECLARE @ComponentID AS int;
SET @ComponentID = 749;

WITH BOMCTE(ProductAssemblyID, ComponentID, Qty, BOMLevel, RecursionLevel)
AS
(
  SELECT ProductAssemblyID,
    ComponentID, 
    CAST(PerAssemblyQty AS integer), 
    BOMLevel, 
    0
  FROM Production.BillOfMaterials
  WHERE ComponentID = @ComponentID
    AND ProductAssemblyID IS NULL
    AND EndDate IS NULL

  UNION ALL

  SELECT BOM.ProductAssemblyID,
    BOM.ComponentID, 
    CAST(BOMCTE.Qty * BOM.PerAssemblyQty AS integer), 
    BOM.BOMLevel, 
    BOMCTE.RecursionLevel + 1
  FROM BOMCTE
    JOIN Production.BillOfMaterials AS BOM
      ON BOM.EndDate IS NULL
      AND BOM.ProductAssemblyID = BOMCTE.ComponentID
)
SELECT B.ProductAssemblyID, 
  B.ComponentID, 
  P.Name AS [ProductDescription], 
  P.StandardCost, 
  P.ListPrice, 
  B.Qty,
  B.BOMLevel,
  B.RecursionLevel
FROM BOMCTE AS B
INNER JOIN Production.Product AS P
  ON P.ProductID = B.ComponentID
FOR XML PATH(N'item'), 
  ROOT('items'), 
  ELEMENTS;
GO
