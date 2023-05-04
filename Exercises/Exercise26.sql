USE NikamoozDB;
GO

--ERROR!
--SELECT
--	ProductID, UnitPrice
--FROM dbo.Products
--GROUP BY ProductID
--	HAVING UnitPrice >= AVG(UnitPrice);
--GO

--THE RESULT IS INCORRECT!
--SELECT
--	ProductID, UnitPrice
--FROM dbo.Products
--GROUP BY ProductID, UnitPrice
--	HAVING UnitPrice >= AVG(UnitPrice);
--GO

SELECT
	P1.ProductID, P1.UnitPrice
FROM dbo.Products AS P1
	WHERE P1.UnitPrice >= 
		(SELECT AVG(UnitPrice) FROM dbo.Products AS P2);
GO

SELECT
	P1.ProductID, P1.UnitPrice
FROM dbo.Products AS P1
	WHERE P1.ProductID IN 
		(
			SELECT
				ProductID
			FROM dbo.Products AS P2
				WHERE P2.UnitPrice >= 
					(
						SELECT
							AVG(UnitPrice)
						FROM dbo.Products AS P3
					)
		);
GO

SELECT
	P1.ProductID, P1.UnitPrice
FROM dbo.Products AS P1
	WHERE EXISTS
		(
			SELECT 1
			FROM dbo.Products AS P2
				WHERE P2.UnitPrice >=
					(
						SELECT	AVG(UnitPrice)
						FROM dbo.Products
					) AND P1.ProductID = P2.ProductID
		);
GO