USE AdventureWorks;
GO

DECLARE @x xml;

SELECT @x = Resume
FROM HumanResources.JobCandidate
WHERE EmployeeID = 268;

SET @x.modify('declare namespace ns = 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
  replace value of (/ns:Resume/ns:Name/ns:Name.Middle/text())[1]
  with ("Yancy")');

SELECT @x;
GO