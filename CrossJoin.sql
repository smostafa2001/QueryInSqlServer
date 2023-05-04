USE NikamoozDB;
GO

SELECT
	CustomerID, EmployeeID
FROM dbo.Customers
CROSS JOIN dbo.Employees;
GO

SELECT
	C.CustomerID, O.EmployeeID
FROM dbo.Customers AS C
CROSS JOIN dbo.Orders AS O;
GO

SELECT
	CustomerID, EmployeeID
FROM dbo.Customers
CROSS JOIN dbo.Employees
	WHERE CustomerID > 90;
GO