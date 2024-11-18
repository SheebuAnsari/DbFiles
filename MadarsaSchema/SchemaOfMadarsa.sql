--CREATE DATABASE MadarsaD
--use MadarsaD
--Drop database MadarsaD
select TABLE_NAME from INFORMATION_SCHEMA.TABLES order by 1 desc

--/****** Object:  UserDefinedFunction [dbo].[DateToInt]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Function [dbo].[DateToInt]  
                        (  
                         @dDate Datetime  
                        )  
                        returns int  
                        Begin  
                         return ((DATEPART(YEAR,@dDate) * 65536) | (DATEPART(MONTH,@dDate) *256) | DATEPART(DAY,@dDate))  
                        End
GO
/****** Object:  UserDefinedFunction [dbo].[GetDatePart]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[GetDatePart](@p varchar(4), @iDate int) returns int 
 begin 
set @p = substring(LOWER(@p), 1, 1) 
if @p = 'd' 
begin 
 return @iDate & 0xff 
end 
if @p = 'm' 
begin 
 return (@iDate & 0xff00)/256 
end 
if @p = 'y' 
begin 
 return (@iDate & 0xfff0000)/65535 
end 
if @p = 'q' 
begin 
 if (@iDate & 0xff00)/256 between 1 and 3 
 begin 
return 1 
 end 
 if (@iDate & 0xff00)/256 between 4 and 6 
 begin 
return 2 
 end 
 if (@iDate & 0xff00)/256 between 7 and 9 
 begin 
return 3 
 end 
 if (@iDate & 0xff00)/256 between 10 and 12 
 begin 
return 4 
 end 
end 
return 0 
 end
GO
/****** Object:  Table [dbo].[tbl_UserRegistration]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserRegistration](
	[iRegistrationId] [int] IDENTITY(1,1) NOT NULL,
	[sUserName] [nvarchar](255) NULL,
	[iUserType] [int] NULL,
	[sFirstName] [nvarchar](200) NULL,
	[iAdmissionInClass] [int] NULL,
	[iExperience] [int] NULL,
	[sFatherName] [nvarchar](200) NULL,
	[iRegContact] [bigint] NULL,
	[iGrade] [int] NULL,
	[iRegDate] [int] NULL,
	[iRegFee] [int] NULL,
	[sDOBId] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[iRegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  UserDefinedFunction [dbo].[IntToDate]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Function [dbo].[IntToDate] 
( 
 @iDate int 
) 
returns Datetime 
Begin 
 Declare @Date Datetime 
 if @iDate <> 0 
 Begin 
 Set @Date = Cast((CAST((@iDate & 0xfff0000)/65536 as nvarchar(4)) + '/' + Cast((@iDate & 0xff00)/256 as
nvarchar(2)) + '/' + Cast ((@iDate & 0xff) as nvarchar(2))) as DATETIME) 
 End 
 else 
 Begin 
 Set @Date = GetDate() 
 End 
 return @Date 
End
GO
/****** Object:  Table [dbo].[tbl_Admins]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Admins](
	[iRegistrationId] [int] NULL,
	[sLoginName] [nvarchar](255) NOT NULL,
	[sUserPassword] [nvarchar](255) NULL,
	[bActive] [bit] NULL,
	[iContact] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[sLoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Login]    Script Date: 16-03-2024 16:57:24 ******/
If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_Login')
BEGIN
    CREATE TABLE [dbo].[tbl_Login](
			[iRegistrationId] [int] FOREIGN KEY REFERENCES tbl_UserRegistration,
			[sUserId] [nvarchar](255) unique Not null,
			[sUserPassword] [nvarchar](500) NULL,
        )
