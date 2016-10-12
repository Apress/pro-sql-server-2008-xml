USE AdventureWorks;
GO
/* Inefficient method */
WITH XMLNAMESPACES (DEFAULT 
  'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT CAST(
    CAST(
      Instructions.query(N'fn:data(/root/Location/@LaborHours)[1]') 
    AS varchar(10)) 
  AS numeric(4, 1))
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;

/* Efficient method */
WITH XMLNAMESPACES (DEFAULT 
  'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT Instructions.value(N'fn:data(/root/Location/@LaborHours)[1]',
  N'numeric(4, 1)')
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;
GO
