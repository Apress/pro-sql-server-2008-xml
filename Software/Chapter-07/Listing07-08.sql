USE AdventureWorks;
GO

ALTER INDEX SXML_ProductModel_Instructions_PATH
ON Production.ProductModel
REBUILD WITH
(
  SORT_IN_TEMPDB = ON,
  MAXDOP = 1,
  FILLFACTOR = 80,
  PAD_INDEX = ON
);
GO