USE AdventureWorks;
GO
CREATE TABLE Production.Illustration (
    IllustrationID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Diagram xml,
    ModifiedDate datetime NOT NULL DEFAULT (GETDATE())
);
GO