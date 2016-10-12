USE AdventureWorks;
GO

/* Inefficient method */
WITH XMLNAMESPACES (DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT CASE 
  WHEN Instructions.value('fn:data(/root/Location/@LaborHours)[1]',
    N'numeric(4, 1)') IN (0.5, 1.0) THEN 'Easy'
  WHEN Instructions.value('fn:data(/root/Location/@LaborHours)[1]',
    N'numeric(4, 1)') IN (1.5, 2.0) THEN 'Medium'
  WHEN Instructions.value('fn:data(/root/Location/@LaborHours)[1]',
    N'numeric(4, 1)') IN (2.5, 3.0) THEN 'Hard'
  END AS TaskLevel
FROM Production.ProductModel
WHERE Instructions IS NOT NULL;

/* Efficient method */
WITH XMLNAMESPACES (DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions')
SELECT CASE 
    WHEN Labor.LaborHours IN (0.5, 1.0) THEN 'Easy'
    WHEN Labor.LaborHours IN (1.5, 2.0) THEN 'Medium'
    WHEN Labor.LaborHours IN (2.5, 3.0) THEN 'Hard'
  END AS TaskLevel
FROM (
  SELECT Instructions.value('fn:data(/root/Location/@LaborHours)[1]',
    N'numeric(4, 1)') AS LaborHours
  FROM Production.ProductModel
  WHERE Instructions IS NOT NULL
) AS Labor;
GO