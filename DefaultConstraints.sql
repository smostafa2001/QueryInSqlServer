﻿USE master;
GO

DROP DATABASE IF EXISTS Test01;
GO

ALTER DATABASE Test01
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

CREATE DATABASE Test01;
GO

USE Test01;
GO

DROP TABLE IF EXISTS Students;
GO

CREATE TABLE Students
(
	NationalCode INT CONSTRAINT myConst1 DEFAULT 0,
	Family NVARCHAR(100) NOT NULL,
	Medical_StatuS NVARCHAR(100) CONSTRAINT myConst2 DEFAULT N'ندارد',
	Blood_Group NVARCHAR(100) CONSTRAINT myConst3 DEFAULT N'OOOOO'
);
GO

SP_HELPCONSTRAINT 'STUDENTS';
GO

INSERT INTO Students (Family) VALUES (N'احمدی'), (N'راد'), (N'سعیدی');
GO

SELECT * FROM Students;
GO

ALTER TABLE Students
	ADD Code1 INT DEFAULT 100000 WITH VALUES;
GO

SELECT * FROM Students;
GO

ALTER TABLE Students
	ADD Code2 INT DEFAULT 200000;
GO

SELECT * FROM Students;
GO

INSERT INTO Students (Family) VALUES (N'حیدری');
GO

ALTER TABLE Students
	DROP CONSTRAINT myConst1;
GO