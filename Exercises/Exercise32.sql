SELECT DISTINCT
	O.CustomerID,
	COUNT(O.OrderID) AS Num
FROM dbo.Orders AS O
JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
GROUP BY O.CustomerID, O.OrderID
	HAVING COUNT(O.OrderID) > 5;
GO

SELECT DISTINCT
	(
		SELECT O.CustomerID FROM dbo.Orders AS O
			WHERE O.OrderID = OD.OrderID
	) AS CustomerID,
	COUNT(OD.OrderID) AS Num
FROM dbo.OrderDetails AS OD
GROUP BY OD.OrderID
	HAVING COUNT(OD.OrderID) > 5;
GO

SELECT DISTINCT *
FROM
	(
		SELECT
			O.CustomerID,
			(
				SELECT COUNT(OD.OrderID)
				FROM dbo.OrderDetails AS OD
					WHERE O.OrderID = OD.OrderID
					HAVING COUNT(OD.OrderID) > 5
			) AS Num
		FROM dbo.Orders AS O
		GROUP BY O.CustomerID, O.OrderID
	) AS Tmp
	WHERE Tmp.Num IS NOT NULL;
GO

SELECT DISTINCT *
FROM
	(
		SELECT
			O.CustomerID,
			(
				SELECT COUNT(OD.OrderID)
				FROM dbo.OrderDetails AS OD
					WHERE O.OrderID = OD.OrderID
			) AS Num
		FROM dbo.Orders AS O
		GROUP BY O.CustomerID, O.OrderID
	) AS Tmp
	WHERE Tmp.Num > 5;
GO

SELECT Tmp.CustomerID, Tmp.Num
FROM
	(
		SELECT
			O.CustomerID,
			(
				SELECT COUNT(OD.OrderID)
				FROM dbo.OrderDetails AS OD
					WHERE O.OrderID = OD.OrderID
			) AS Num
		FROM dbo.Orders AS O
		GROUP BY O.CustomerID, O.OrderID
	) AS Tmp
	WHERE Tmp.Num > 5
GROUP BY Tmp.CustomerID, Tmp.Num;
GO