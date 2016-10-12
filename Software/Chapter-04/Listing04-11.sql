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
  p.SizeUnitMeasureCode AS "unit-of-measure",
  (
    SELECT b.ComponentID AS "@id",
      p.ProductNumber AS "@number",
      p.Name AS "name",
      p.Color AS "color",
      p.ListPrice AS "list-price",
      b.PerAssemblyQty AS "quantity",
      p.Size AS "size",
      p.SizeUnitMeasureCode AS "unit-of-measure",
      (
        SELECT c.ComponentID AS "@id",
          p.ProductNumber AS "@number",
          p.Name AS "name",
          p.Color AS "color",
          p.ListPrice AS "list-price",
          c.PerAssemblyQty AS "quantity",
          p.Size AS "size",
          p.SizeUnitMeasureCode AS "unit-of-measure",
          (
            SELECT d.ComponentID AS "@id",
              p.ProductNumber AS "@number",
              p.Name AS "name",
              p.Color AS "color",
              p.ListPrice AS "list-price",
              d.PerAssemblyQty AS "quantity",
              p.Size AS "size",
              p.SizeUnitMeasureCode AS "unit-of-measure",
              (  
                SELECT e.ComponentID AS "@id",
                  p.ProductNumber AS "@number",
                  p.Name AS "name",
                  p.Color AS "color",
                  p.ListPrice AS "list-price",
                  e.PerAssemblyQty AS "quantity",
                  p.Size AS "size",
                  p.SizeUnitMeasureCode AS "unit-of-measure"
                FROM Production.BillOfMaterials e 
                INNER JOIN Production.Product p 
                  ON e.ComponentID = p.ProductID 
                WHERE e.ProductAssemblyID = d.ComponentID 
                FOR XML PATH (N'item'), TYPE
              )
            FROM Production.BillOfMaterials d 
            INNER JOIN Production.Product p 
              ON d.ComponentID = p.ProductID 
            WHERE d.ProductAssemblyID = c.ComponentID 
            FOR XML PATH (N'item'), TYPE
          )
        FROM Production.BillOfMaterials c 
        INNER JOIN Production.Product p 
          ON c.ComponentID = p.ProductID 
        WHERE c.ProductAssemblyID = b.ComponentID 
        FOR XML PATH (N'item'), TYPE
      )
    FROM Production.BillOfMaterials b 
    INNER JOIN Production.Product p 
      ON b.ComponentID = p.ProductID 
    WHERE b.ProductAssemblyID = a.ComponentID 
    FOR XML PATH(N'item'), TYPE
  )
FROM Production.BillOfMaterials a 
INNER JOIN Production.Product p 
  ON a.ComponentID = p.ProductID 
WHERE p.ProductID = @ProductID
FOR XML PATH(N'item'), ROOT(N'items'), TYPE;
GO