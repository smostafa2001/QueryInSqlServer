USE NikamoozDB;
GO

CREATE TABLE #Local_Tmp_Table
(
	Code INT
);
GO

INSERT #Local_Tmp_Table
	VALUES (1), (2), (3), (4), (5);
SELECT * FROM #Local_Tmp_Table;
GO

DROP TABLE IF EXISTS #Local_Tmp_Table;
GO

DROP TABLE IF EXISTS ##Global_Tmp_Table;

CREATE TABLE ##Global_Tmp_Table
(
	Code INT
);
GO

INSERT ##Global_Tmp_Table
	VALUES (1), (2), (3), (4), (5);
SELECT * FROM ##Global_Tmp_Table;
GO

DECLARE @TV TABLE
(
	F1 INT
);
INSERT INTO @TV
	VALUES
		(100), (200), (300);
SELECT * FROM @TV;
GO

SELECT * FROM @TV;
GO