END
/****** Object:  Table [dbo].[tbl_ClassInfo]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ClassInfo](
	[iClassInfoId] [int] IDENTITY(1,1) NOT NULL,
	[iClass] [int] NULL,
	[sSection] [nvarchar](50) NULL,
	[sCreatedBy] [nvarchar](50) NULL,
	[iCreatedDate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CommitteeInfo]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CommitteeInfo](
	[iMemberId] [int] IDENTITY(1,1) NOT NULL,
	[iId] [int] NULL,
	[sName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ExtraFields]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ExtraFields](
	[iFieldId] [int] IDENTITY(1,1) NOT NULL,
	[Field-2] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Guardian income] [nvarchar](200) NULL,
	[Age] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Fees]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Fees](
	[iStdId] [int] NULL,
	[iClass] [int] NULL,
	[iForMonth] [int] NULL,
	[iYear] [int] NULL,
	[iDate] [bigint] NULL,
	[iFee] [int] NULL,
	[iPending] [int] NULL,
	[iYearlyFee] [int] NULL,
	[iConcession] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FeeStructure]    Script Date: 19-08-2024 20:02:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_FeeStructure](
	[iFeeStructureId] [int] IDENTITY(1,1) NOT NULL,
	[iClass] [int] NULL,
	[iYear] [int] NULL,
	[iRegistrationFee] [int] NULL,
	[iAdmissionFee] [int] NULL,
	[iPerMonthFee] [int] NULL,
	[iTransportFee] [int] NULL,
	[iPerYearFee] [int] NULL,	
PRIMARY KEY CLUSTERED 
(
	[iFeeStructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LicenseInfo]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LicenseInfo](
	[iLicenseInfo] [int] IDENTITY(1,1) NOT NULL,
	[sDbName] [nvarchar](255) NULL,
	--[sEmailSuffix] [nvarchar](50) NULL,
	[sProvider] [nvarchar](255) NULL,
	[sKey] [nvarchar](255) NULL,
	[iEducationStage] [int] NULL,
	[iInstallationDate] [int] NULL,
	[iFromDate] [int] NULL,
	[iToDate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iLicenseInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbl_MarkSheet]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MarkSheet](
	[iMarkSheetId] [int] IDENTITY(1,1) NOT NULL,
	[iStdId] [int] NULL,
	[iClass] [int] NULL,
	[iYear] [int] NULL,
	[bResultPrepared] [bit] NULL,
	[sClassSection] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMarkSheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MarksOfSubjects]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MarksOfSubjects](
	[iMarkSheetId] [int] NULL,
	[iExamType] [int] NULL,
	[iCreatedDate] [int] NULL,
	[Hindi] [int] NOT NULL,
	[English] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Menu](
	[iMenuId] [int] NULL,
	[sMenuName] [nvarchar](255) NULL,
	[sCaption] [nvarchar](255) NULL,
	[iModule] [int] NULL,
	[iSubModule] [int] NULL,
	[bIsGroup] [bit] NULL,
	[bIsActive] [bit] NULL,
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MonthlyFee]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MonthlyFee](
	[iMonthlyFeeId] [int] IDENTITY(1,1) NOT NULL,
	[iStudentFeesId] [int] NULL,
	[iDate] [bigint] NULL,
	[iForMonth] [int] NULL,
	[iFee] [int] NULL,
	[iConcession] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMonthlyFeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbl_Wallet]    Script Date: 19-08-2024 19:43:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Wallet](
	[iWalletId] [int] IDENTITY(1,1) NOT NULL,
	[iMonthlyFeeId] [int] NULL,
	[iSettlement] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iWalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Wallet]  WITH CHECK ADD FOREIGN KEY([iMonthlyFeeId])
REFERENCES [dbo].[tbl_MonthlyFee] ([iMonthlyFeeId])
GO

	/****** Object:  Table [dbo].[tbl_OtherMonthlyFee]    Script Date: 30-10-2024 12:56:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_OtherMonthlyFee](
	[iOtherMonthlyFeeId] [int] IDENTITY(1,1) NOT NULL,
	[iMonthlyFeeId] [int] NULL,
	[iFeeType] [int] NULL,
	[iAmount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iOtherMonthlyFeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SalaryIncrement]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SalaryIncrement](
	[iSalaryId] [int] IDENTITY(1,1) NOT NULL,
	[iRegistrationId] [int] NULL,
	--[iYear] [int] NULL,
	[iPerMonthSalary] [int] NULL,
	[iHikeDate] [int], 
	[iHikeAmt] [int],
PRIMARY KEY CLUSTERED 
(
	[iSalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[tbl_UserMonthwiseSalary]    Script Date: 15-06-2024 22:42:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_UserMonthwiseSalary](
	[iSalaryId] [int] IDENTITY(1,1) NOT NULL,
	[iRegistrationId] [int] NULL,
	[iDate] [int] NULL,
	[iSalary] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tbl_SchoolDetails]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SchoolDetails](
	[iSchoolId] [int] IDENTITY(1,1) NOT NULL,
	[iRegistrationDate] [bigint] NULL,
	[iContact] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[iSchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SchoolInfo]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SchoolInfo](
	[iSchoolId] [int] IDENTITY(1,1) NOT NULL,
	[sSchoolName] [nvarchar](250) NULL,
	[sPrincipal] [nvarchar](250) NULL,
	[sEstablish] [nvarchar](250) NULL,
	[iRegistrationDate] [bigint] NULL,
	[sRegistrationNo] [nvarchar](250) NULL,
	[sAddress] [nvarchar](250) NULL,
	[sEmail] [nvarchar](100) NULL,
	[biSchoolImage] [varbinary](max) NULL,
	[iContact] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[iSchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_StudentClasswiseInfo]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentClasswiseInfo](
	[iStdId] [int] IDENTITY(1,1) NOT NULL,
	[iRegistrationId] [int] NULL,
	[iCurrentClass] [int] NULL,
	[iCurrentYear] [int] NULL,
	[bIsActive] [bit] NULL,
	[bResultPrepared] [bit] NULL,
	[sClassSection] [varchar](20) NULL,
	[iDateUpto] [int] NULL,
	[iResultStatus] [int] NULL,
	[iAdmissionFee] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iStdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Tabvcle [dbo].[tbl_StudentFees]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentFees](
	[iStudentFeesId] [int] IDENTITY(1,1) NOT NULL,
	[iRegistrationId] [int] NULL,
	[iStdId] [int] NULL,
	[iClass] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iStudentFeesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_StudentPersonalFields]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentPersonalFields](
	[iFieldId] [int] IDENTITY(1,1) NOT NULL,
	[iModule] [int] NULL,
	[iSubModule] [int] NULL,
	[iPanelId] [int] NULL,
	[sName] [nvarchar](200) NULL,
	[sCaption] [nvarchar](200) NULL,
	[sClass] [nvarchar](20) NULL,
	[iControlType] [int] NULL,
	[iReadonly] [bit] NULL,
	[iHidden] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iFieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Students]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Students](
	[iRegistrationId] [int] NULL,
	[sAddress] [nvarchar](255) NULL,
	[sCity] [nvarchar](255) NULL,
	[iContact] [bigint] NULL,
	[iAdmissionInClass] [int] NULL,
	[iAdmissionDate] [bigint] NULL,
	[iDOB] [bigint] NULL,
	[biStudentImage] [varbinary](max) NULL,
	--[sClassSection] [varchar](20) NULL,
	[iReligion] [int] NULL,
	[iGender] [int] NULL,
	[iBloodGroup] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Students]  WITH CHECK ADD FOREIGN KEY([iRegistrationId])
REFERENCES [dbo].[tbl_UserRegistration] ([iRegistrationId])
GO
/****** Object:  Table [dbo].[tbl_SubjectMM]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SubjectMM](
	[iSubjectMMId] [int] IDENTITY(1,1) NOT NULL,
	[iSubjectId] [int] NULL,
	[iExamType] [int] NULL,
	[iMaxMark] [int] NULL,
	[iCreatedDate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Subjects]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Subjects](
	[iSubjectId] [int] IDENTITY(1,1) NOT NULL,
	[iClass] [int] NULL,
	[sSubjectName] [nvarchar](100) NULL,
	[iMaxMark] [int] NULL,
	[bIsDefaultSubject] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iSubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sSubjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Teachers]    Script Date: 16-03-2024 16:57:24 ******/
