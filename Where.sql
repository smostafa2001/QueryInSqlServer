USE NikamoozDB;
GO

SELECT
	OrderID, CustomerID
FROM dbo.Orders
	WHERE CustomerID = 71;
GO

SELECT
	OrderID, OrderDate
FROM dbo.Orders
	WHERE OrderID IN (10248, 10253, 10320);
GO

SELECT
	OrderID, OrderDate
FROM dbo.Orders
	WHERE OrderID NOT IN (10248, 10253, 10320);
GO

SELECT
	OrderID, EmployeeID
FROM dbo.Orders
	WHERE EmployeeID BETWEEN 3 AND 7;
GO

SELECT
	OrderID, EmployeeID
FROM dbo.Orders
	WHERE EmployeeID IN (3, 4, 5, 6, 7);
GO

SELECT
	FirstName, LastName
FROM dbo.Employees
	WHERE LastName LIKE N'ا%';
GO

SELECT
	FirstName, LastName
FROM dbo.Employees
	WHERE LastName LIKE N'[^ا]%';
GO

SELECT
	FirstName, LastName
FROM dbo.Employees
	WHERE LastName NOT LIKE N'ا%';
GO

SELECT
	FirstName, LastName
FROM dbo.Employees
	WHERE LastName LIKE N'%ی';
GO

SELECT
	FirstName, LastName
FROM dbo.Employees
	WHERE LastName LIKE N'[ا-پ]%';
GO

SELECT
	FirstName, LastName
FROM dbo.Employees
	WHERE FirstName LIKE N'س__';
GO

SELECT
	OrderID, EmployeeID, OrderDate
FROM dbo.Orders
	WHERE OrderDate >= '20160430'
GO

SELECT
	OrderID, EmployeeID, OrderDate
FROM dbo.Orders
	WHERE OrderDate >= '20160430'
	AND EmployeeID IN (1, 2, 3);
GO

SELECT
	OrderID, EmployeeID, OrderDate
FROM dbo.Orders
	WHERE OrderDate >= '20160430'
	OR EmployeeID IN (1, 2, 3);
GO

SELECT
	OrderID, ProductID, Qty, UnitPrice, Discount,
	Qty * UnitPrice * (1 - Discount) AS VAL
FROM dbo.OrderDetails;
GO

SELECT
	OrderID, CustomerID, EmployeeID, OrderDate
FROM dbo.Orders
	WHERE CustomerID = 1
	AND EmployeeID IN (1, 3, 5)
	OR CustomerID = 85
	AND EmployeeID IN (2, 4, 6)
GO

SELECT
	OrderID, CustomerID, EmployeeID, OrderDate
FROM dbo.Orders
	WHERE 
			(CustomerID = 1
			AND
			EmployeeID IN (1, 3, 5))
		OR
			(CustomerID = 85
			AND 
			EmployeeID IN (2, 4, 6))
GO