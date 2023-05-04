USE NikamoozDB;
GO

DROP PROCEDURE IF EXISTS GetAllCustomers;
GO

CREATE PROCEDURE GetAllCustomers AS
BEGIN
	SELECT
		CustomerID, City
	FROM dbo.Customers;
END
GO

EXEC GetAllCustomers;
GO

GETAllCustomers;
GO

ALTER PROCEDURE GetAllCustomers AS
BEGIN
	SELECT
		CustomerID, State, City
	FROM dbo.Customers;
END
GO

EXEC GetAllCustomers;
GO

DROP PROCEDURE IF EXISTS GetEmployeeID;
GO

CREATE PROCEDURE GetEmployeeByID(@ID INT) AS
BEGIN
	SELECT
		EmployeeID, FirstName, LastName
	FROM dbo.Employees
		WHERE EmployeeID = @ID;
END
GO

EXEC GetEmployeeByID 1;
GO

EXEC GetEmployeeByID @ID = 1;
GO

GetEmployeeByID @ID = 1;
GO

DROP PROCEDURE IF EXISTS ExistsCustomer;
GO

CREATE PROCEDURE ExistsCustomer
(
	@CustomerID INT,
	@Exists BIT OUTPUT
) AS
BEGIN
	IF EXISTS
	(
		SELECT CustomerID
		FROM dbo.Customers
			WHERE CustomerID = @CustomerID
	)
	BEGIN
		SET @Exists = 'TRUE';
	END
	ELSE
		SET @Exists = 'FALSE'
END
GO

DECLARE @V_RecordExistance BIT;
EXEC ExistsCustomer 5, @V_RecordExistance OUTPUT;
SELECT @V_RecordExistance;
GO

DROP PROCEDURE IF EXISTS DoncatInfo;
GO

CREATE PROCEDURE ConcatInfo
(
	@FirstName NVARCHAR(40),
	@LastName NVARCHAR(60),
	@FullName NVARCHAR(100) OUTPUT
) AS
BEGIN
	SELECT @FullName = CONCAT(@FirstName, ' ', @LastName)
END
GO

DECLARE @V_FullName NVARCHAR(100);
EXEC ConcatInfo N'احمد', N'اسدی', @V_FullName OUTPUT;
SELECT @V_FullName;
GO