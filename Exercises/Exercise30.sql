USE NikamoozDB;
GO

SELECT 
	C.City, 
	COUNT(CustomerID) AS Num
FROM dbo.Customers AS C
GROUP BY C.City
	HAVING COUNT(C.CustomerID) >
		(
			SELECT COUNT(C1.CustomerID)
			FROM dbo.Customers AS C1
				WHERE C1.City = N'”„‰«‰'
		);
GO