USE NikamoozDB;
GO

SELECT
	E1.EmployeeID AS E1_Emp, E2.EmployeeID AS E2_Emp
FROM dbo.Employees AS E1
CROSS APPLY
	dbo.Employees AS E2;
GO

SELECT
	TOP(3) O.CustomerID, O.OrderID, O.OrderDate
FROM dbo.Orders AS O
	WHERE O.CustomerID = 1
ORDER BY O.OrderDate DESC;
GO

SELECT
	C.CustomerID, C.CompanyName, Tmp.OrderID
FROM dbo.Customers AS C
CROSS APPLY
	(
		SELECT
			TOP(3) O.OrderID
		FROM dbo.Orders AS O
			WHERE O.CustomerID = C.CustomerID
	) AS Tmp;
GO

SELECT
	C.CustomerID, C.CompanyName, Tmp.OrderID
FROM dbo.Customers AS C
OUTER APPLY
	(
		SELECT
			TOP(3) O.OrderID
		FROM dbo.Orders AS O
			WHERE O.CustomerID = C.CustomerID
	) AS Tmp;
GO

SELECT
	C.CustomerID, C.CompanyName
FROM dbo.Customers AS C
CROSS APPLY dbo.Top_Orders(C.CustomerID, 4);