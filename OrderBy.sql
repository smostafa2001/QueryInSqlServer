USE NikamoozDB;
GO

SELECT
	EmployeeID, YEAR(OrderDate) AS OrderYear
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
	EmployeeID, YEAR(OrderDate) AS OrderYear
FROM dbo.Orders
	WHERE CustomerID = 71
ORDER BY OrderYear DESC;
GO

SELECT
	EmployeeID, Region, City
FROM dbo.Employees
ORDER BY Region, City;
GO

SELECT
	EmployeeID, FirstName, LastName, [State]
FROM dbo.Employees
ORDER BY City;
GO