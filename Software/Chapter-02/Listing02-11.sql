USE AdventureWorks;
GO
SELECT dep.DepartmentID,
  dep.Name,
  emp.EmployeeID
FROM HumanResources.Department dep
INNER JOIN HumanResources.EmployeeDepartmentHistory emp
  ON dep.DepartmentID = emp.DepartmentID
WHERE emp.EmployeeID BETWEEN 20 AND 22 
  FOR XML AUTO,
  ELEMENTS;
GO
