USE NikamoozDB;
GO

WITH CTE
AS
	(
		SELECT
			EmployeeID,
			mgrid,
			FirstName,
			LastName
		FROM dbo.Employees
			WHERE EmployeeID = 9
		UNION ALL
		SELECT
			E.EmployeeID,
			E.mgrid,
			E.FirstName,
			E.LastName
		FROM CTE
		JOIN Employees AS E
			ON CTE.mgrid = E.EmployeeID
		
	)
SELECT * FROM CTE;
GO