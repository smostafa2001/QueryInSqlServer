USE NikamoozDB;
GO

DROP TABLE IF EXISTS GroupTable;
GO

CREATE TABLE GroupTable
(
	Score INT
);
GO

INSERT INTO GroupTable
	VALUES (2), (3), (4), (10);
GO

SELECT
	COUNT(Score) AS Num,
	SUM(Score) AS Total,
	MAX(Score) AS MaxVal,
	MIN(Score) AS MinVal,
	AVG(Score * 1.0) AS Average
FROM GroupTable;
GO

INSERT INTO GroupTable
	VALUES (NULL);
GO

SELECT * FROM GroupTable;
GO

SELECT
	COUNT(Score) AS Num,
	SUM(Score) AS Total,
	MAX(Score) AS MaxVal,
	MIN(Score) AS MinVal,
	AVG(Score * 1.0) AS Average
FROM GroupTable;
GO

SELECT
	COUNT(*) AS Num
FROM GroupTable;
GO