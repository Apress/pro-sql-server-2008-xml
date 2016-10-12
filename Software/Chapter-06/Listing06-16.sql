USE AdventureWorks;
GO

SELECT Resume.query ('declare namespace ns = 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
  <contact>
    <name> { 
      sql:column("c.LastName"), 
      sql:column("c.FirstName"), 
      sql:column("c.MiddleName") 
    } </name>
  </contact>')
FROM HumanResources.JobCandidate jc
INNER JOIN HumanResources.Employee e
  ON jc.EmployeeID = e.EmployeeID
INNER JOIN Person.Contact c
  ON e.ContactID = c.ContactID
WHERE jc.EmployeeID = 268;
GO