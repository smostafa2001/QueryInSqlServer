USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.Insert_Select;
GO

CREATE TABLE dbo.Insert_Select
(
	CustomerID INT,
	LastName NVARCHAR(50),
	City NVARCHAR(20)
);
GO

SELECT DISTINCT
	C.CustomerID, C.City, E.LastName
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
	ON O.CustomerID = C.CustomerID
JOIN dbo.Employees AS E
	ON E.EmployeeID = O.EmployeeID
	WHERE C.City = N' Â—«‰';
GO

INSERT INTO dbo.Insert_Select
	SELECT
		C.CustomerID, Tmp.LastName, C.City
	FROM dbo.Customers AS C
	CROSS APPLY
		(
			SELECT E.LastName
			FROM dbo.Employees AS E
			WHERE EXISTS
			(
				SELECT 1
				FROM dbo.Orders AS O
					WHERE
						O.EmployeeID = E.EmployeeID
						AND
						O.CustomerID = C.CustomerID
						AND
						C.City = N' Â—«‰'
			)
		) AS Tmp
	ORDER BY C.CustomerID;
GO

SELECT * FROM dbo.Insert_Select
ORDER BY CustomerID;
GO