/****** Object:  Table [dbo].[tbl_Teachers]    Script Date: 12-05-2024 15:08:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Teachers](
	[iRegistrationId] [int] NULL,
	[sAddress] [nvarchar](255) NULL,
	[iExperience] [int] NULL,
	[sQualification] [nvarchar](255) NULL,
	[iJoiningDate] [bigint] NULL,
	[iDOB] [int] NULL,
	[bIsActive] [bit] NULL,
	[biTeacherImage] [varbinary](max) NULL,
	[iCurrentYear] [int] NULL,
	[iContact] [bigint] NULL,
	[iReligion] [int] NULL,
	[iBloodGroup] [int] NULL,
	[iGender] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Teachers]  WITH CHECK ADD FOREIGN KEY([iRegistrationId])
REFERENCES [dbo].[tbl_UserRegistration] ([iRegistrationId])
GO
/****** Object:  Table [dbo].[tbl_TimeTableLayout]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TimeTableLayout](
	[iLayoutId] [int] IDENTITY(1,1) NOT NULL,
	[sLayoutName] [nvarchar](200) NULL,
	[iNoOfPeriod] [int] NULL,
	[iFirstPeriod] [int] NULL,
	[iDuration] [int] NULL,
	[iLunchBreak] [int] NULL,
	[iClass] [int] NULL,
	[iCreatedDate] [int] NULL,
	[iLunchDuration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iLayoutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TimeTableRowData]    Script Date: 16-03-2024 16:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TimeTableRowData](
	[iRowDataId] [int] IDENTITY(1,1) NOT NULL,
	[iLayoutId] [int] NULL,
	[iRowInd] [int] NULL,
	[iColInd] [int] NULL,
	[iTeacherId] [int] NULL,
	[sTeacherName] [nvarchar](200) NULL,
	[sSubjectName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iRowDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserAttendance]    Script Date: 16-03-2024 16:57:24 ******/
If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_UserAttendance')
BEGIN
CREATE TABLE [dbo].[tbl_UserAttendance](
	[iDayId] [int] Primary key IDENTITY(1,1) NOT NULL,
	[iLogedUserId] [int] NULL,
	[iAttendanceDate] [int] NULL,
	[sClassSection] [nvarchar] (50) NULL,
) 
END
/****** Object:  Table [dbo].[tbl_AttendanceRegister]    Script Date: 16-03-2024 16:57:24 ******/

