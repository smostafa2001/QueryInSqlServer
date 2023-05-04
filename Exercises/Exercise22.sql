USE NikamoozDB;
GO

SELECT DISTINCT
	E.FirstName, E.LastName
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID
	WHERE O.CustomerID = 18;
GO

SELECT
	E.FirstName, E.LastName
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID
	WHERE O.CustomerID = 18
GROUP BY E.FirstName, E.LastName;
GO

SELECT
	E.FirstName, E.LastName
FROM dbo.Employees AS E
	WHERE E.EmployeeID IN
		(
			SELECT
				O.EmployeeID
			FROM dbo.Orders AS O
			WHERE O.CustomerID = 18
		);
GO

SELECT
	E.FirstName, E.LastName
FROM dbo.Employees AS E
	WHERE EXISTS
		(
			SELECT 1
			FROM dbo.Orders AS O
			WHERE O.CustomerID = 18
			AND E.EmployeeID = O.EmployeeID
		);
GO
