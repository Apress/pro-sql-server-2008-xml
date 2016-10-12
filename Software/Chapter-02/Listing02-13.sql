USE AdventureWorks;
GO
SELECT d.DepartmentID AS "Department/@ID",
  d.Name AS "Department/Name",
  ',' AS "Department/Name/text()",
  d.GroupName AS "Department/Name/text()"
FROM HumanResources.Department d
WHERE d.DepartmentID IN (1, 2)
  FOR XML PATH;
GO
