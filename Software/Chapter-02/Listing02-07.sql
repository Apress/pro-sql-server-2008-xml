USE AdventureWorks;
GO
SELECT d.DepartmentID,
  d.Name,
  d.GroupName
FROM HumanResources.Department d
WHERE d.DepartmentID IN ( 7, 8 )
  FOR XML RAW,
  ELEMENTS,
  XMLDATA;
GO

