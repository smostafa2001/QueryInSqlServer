USE NikamoozDB;
GO

DROP VIEW IF EXISTS dbo.VJ_Employee_Orders;
GO

CREATE VIEW dbo.VJ_Employee_Orders
AS
	(
		SELECT
			O.EmployeeID,
			YEAR(O.OrderDate) AS OrderYear,
			SUM(OD.Qty) AS Qty
		FROM dbo.Orders AS O
		JOIN dbo.OrderDetails AS OD
			ON O.OrderID = OD.OrderID
		GROUP BY O.EmployeeID, YEAR(O.OrderDate)
	);
GO

SELECT * FROM dbo.VJ_Employee_Orders
ORDER BY EmployeeID, OrderYear;
GO

SELECT
	V1.EmployeeID, V1.OrderYear, V1.Qty, SUM(V2.Qty) AS Total
FROM dbo.VJ_Employee_Orders AS V1
JOIN dbo.VJ_Employee_Orders AS V2
	ON V1.EmployeeID = V2.EmployeeID
	AND V1.OrderYear >= V2.OrderYear
GROUP BY V1.EmployeeID, V1.OrderYear, V1.Qty
ORDER BY V1.EmployeeID, V1.OrderYear;;
GO

DROP VIEW IF EXISTS dbo.VS_Employee_Orders;
GO

CREATE VIEW dbo.VS_Employee_Orders
AS
	(
		SELECT
			O.EmployeeID,
			YEAR(O.OrderDate) AS OrderYear,
			(
				SELECT SUM(OD.Qty)
				FROM dbo.OrderDetails AS OD
					WHERE
						EXISTS
							(
								SELECT 1
								FROM dbo.Orders AS O1
									WHERE YEAR(O1.OrderDate) = YEAR(O.OrderDate)
									AND OD.OrderID = O1.OrderID
									AND O1.EmployeeID = O.EmployeeID
							)
			) AS Qty
		FROM dbo.Orders AS O
		GROUP BY O.EmployeeID, YEAR(O.OrderDate)
	)
GO

SELECT * FROM dbo.VS_Employee_Orders
ORDER BY EmployeeID;
GO

SELECT
	V1.EmployeeID, V1.OrderYear, V1.Qty, SUM(V2.Qty) AS Total
FROM dbo.VS_Employee_Orders AS V1
JOIN dbo.VS_Employee_Orders AS V2
	ON V1.EmployeeID = V2.EmployeeID
	AND V1.OrderYear >= V2.OrderYear
GROUP BY V1.EmployeeID, V1.OrderYear, V1.Qty
ORDER BY V1.EmployeeID, V1.OrderYear;;
GO

SELECT
	O.EmployeeID,
	YEAR(O.OrderDate) AS OrderYear,
	(
		SELECT SUM(OD.Qty)
		FROM dbo.OrderDetails AS OD
			WHERE O.OrderID = OD.OrderID
	) AS Qty
FROM dbo.Orders AS O;
GO

DROP VIEW IF EXISTS dbo.VDT_Employee_Orders;
GO

CREATE VIEW dbo.VDT_Employee_Orders
AS
	SELECT
		Tmp.EmployeeID,
		Tmp.OrderYear,
		SUM(Tmp.Qty) AS Qty
	FROM
		(
			SELECT
				O.EmployeeID,
				YEAR(O.OrderDate) AS OrderYear,
				(
					SELECT SUM(OD.Qty)
					FROM dbo.OrderDetails AS OD
						WHERE O.OrderID = OD.OrderID
				) AS Qty
			FROM dbo.Orders AS O
		) AS Tmp
	GROUP BY Tmp.EmployeeID, Tmp.OrderYear;
GO

SELECT
	V1.EmployeeID, V1.OrderYear, V1.Qty,
	SUM(V2.Qty) AS Total
FROM dbo.VDT_Employee_Orders AS V1
JOIN dbo.VDT_Employee_Orders AS V2
	ON V1.EmployeeID = V2.EmployeeID
	AND V1.OrderYear >= V2.OrderYear
GROUP BY V1.EmployeeID, V1.OrderYear, V1.Qty
ORDER BY V1.EmployeeID;

SELECT
	V.EmployeeID, V.OrderYear, V.Qty,
	SUM(V.Qty)
		OVER
		(
			PARTITION BY V.EmployeeID
			ORDER BY V.OrderYear
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		) AS Total
FROM dbo.VJ_Employee_Orders AS V;
GO