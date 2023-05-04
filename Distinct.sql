USE NikamoozDB;
GO

SELECT
	EmployeeID
FROM dbo.Orders
	WHERE CustomerID = 71;
GO

SELECT
	DISTINCT EmployeeID
FROM dbo.Orders
	WHERE CustomerID = 71;
GO

SELECT
	EmployeeID, YEAR(OrderDate) AS OrderYear
FROM dbo.Orders
	WHERE CustomerID = 71
ORDER BY EmployeeID;
GO

SELECT
	DISTINCT EmployeeID, YEAR(OrderDate) AS OrderYear
FROM dbo.Orders
	WHERE CustomerID = 71
ORDER BY EmployeeID;
GO

SELECT
	DISTINCT [State]
FROM dbo.Employees;
GO

SELECT
	DISTINCT [State], EmployeeID
FROM dbo.Employees
ORDER BY EmployeeID;
GO

SELECT
	DISTINCT [State], EmployeeID
FROM dbo.Employees
ORDER BY EmployeeID;
GO