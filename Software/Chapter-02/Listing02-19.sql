USE AdventureWorks;
GO
WITH XMLNAMESPACES(
  N'http://www.microsoft.com/AdventureWorksDB/Person' AS ns1,
  N'http://www.microsoft.com/AdventureWorksDB/Email' AS ns2
)
SELECT c.ContactID AS "ns1:Person/@ID",
  c.LastName AS "ns1:Person/ns1:Name/ns1:Last",
  c.FirstName AS "ns1:Person/ns1:Name/ns1:First",
  c.EmailAddress AS "ns1:Person/ns2:Email"
FROM Person.Contact c
WHERE c.ContactID = 775
  FOR XML PATH;
GO