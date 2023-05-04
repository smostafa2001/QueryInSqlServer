USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.OUTPUT_Insert;
GO

CREATE TABLE dbo.OUTPUT_Insert
(
	ID INT IDENTITY,
	City NVARCHAR(20)
);
GO

INSERT INTO dbo.OUTPUT_Insert
	VALUES
		(N'تهران'), (N'مشهد'), (N'تبریز'),
		(N'شیراز'), (N'اصفهان');
GO

SELECT * FROM dbo.OUTPUT_Insert;
GO

SELECT @@IDENTITY, SCOPE_IDENTITY(), IDENT_CURRENT('dbo.OUTPUT_Insert');
GO

INSERT INTO dbo.OUTPUT_Insert
	OUTPUT inserted.ID
	VALUES(N'اهواز'), (N'کرمان'), (N'رشت');
GO

CREATE TABLE #OUTPUT_Tbl
(
	ID INT
);
GO

INSERT INTO dbo.OUTPUT_Insert
	OUTPUT
		inserted.ID INTO #OUTPUT_Tbl
	OUTPUT
		inserted.ID
	VALUES(N'اهواز'), (N'کرمان'), (N'رشت');
GO

SELECT * FROM #OUTPUT_Tbl;
GO

DROP TABLE IF EXISTS dbo.OUTPUT_Delete;
GO

SELECT * INTO dbo.OUTPUT_Delete
FROM dbo.Orders;
GO


DELETE 
FROM dbo.OUTPUT_Delete
	OUTPUT
		deleted.OrderID,
		deleted.OrderDate,
		deleted.CustomerID
	WHERE OrderDate >= '2016-02-06';
GO

DROP TABLE IF EXISTS dbo.OUTPUT_Update;
GO

SELECT * INTO dbo.OUTPUT_Update
FROM dbo.Employees;
GO

UPDATE dbo.OUTPUT_Update
	SET Region = N'مرکزی'
	OUTPUT
		inserted.Region AS NewVal,
		deleted.Region AS OldVal
	WHERE Region = N'مرکز';
GO

DROP TABLE IF EXISTS dbo.S_Customers, dbo.T_Customers;
GO

CREATE TABLE dbo.T_Customers
(
	CustomerID INT NOT NULL PRIMARY KEY,
	CompanyName NVARCHAR(25) NOT NULL,
	City NVARCHAR(20) NOT NULL,
	Phone NVARCHAR(15) NOT NULL
);
GO

CREATE TABLE dbo.S_Customers
(
	CustomerID INT NOT NULL PRIMARY KEY,
	CompanyName NVARCHAR(25) NOT NULL,
	City NVARCHAR(20) NOT NULL,
	Phone NVARCHAR(15) NOT NULL
);
GO

INSERT INTO dbo.T_Customers
	VALUES
		(1, N'شرکت تهران ۱', N'تهران', N'(۰۲۱) ۲۲۲-۱۱۱۱'),
		(2, N'شرکت تهران ۲', N'تهران', N'(۰۲۱) ۲۲۲-۲۲۲۲'),
		(3, N'شرکت اصفهان ۱', N'اصفهان', N'(۰۳۱) ۳۳۳-۱۱۱۱'),
		(4, N'شرکت شیراز ۱', N'شیراز', N'(۰۷۱) ۷۷۷-۱۱۱۱'),
		(5, N'شرکت مشهد ۱', N'مشهد', N'(۰۵۱) ۵۵۵-۱۱۱۱');
GO

INSERT INTO dbo.S_Customers
	VALUES
		(2, N'شرکت پردیس', N'پردیس', N'(۰۲۱) ۲۲۲-۲۲۲۲'),
		(3, N'شرکت اصفهان ۱', N'اصفهان', N'(۰۳۱) ۳۳۳-۱۱۱۱'),
		(5, N'شرکت مشهد ۱', N'مشهد', N'(۰۵۱) ۵۵۵-۰۰۰۰'),
		(6, N'شرکت مشهد ۲', N'مشهد', N'(۰۵۱) ۵۵۵-۱۱۱۱'),
		(7, N'شرکت مشهد ۲', N'اصفهان', N'(۰۳۱) ۳۳۳-۱۱۱۱');
GO

--SELECT * FROM dbo.S_Customers;
--SELECT * FROM dbo.T_Customers;
--GO

MERGE INTO dbo.T_Customers AS T
USING dbo.S_Customers AS S
	ON T.CustomerID = S.CustomerID
WHEN MATCHED THEN
	UPDATE
		SET
			T.CompanyName = S.CompanyName,
			T.Phone = S.Phone,
			T.City = S.City
WHEN NOT MATCHED THEN
	INSERT(CustomerID, CompanyName, Phone, City)
	VALUES(S.CustomerID, S.CompanyName, S.Phone, S.City)
OUTPUT
	$ACTION AS Act,
	deleted.CompanyName AS Old_Value,
	inserted.CompanyName AS New_Value,
	inserted.CustomerID;
GO