USE AdventureWorks;
GO

BULK INSERT Sales.CustomerGeography
FROM 'c:\AWCustGeo.txt'
WITH
(
  FORMATFILE = 'c:\AWCustGeo.fmt'
);
GO