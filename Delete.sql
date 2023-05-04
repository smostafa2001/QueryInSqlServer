USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.DELETE_ChildTbl, dbo.DELETE_ParentTbl;
GO

CREATE TABLE dbo.DELETE_ParentTbl
(
	ID INT IDENTITY PRIMARY KEY,
	Code VARCHAR(10),
	City NVARCHAR(20)
);
GO

INSERT INTO dbo.DELETE_ParentTbl
	VALUES
		('CD-01', N'تهران'), ('CD-02', N'تهران'), ('CD-03', N'تهران'),
		('CD-04', N'اصفهان'), ('CD-05', N'مشهد'), ('CD-06', N'تبریز'),
		('CD-07', N'شیراز'), ('CD-08', N'تبریز'), ('CD-09', N'مشهد'),
		('CD-10', N'رشت'), ('CD-11', N'رشت'), ('CD-12', N'رشت');
GO

SELECT * FROM dbo.DELETE_ParentTbl;
GO

DELETE dbo.DELETE_ParentTbl;
GO

DELETE FROM dbo.DELETE_ParentTbl
	WHERE City = N'رشت';
GO

CREATE TABLE dbo.DELETE_ChildTbl
(
	ID INT REFERENCES dbo.DELETE_ParentTbl(ID),
	OrderID INT
);
GO

INSERT INTO dbo.DELETE_ChildTbl
	VALUES
		(1, 1001), (1, 1002), (1, 1003), (2, 1004), (2, 1005), (2, 1006),
		(3, 1007), (3, 1008), (3, 1009), (4, 1010), (4, 1011), (4, 1012),
		(5, 1013), (6, 1014), (7, 1015), (8, 1016), (9, 1017), (9, 1018);
GO

DELETE FROM dbo.DELETE_ParentTbl
	WHERE City = N'مشهد';
GO

sp_helpconstraint 'dbo.DELETE_ChildTbl';

SELECT
	C.ID, C.OrderID
FROM dbo.DELETE_ChildTbl AS C
JOIN dbo.DELETE_ParentTbl AS P
	ON P.ID = C.ID
	WHERE P.City = N'تبریز';
GO

DELETE P
	FROM dbo.DELETE_ChildTbl AS C
	JOIN dbo.DELETE_ParentTbl AS P
		ON P.ID = C.ID
		WHERE P.City = N'تبریز';
GO

DELETE FROM dbo.DELETE_ParentTbl
	WHERE EXISTS
	(
		SELECT 1
		FROM dbo.DELETE_ChildTbl AS C
			WHERE
				ID = C.ID
				AND
				City = N'تبریز'
	);
GO

DELETE FROM C
FROM dbo.DELETE_ChildTbl AS C
	WHERE EXISTS
	(
		SELECT P.ID
		FROM dbo.DELETE_ParentTbl AS P
			WHERE
				P.ID = C.ID
				AND
				P.City = N'شیراز'
	);
GO