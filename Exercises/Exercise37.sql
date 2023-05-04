USE NikamoozDB;
GO

SELECT
	E.EmployeeID, OE.NumOrders, OE.MaxDate,
	OM.EmployeeID, OM.NumOrders, OM.MaxDate 
FROM dbo.Employees AS E
JOIN
	(
		SELECT
			EmployeeID, COUNT(*) AS NumOrders, MAX(OrderDate) AS MaxDate
		FROM dbo.Orders
		GROUP BY EmployeeID
	) AS OE
	ON E.EmployeeID = OE.EmployeeID
LEFT JOIN
	(
		SELECT
			EmployeeID, COUNT(*) AS NumOrders, MAX(OrderDate) AS MaxDate
		FROM dbo.Orders
		GROUP BY EmployeeID
	) AS OM
	ON E.mgrid = OM.EmployeeID;
GO

WITH CTE
AS
	(
		SELECT
			EmployeeID, COUNT(*) AS NumOrders, MAX(OrderDate) AS MaxDate
		FROM dbo.Orders
		GROUP BY EmployeeID
	)
SELECT
	E.EmployeeID, OE.NumOrders, OE.MaxDate,
	OM.EmployeeID, OM.NumOrders, OM.MaxDate 
FROM dbo.Employees AS E
JOIN CTE AS OE
	ON E.EmployeeID = OE.EmployeeID
LEFT JOIN CTE AS OM
	ON E.mgrid = OM.EmployeeID;
GO

WITH EmployeeCountMax
AS
	(
		SELECT
			EmployeeID,
			COUNT(*) AS NumOrders,
			MAX(OrderDate) AS MaxDate,
			(
				SELECT E.mgrid
				FROM dbo.Employees AS E
					WHERE E.EmployeeID = O.EmployeeID
			) AS Mgrid
		FROM dbo.Orders AS O
		GROUP BY EmployeeID
	)
SELECT
	ECM1.EmployeeID, 
	ECM1.NumOrders, 
	ECM1.MaxDate,
	ECM1.Mgrid,
	ECM2.NumOrders, 
	ECM2.MaxDate
FROM EmployeeCountMax AS ECM1
LEFT JOIN EmployeeCountMax AS ECM2
	ON ECM1.Mgrid = ECM2.EmployeeID;
GO