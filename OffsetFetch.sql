USE NikamoozDB;
GO

SELECT
	TOP (10) OrderID, OrderDate, CustomerID, EmployeeID
FROM dbo.Orders
ORDER BY OrderDate DESC;
GO

SELECT
	 OrderID, OrderDate, CustomerID, EmployeeID
FROM dbo.Orders
ORDER BY OrderDate DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
GO

SELECT
	OrderID, OrderDate, CustomerID, EmployeeID
FROM dbo.Orders
ORDER BY OrderDate DESC
OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;
GO

SELECT
	OrderID, OrderDate, CustomerID, EmployeeID
FROM dbo.Orders
ORDER BY OrderDate DESC, OrderID DESC
OFFSET 10 ROWS;
GO

--FETCH WITHOUT OFFSET CAN'T BE EXECUTED!

/*
1- FROM
2- WHERE
3- GROUP BY
4- HAVING
5- SELECT
	5-1 EXPRESSIONS
	5-2 DISTINCT
6- ORDER BY
7- TOP/OFFSET-FETCH
*/