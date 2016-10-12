USE AdventureWorks;
GO
-- First, retrieve an XML document from the Production.ProductModel table
DECLARE @x xml;

SELECT @x = pm.Instructions
FROM Production.ProductModel pm
WHERE pm.ProductModelID = 10;

-- Now create a document handle to the XML document
DECLARE @idoc int;

EXECUTE sp_xml_preparedocument @idoc OUTPUT, @x, 
    '<ns xmlns:a="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions" />';

-- The next step is to query the XML document using OPENXML
SELECT [Station], [Text]
FROM OPENXML(@idoc, '//a:Location/a:step', 3)
WITH (
    [Station] int '../@LocationID',
    [Text] nvarchar(max) '.'
);

-- Finally, remove the XML document from memory
EXECUTE sp_xml_removedocument @idoc;
GO