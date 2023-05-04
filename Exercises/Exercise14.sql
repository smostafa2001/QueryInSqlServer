USE NikamoozDB;
GO

SELECT
	EmployeeID, FirstName, LastName
FROM dbo.Employees
EXCEPT
SELECT
	E.EmployeeID, E.FirstName, E.LastName
FROM dbo.Employees AS E
JOIN dbo.Orders AS O
	ON E.EmployeeID = O.EmployeeID
	WHERE O.OrderDate > '2016-05-01';
GO