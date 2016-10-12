USE AdventureWorks;
GO
/* Inefficient version */
WITH XMLNAMESPACES (DEFAULT 
  'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT Instructions.query('(//tool/..)') AS ToolStep
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;

/* Efficient version */
WITH XMLNAMESPACES (DEFAULT
  'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT Instructions.query('(//step[fn:not(fn:empty(./tool))])') AS ToolStep
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;
GO