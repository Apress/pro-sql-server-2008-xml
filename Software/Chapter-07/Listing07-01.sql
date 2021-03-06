USE AdventureWorks;
GO

SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET NUMERIC_ROUNDABORT OFF;
GO
IF EXISTS (SELECT 1
  FROM sys.indexes i
  WHERE i.name = 'PXML_ProductModel_CatalogDescription')
  DROP INDEX PXML_ProductModel_CatalogDescription
  ON Production.ProductModel;
GO
CREATE PRIMARY XML INDEX PXML_ProductModel_CatalogDescription
ON Production.ProductModel
(
	CatalogDescription
);
GO