If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_AttendanceRegister')
BEGIN
CREATE TABLE [dbo].[tbl_AttendanceRegister](
	--[iDayId] [int] FOREIGN KEY REFERENCES dbo.tbl_UserAttendance,
	[iDayId] int FOREIGN KEY REFERENCES [dbo].[tbl_UserAttendance] ([iDayId]),
	[iUserId] [int] NULL
) 
END

/****** Object:  Table [dbo].[tbl_SchoolTime]    Script Date: 18-11-2024 23:47:42 ******/
If NOT EXISTS (SELECT TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_SchoolTime')
BEGIN
CREATE TABLE [dbo].[tbl_SchoolTime](
	[iTimeId] [int] IDENTITY(1,1) NOT NULL,
	[iCreatedDate] [int] NULL,
	[sCreatedBy] [nvarchar](100) NULL,
	[iStartTime] [int] NULL,
	[iEndTime] [int] NULL,
	[iTotalTimeInHours] [int] NULL,
) 
END

/****** Object:  Table [dbo].[tbl_Wallet]    Script Date: 16-03-2024 16:57:24 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[tbl_Wallet](
--	[iWalletId] [int] IDENTITY(1,1) NOT NULL,
--	[iMonthlyFeeId] [int] NULL,
--	[iSettlement] [int] NULL,
--PRIMARY KEY CLUSTERED 
--(
--	[iWalletId] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO
ALTER TABLE [dbo].[tbl_MarksOfSubjects] ADD  DEFAULT ((0)) FOR [Hindi]
GO
ALTER TABLE [dbo].[tbl_MarksOfSubjects] ADD  DEFAULT ((0)) FOR [English]
GO
ALTER TABLE [dbo].[tbl_Admins]  WITH CHECK ADD FOREIGN KEY([iRegistrationId])
REFERENCES [dbo].[tbl_UserRegistration] ([iRegistrationId])
GO
ALTER TABLE [dbo].[tbl_Fees]  WITH CHECK ADD FOREIGN KEY([iStdId])
REFERENCES [dbo].[tbl_StudentClasswiseInfo] ([iStdId])
GO
ALTER TABLE [dbo].[tbl_MarkSheet]  WITH CHECK ADD FOREIGN KEY([iStdId])
REFERENCES [dbo].[tbl_StudentClasswiseInfo] ([iStdId])
GO
ALTER TABLE [dbo].[tbl_MarksOfSubjects]  WITH CHECK ADD FOREIGN KEY([iMarkSheetId])
REFERENCES [dbo].[tbl_MarkSheet] ([iMarkSheetId])
GO
ALTER TABLE [dbo].[tbl_MonthlyFee]  WITH CHECK ADD FOREIGN KEY([iStudentFeesId])
REFERENCES [dbo].[tbl_StudentFees] ([iStudentFeesId])
GO
ALTER TABLE [dbo].[tbl_StudentClasswiseInfo]  WITH CHECK ADD FOREIGN KEY([iRegistrationId])
REFERENCES [dbo].[tbl_UserRegistration] ([iRegistrationId])
GO
ALTER TABLE [dbo].[tbl_StudentFees]  WITH CHECK ADD FOREIGN KEY([iRegistrationId])
REFERENCES [dbo].[tbl_UserRegistration] ([iRegistrationId])
GO
ALTER TABLE [dbo].[tbl_StudentFees]  WITH CHECK ADD FOREIGN KEY([iStdId])
REFERENCES [dbo].[tbl_StudentClasswiseInfo] ([iStdId])
GO
ALTER TABLE [dbo].[tbl_Students]  WITH CHECK ADD FOREIGN KEY([iRegistrationId])
REFERENCES [dbo].[tbl_UserRegistration] ([iRegistrationId])
GO
ALTER TABLE [dbo].[tbl_SubjectMM]  WITH CHECK ADD FOREIGN KEY([iSubjectId])
REFERENCES [dbo].[tbl_Subjects] ([iSubjectId])
GO
ALTER TABLE [dbo].[tbl_Teachers]  WITH CHECK ADD FOREIGN KEY([iRegistrationId])
REFERENCES [dbo].[tbl_UserRegistration] ([iRegistrationId])
GO
ALTER TABLE [dbo].[tbl_TimeTableRowData]  WITH CHECK ADD FOREIGN KEY([iLayoutId])
REFERENCES [dbo].[tbl_TimeTableLayout] ([iLayoutId])
GO
ALTER TABLE [dbo].[tbl_Wallet]  WITH CHECK ADD FOREIGN KEY([iMonthlyFeeId])
REFERENCES [dbo].[tbl_MonthlyFee] ([iMonthlyFeeId])
GO
--ALTER DATABASE [MadarsaA] SET  READ_WRITE 
--GO

