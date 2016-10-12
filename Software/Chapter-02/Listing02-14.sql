USE AdventureWorks;
GO
SELECT p.ModifiedDate AS "comment()",
  p.AddressID AS "Address/@ID",
  p.AddressLine1 AS "Address/Street",
  p.City AS "Address/City",
  sp.StateProvinceCode AS "Address/State",
  sp.Name AS "Address/State/comment()",
  p.PostalCode AS "Address/Postal-Code"
FROM Person.Address p
INNER JOIN Person.StateProvince sp
  ON p.StateProvinceID = sp.StateProvinceID
WHERE p.AddressID IN (25, 178)
  FOR XML PATH;
GO