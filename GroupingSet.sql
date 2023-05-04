USE NikamoozDB;
GO

SELECT
	EmployeeID,
	CustomerID,
	COUNT(OrderID) AS NUM
FROM dbo.Orders
	WHERE CustomerID IN (1, 2)
GROUP BY EmployeeID, CustomerID;
GO

SELECT
	CustomerID,
	YEAR(OrderDate) AS OrderYear,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE CustomerID IN (1, 2)
GROUP BY CustomerID, YEAR(OrderDate);
GO

SELECT
	EmployeeID,
	YEAR(OrderDate) AS OrderYear,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE CustomerID IN (1, 2)
GROUP BY EmployeeID, YEAR(OrderDate);
GO

SELECT
	EmployeeID,
	CustomerID,
	YEAR(OrderDate) AS OrderYear,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE CustomerID IN (1, 2)
GROUP BY GROUPING SETS
	(
		(EmployeeID, CustomerID),
		(EmployeeID, YEAR(OrderDate)),
		(CustomerID, YEAR(OrderDate))
	);
GO

SELECT
	EmployeeID,
	CustomerID,
	YEAR(OrderDate) AS OrderYear,
	COUNT(OrderID) AS Num
FROM dbo.Orders
	WHERE CustomerID IN (1, 2)
GROUP BY GROUPING SETS
	(
		(EmployeeID, CustomerID),
		(EmployeeID, YEAR(OrderDate)),
		(CustomerID, YEAR(OrderDate))
	)
ORDER BY
	CASE
		WHEN YEAR(OrderDate) IS NULL THEN 1
		WHEN EmployeeID IS NULL THEN 2
		WHEN CustomerID IS NULL THEN 3
	END;
GO

/*
Because the ORDER BY clause consisted of CASE expressions,
T-SQL had to evaluate those expressions for each and every
row in the FROM table. In other words, 
during the Clustered Index Scan of the Contacts table, 
T-SQL would have to compute the CASE expression values. 
And then, only after all rows were evaluated in this manner, 
finally the Sort required by the ORDER BY would take place on
those already-evaluated CASE expressions. So, while it was true 
that the actual ORDER BY Sort logically took place at the end of 
a query operation, the expressions within the ORDER BY list had 
to be evaluated at the beginning of the query operation.
*/

SELECT
	EmployeeID,
	CustomerID,
	YEAR(OrderDate) AS OrderYear,
	GROUPING_ID(EmployeeID, CustomerID, YEAR(OrderDate)) AS GROUPING_ID_Field
FROM dbo.Orders
	WHERE CustomerID IN (1, 2)
GROUP BY GROUPING SETS
	(
		(EmployeeID, CustomerID),
		(EmployeeID, YEAR(OrderDate)),
		(CustomerID, YEAR(OrderDate)),
		()
	)
ORDER BY GROUPING_ID_Field;
GO

SELECT
	EmployeeID,
	CustomerID,
	YEAR(OrderDate) AS OrderYear,
	CASE GROUPING_ID(EmployeeID, CustomerID, YEAR(OrderDate))
		WHEN 4 THEN N'مشتری و سال'
		WHEN 2 THEN N'کارمند و سال'
		WHEN 1 THEN N'کارمند و مشتری'
	END AS N'گروه بندی بر اساس'
FROM dbo.Orders
	WHERE CustomerID IN (1, 2)
GROUP BY GROUPING SETS
	(
		(EmployeeID, CustomerID),
		(EmployeeID, YEAR(OrderDate)),
		(CustomerID, YEAR(OrderDate)),
	);
GO