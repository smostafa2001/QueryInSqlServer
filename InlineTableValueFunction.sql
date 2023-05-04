USE NikamoozDB;
GO

DROP VIEW IF EXISTS dbo.Customers_Info;
GO

CREATE VIEW dbo.Customers_Info
AS
	(
		SELECT
			C.CompanyName, C.City, O.OrderID, O.OrderDate
		FROM dbo.Customers AS C
		JOIN dbo.Orders AS O
			ON C.CustomerID = O.CustomerID
	);
GO

DROP FUNCTION IF EXISTS dbo.Func_Customers_Info;
GO

CREATE FUNCTION dbo.Func_Customers_Info(@City NVARCHAR(50))
	RETURNS TABLE
AS
RETURN
	(
		SELECT
			C.CompanyName, C.City, O.OrderID, O.OrderDate
		FROM dbo.Customers AS C
		JOIN dbo.Orders AS O
			ON C.CustomerID = O.CustomerID
			WHERE C.City = @City
	);
GO

SELECT * FROM dbo.Func_Customers_Info(N'«’›Â«‰');
GO

SELECT * FROM dbo.Func_Customers_Info(N' Â—«‰') AS F
JOIN dbo.OrderDetails AS OD
	ON F.OrderID = OD.OrderID;
GO

DROP FUNCTION IF Exists dbo.Top_Orders;
GO

CREATE FUNCTION dbo.Top_Orders(@C_ID INT, @N TINYINT)
	RETURNS TABLE
AS
RETURN
	(
		SELECT
			TOP(@N) OrderID, CustomerID, OrderDate
		FROM dbo.Orders
			WHERE CustomerID = @C_ID
		ORDER BY OrderDate DESC
	);
GO

SELECT * FROM dbo.Top_Orders(1, 5);
GO