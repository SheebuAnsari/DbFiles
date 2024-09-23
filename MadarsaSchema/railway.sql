--create database railway
use railway

If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_Login')
BEGIN
    CREATE TABLE [dbo].[tbl_Login](
			[iLoginId] [int] primary key identity,
			[sUserId] [nvarchar](255) unique Not null,
			[sPassword] [nvarchar](500) NULL,
        )
END

select sUserId, sPassword, *from tbl_login

If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_Trains')
BEGIN
    CREATE TABLE [dbo].[tbl_Trains](
			[iTrainId] [int] primary key identity,
			[sName] [nvarchar](255),
			[sNo] int unique Not null,
			sSource nvarchar(255),
			sDestination nvarchar(255),
			iACFirst int,
			iACSecond int,
			iACThird int,
			iACSleeper int,
			iAvailability int
        )
END

If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_Trains')
BEGIN
    CREATE TABLE [dbo].[tbl_Trains](
			iTrainId int primary key identity,
			sName nvarchar(255),
			sNo int unique Not null,
			sSource nvarchar(255),
			sDestination nvarchar(255),
			iACFirst int,
			iACSecond int,
			iACThird int,
			iSleeper int,
			sAvailability nvarchar(200)
        )
END

select iTrainId,sName,sNo,sSource,sDestination, iACFirst, iACSecond, iACThird, iSleeper, sAvailability, *from tbl_Trains

SELECT TOP 5 sName,sNo,sSource,sDestination, iACFirst, iACSecond, iACThird, iSleeper, sAvailability FROM tbl_Trains ORDER BY 1 DESC

SELECT sName,sNo,sSource,sDestination, iACFirst, iACSecond, iACThird, iSleeper, sAvailability FROM tbl_Trains WHERE sName ='' or sNo = ''
    
