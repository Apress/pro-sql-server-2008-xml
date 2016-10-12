USE AdventureWorks;
GO

WITH Plans(nodeid, 
	physicalop, 
	estimated_cost, 
	plan_handle, 
	text, 
	query_plan, 
	cacheobjtype, 
	objtype)
AS
(
  SELECT RelOp.op.value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/showplan";
    @NodeId', 'int'),
  RelOp.op.value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/showplan";
    @PhysicalOp', 'varchar(50)'),
  RelOp.op.value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/showplan";
	@EstimatedTotalSubtreeCost ', 'float'),
  cp.plan_handle, 
  st.text, 
  qp.query_plan, 
  cp.cacheobjtype, 
  cp.objtype
  FROM sys.dm_exec_cached_plans cp
  CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) st
  CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) qp
  CROSS APPLY qp.query_plan.nodes('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/showplan";
    //RelOp') RelOp (op)
)
SELECT ROW_NUMBER() OVER (PARTITION BY p.plan_handle ORDER BY p.NodeId) AS Operation_Num,
  p.physicalop,
  p.text, 
  p.cacheobjtype, 
  p.objtype,
  p.estimated_cost
FROM Plans p
WHERE p.cacheobjtype = 'Compiled Plan';
GO