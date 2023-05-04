USE NikamoozDB;
GO

SELECT
	 [State], Region, CitY
FROM dbo.Employees
INTERSECT
SELECT
	[State], Region, City 
FROM dbo.Customers;
GO

DROP TABLE IF EXISTS IntersectTbl1, IntersectTbl2;

CREATE TABLE IntersectTbl1
(
	[State] NVARCHAR(20),
	City NVARCHAR(20)
);
GO

CREATE TABLE IntersectTbl2
(
	[State] NVARCHAR(20),
	City NVARCHAR(20)
);
GO

INSERT INTO IntersectTbl1
	VALUES
	(N'تهران', N'تهران'),
	(N'گیلان', NULL),
	(N'خوزستان', N'اهواز'),
	(NULL, N'اصفهان');
GO

INSERT INTO IntersectTbl2
	VALUES
	(N'تهران', N'تهران'),
	(N'گیلان', NULL),
	(N'آذربایجان شرقی', N'تبریز'),
	(NULL, N'مشهد');
GO

SELECT *
FROM IntersectTbl1
INTERSECT
SELECT *
FROM IntersectTbl2;
GO

SELECT T1.*
FROM IntersectTbl1 AS T1
INNER JOIN IntersectTbl2 AS T2
	ON T1.[State] = T2.[State];
GO