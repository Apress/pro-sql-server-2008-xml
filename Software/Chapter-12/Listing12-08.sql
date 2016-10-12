USE AdventureWorks;
GO

CREATE TABLE Sales.CustomerGeography (
  CustomerID INT NOT NULL PRIMARY KEY,
  Latitude NUMERIC (15, 6),
  Longitude NUMERIC (15, 6),
  Resolution VARCHAR(20)
);
GO