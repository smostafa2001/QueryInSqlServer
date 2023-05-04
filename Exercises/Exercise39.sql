USE NikamoozDB;
GO

WITH Employees_CTE
AS
	(
		SELECT
			EmployeeID, mgrid, FirstName, LastName, 1 AS Employee_Level
		FROM dbo.Employees
			WHERE EmployeeID = 2
		UNION ALL
		SELECT
			E.EmployeeID, E.mgrid, E.FirstName, E.LastName, Emp_CTE.Employee_Level + 1
		FROM Employees_CTE AS Emp_CTE
		JOIN dbo.Employees AS E
			ON E.mgrid = Emp_CTE.EmployeeID
	)
SELECT
	EmployeeID, mgrid, FirstName, LastName, Employee_Level
FROM Employees_CTE;
GO