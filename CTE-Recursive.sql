USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.Digits;

CREATE TABLE Digits
(
	Num TINYINT
);
GO

INSERT dbo.Digits
	VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);
GO

SELECT
	(D1.Num + 1) + (D2.Num * 10) + (D3.Num * 100) AS Num
FROM dbo.Digits AS D1
CROSS JOIN dbo.Digits AS D2
CROSS JOIN dbo.Digits AS D3
ORDER BY Num;
GO

SELECT Tmp1.Num
FROM (SELECT 1 AS Num UNION ALL SELECT 1) AS Tmp1
CROSS JOIN (SELECT 1 AS Num UNION ALL SELECT 1) AS Tmp2
CROSS JOIN (SELECT 1 AS Num UNION ALL SELECT 1) AS Tmp3
CROSS JOIN (SELECT 1 AS Num UNION ALL SELECT 1) AS Tmp4;
GO

WITH
	CTE1
	AS
	(
		SELECT 1 AS Num UNION ALL SELECT 1
	),
	CTE2
	AS
	(
		SELECT C1.Num FROM CTE1 AS C1 CROSS JOIN CTE1 AS C2
	),
	CTE3
	AS
	(
		SELECT C1.Num FROM CTE2 AS C1 CROSS JOIN CTE2 AS C2
	)
	SELECT Num FROM CTE3;
GO

WITH CTE
AS
(
	SELECT 1 AS Num1
	UNION ALL
	SELECT Num1 + 1 AS Num2
	FROM CTE
		WHERE Num1 < 1000
)
SELECT * FROM CTE
OPTION(MAXRECURSION 1000);
GO

DROP TABLE IF EXISTS #Tbl;

CREATE TABLE #Tbl
(
	EmployeeID INT,
	Mgrid TINYINT,
	FirstName NVARCHAR(100), LastName NVARCHAR(100)
);

INSERT INTO #Tbl
	SELECT
		EmployeeID, mgrid, FirstName, LastName
	FROM dbo.Employees
		WHERE EmployeeID = 2;

SELECT * FROM #Tbl;

INSERT INTO #Tbl
	SELECT
		E.EmployeeID, E.mgrid, E.FirstName, E.LastName
	FROM #Tbl AS T
	JOIN dbo.Employees AS E
		ON T.EmployeeID = E.mgrid;
GO

WITH Employees_CTE
AS
(
	SELECT
		EmployeeID, mgrid, FirstName, LastName
	FROM dbo.Employees
		WHERE EmployeeID = 2
	UNION ALL
	SELECT
		E.EmployeeID, E.mgrid, E.FirstName, E.LastName
	FROM Employees_CTE AS ECTE
	JOIN dbo.Employees AS E
		ON E.mgrid = ECTE.EmployeeID
)
SELECT
	EmployeeID, mgrid, FirstName, LastName
FROM Employees_CTE;
GO