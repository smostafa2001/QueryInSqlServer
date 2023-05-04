USE NikamoozDB;
GO

DROP TABLE IF EXISTS dbo.S_Customers, dbo.T_Customers;
GO

CREATE TABLE dbo.T_Customers
(
	CustomerID INT NOT NULL PRIMARY KEY,
	CompanyName NVARCHAR(25) NOT NULL,
	City NVARCHAR(20) NOT NULL,
	Phone VARCHAR(15) NOT NULL
);
GO

CREATE TABLE dbo.S_Customers
(
	CustomerID INT NOT NULL PRIMARY KEY,
	CompanyName NVARCHAR(25) NOT NULL,
	City NVARCHAR(20) NOT NULL,
	Phone VARCHAR(15) NOT NULL
);
GO

INSERT INTO dbo.T_Customers
	VALUES
		(1, N'شرکت تهران ۱', N'تهران', '(۰۲۱) ۲۲۲-۱۱۱۱'),
		(2, N'شرکت تهران ۲', N'تهران', '(۰۲۱) ۲۲۲-۲۲۲۲'),
		(3, N'شرکت اصفهان ۱', N'تهران', '(۰۳۱) ۳۳۳-۱۱۱۱'),
		(4, N'شرکت شیراز ۱', N'تهران', '(۰۷۱) ۷۷۷-۱۱۱۱'),
		(5, N'شرکت مشهد ۱', N'تهران', '(۰۵۱) ۵۵۵-۱۱۱۱');
GO

INSERT INTO dbo.S_Customers
	VALUES
		(2, N'شرکت پردیس', N'پردیس', '(۰۲۱) ۲۲۲-۲۲۲۲'),
		(3, N'شرکت اصفهان ۱', N'اصفهان', '(۰۳۱) ۳۳۳-۱۱۱۱'),
		(5, N'شرکت مشهد ۱', N'مشهد', '(۰۵۱) ۵۵۵-۰۰۰۰'),
		(6, N'شرکت مشهد ۲', N'مشهد', '(۰۵۱) ۵۵۵-۱۱۱۱'),
		(7, N'شرکت اصفهان ۲', N'تهران', '(۰۵۱) ۵۵۵-۲۲۲۲');
GO

SELECT * FROM dbo.T_Customers;
GO

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
		VALUES(S.CustomerID, S.CompanyName, S.Phone, S.City);
GO

MERGE INTO dbo.T_Customers AS T
USING dbo.S_Customers AS S
	ON T.CustomerID = S.CustomerID
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;
GO

SELECT * FROM dbo.S_Customers;
SELECT * FROM dbo.T_Customers;
GO