USE AdventureWorks;
GO
SELECT e.EmployeeID AS "Employee/@ID",
  c.FirstName AS "Employee/Name/First",
  c.LastName AS "Employee/Name/Last",
  (
      SELECT eph.RateChangeDate AS "data()"
      FROM HumanResources.EmployeePayHistory eph
      WHERE eph.EmployeeID = e.EmployeeID
      FOR XML PATH ('')
  ) AS "Employee/Rate-Change-Dates"
FROM HumanResources.Employee e
INNER JOIN Person.Contact c
  ON e.ContactID = c.ContactID
WHERE e.EmployeeID IN ( 6, 24 )
  FOR XML PATH;
GO