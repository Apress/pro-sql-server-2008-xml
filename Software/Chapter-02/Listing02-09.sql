USE	AdventureWorks;
GO
SELECT AddressID,
  AddressLine1,
  AddressLine2,
  City
FROM Person.Address
WHERE AddressID IN ( 532, 533 )
  FOR XML AUTO;
GO
