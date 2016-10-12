USE AdventureWorks;
GO

DECLARE @x xml,
  @y xml;

SET @y = N'<ns:Employment xmlns:ns = 
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume">
      <ns:Emp.StartDate>2001-01-01Z</ns:Emp.StartDate>
      <ns:Emp.EndDate>2007-10-31Z</ns:Emp.EndDate>
      <ns:Emp.OrgName>AdventureWorks</ns:Emp.OrgName>
      <ns:Emp.JobTitle>Vice President of Sales</ns:Emp.JobTitle>
    </ns:Employment>';

SELECT @x = Resume
FROM HumanResources.JobCandidate
WHERE EmployeeID = 268;

SET @x.modify('declare namespace ns =
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
  insert 
    sql:variable("@y")
  before 
    (/ns:Resume/ns:Employment)[1]');

SELECT @x;
GO