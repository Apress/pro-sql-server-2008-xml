USE AdventureWorks;
GO
CREATE TABLE Production.ProductModel(
    ProductModelID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] name NOT NULL,
    CatalogDescription xml (CONTENT 
        Production.ProductDescriptionSchemaCollection),
    Instructions xml (CONTENT
        Production.ManuInstructionsSchemaCollection),
    rowguid uniqueidentifier ROWGUIDCOL NOT NULL DEFAULT (NEWID()),
    ModifiedDate datetime NOT NULL DEFAULT (GETDATE())
);
GO