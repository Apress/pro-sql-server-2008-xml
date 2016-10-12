USE AdventureWorks;
GO

/* Inefficient method */
WITH XMLNAMESPACES (DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT Instructions.query('(/root/Location[@SetupHours eq 0.1]/step)')
  AS Step
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;

/* Efficient method */
WITH XMLNAMESPACES (DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT Instructions.query('for $i in (/root/Location)
  let $j := $i/@SetupHours
  where $j eq 0.1
  return $i/step') AS Step
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;
GO