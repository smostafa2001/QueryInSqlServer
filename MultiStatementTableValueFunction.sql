USE NikamoozDB;
GO

DROP FUNCTION IF EXISTS dbo.Multi_Statement_Table_Valued;
GO

CREATE FUNCTION dbo.Multi_Statement_Table_Valued()
	RETURNS @Tbl TABLE (Col1 INT, Col2 NVARCHAR(100))
AS
	BEGIN
		INSERT @Tbl
			VALUES (1, 'HELLO'), (2, 'SQL')
		RETURN;
	END