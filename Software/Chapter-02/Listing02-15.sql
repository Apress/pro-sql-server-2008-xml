USE AdventureWorks;
GO
SELECT pm.ProductModelID AS "Model/@ID",
  pm.Name AS "Model/Name",
  pm.rowguid AS "Model/Name/GUID/node()",
  pm.Instructions AS "Model/Instructions/node()"
FROM Production.ProductModel pm
WHERE pm.ProductModelID = 66
  FOR XML PATH;
GO
