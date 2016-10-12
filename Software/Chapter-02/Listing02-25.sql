USE AdventureWorks;
GO
DECLARE @x xml;

SELECT @x = xCol.BulkColumn
FROM OPENROWSET (BULK 'c:\state-list.xml', SINGLE_CLOB) AS xCol;

SELECT @x;
GO
