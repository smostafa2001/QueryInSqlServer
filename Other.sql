USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.ODetails;

SELECT * INTO dbo.ODetails FROM dbo.OrderDetails;

UPDATE OD
	SET Discount += 0.05
FROM dbo.ODetails AS OD
JOIN dbo.Orders AS O
	ON OD.OrderID = O.OrderID
	WHERE O.CustomerID = 1;
GO

WITH C AS
(
	SELECT
		O.CustomerID, OD.OrderID, OD.ProductID, 
		OD.Discount, OD.Discount + 0.05 AS NewDiscount
	FROM dbo.ODetails AS OD
	JOIN dbo.Orders AS O
		ON OD.OrderID = O.OrderID
		WHERE O.CustomerID = 1
)
UPDATE C
	SET Discount = NewDiscount;
GO

UPDATE Tmp
	SET Discount = NewDiscount
FROM
(
	SELECT
		CustomerID, OD.OrderID, OD.ProductID,
		OD.Discount, OD.Discount + 0.05 AS NewDiscount
	FROM dbo.ODetails AS OD
	JOIN dbo.Orders AS O
		ON OD.OrderID = O.OrderID
		WHERE O.CustomerID = 1
) AS Tmp;
GO

DROP TABLE IF EXISTS dbo.Orders1;
GO

SELECT * INTO dbo.Orders1 FROM dbo.Orders;
GO

DELETE TOP(50) FROM dbo.Orders1
ORDER BY OrderID DESC;
GO

DELETE TOP(50) FROM dbo.Orders1;
GO

WITH CTE AS
(
	SELECT TOP(50) * FROM dbo.Orders1
	ORDER BY OrderID
)
DELETE FROM CTE;
GO

WITH CTE AS
(
	SELECT * FROM dbo.Orders1
	ORDER BY OrderID
	OFFSET 0 ROWS FETCH FIRST 50 ROWS ONLY
)
DELETE FROM CTE;
GO