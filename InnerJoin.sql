USE NikamoozDB;
GO

SELECT
	E.FirstName, E.LastName,
	O.OrderID
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID;
GO

SELECT
	E.FirstName, E.LastName,
	O.OrderID
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID
	WHERE E.LastName LIKE N'[^Ç]%';
GO