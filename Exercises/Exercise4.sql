SELECT
	E1.EmployeeID, E1.FirstName, E1.LastName,
	E2.EmployeeID, E2.FirstName, E2.LastName
FROM dbo.Employees AS E1
INNER JOIN dbo.Employees AS E2
	ON E1.EmployeeID <> E2.EmployeeID
ORDER BY E1.EmployeeID
GO