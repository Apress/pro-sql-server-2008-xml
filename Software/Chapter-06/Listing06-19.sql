USE AdventureWorks;
GO

DECLARE @x xml;

SELECT @x = Resume
FROM HumanResources.JobCandidate
WHERE EmployeeID = 268;

SET @x.modify('declare namespace ns = 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
  delete (/ns:Resume/ns:Address/ns:Addr.Telephone/ns:Telephone
    [./ns:Tel.Number = "555-1981"])[1]');

SELECT @x;
GO