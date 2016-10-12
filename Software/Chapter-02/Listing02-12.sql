USE AdventureWorks;
GO
SELECT 1 AS Tag,
  NULL AS Parent,
  p.ProductID AS [Product!1!ID],
  p.Name AS [Product!1!Name],
  p.ProductNumber AS [Product!1!Number],
  NULL AS [Quantity!2]
FROM Production.Product p
WHERE p.ProductID IN ( 770, 772 )
UNION ALL
SELECT 2 AS Tag,
  1 AS Parent,
  p.ProductID,
  p.Name,
  p.ProductNumber,
  pi.Quantity
FROM Production.ProductInventory pi
INNER JOIN Production.Product p
  ON p.ProductID = pi.ProductID
WHERE p.ProductID IN ( 770, 772 )
ORDER BY [Product!1!ID], [Product!1!Number], [Quantity!2]
  FOR XML EXPLICIT;
GO