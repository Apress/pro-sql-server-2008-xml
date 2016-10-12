USE AdventureWorks;
GO
SELECT emp.EmployeeID AS "Employee/@ID",
  emp.HireDate AS "Employee/Hire-Date",
  per.LastName AS "Employee/Name/Last",
  per.FirstName AS "Employee/Name/First",
  per.MiddleName AS "Employee/Name/Middle"
FROM HumanResources.Employee emp
INNER JOIN Person.Contact per
  ON emp.ContactID = per.ContactID
WHERE emp.EmployeeID IN ( 2, 3 )
FOR XML PATH,
  ELEMENTS XSINIL;
GO
