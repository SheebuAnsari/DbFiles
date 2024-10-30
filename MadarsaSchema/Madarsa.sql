--Create database Madarsa
--use Madarsa123
--ALTER TABLE tbl_MarksOfSubjects DROP CONSTRAINT {0}
--ALTER TABLE tbl_UserRegistration DROP CONSTRAINT UQ__tbl_User__36A888822E686E92

--Delete user
--delete from tbl_Wallet
--delete from tbl_MonthlyFee
--delete from tbl_StudentFees 
--delete from tbl_MarksOfSubjects
--delete from tbl_MarkSheet
--delete from tbl_StudentAttendance
--delete from dbo.tbl_Fees
--delete from tbl_StudentClasswiseInfo
--========================================
--Select record from table A and insert into table B
--select *from tbl_UserRegistration --save only once iRegFee of student
--select *from tbl_StudentClasswiseInfo  --save yearly AdmissionFee of student

insert into tbl_students (iregistrationid, saddress,scity,icontact,iadmissioninclass, idob)
select iregistrationid, saddress,scity,icontact,iadmissioninclass, idob from tbl_students where iregistrationid = 13

select *from tbl_students where iadmissiondate is null  
--========================================

select *from tbl_UserRegistration --Basic info
select *from tbl_teachers --Deep info
select *from tbl_login 

If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_Login')
BEGIN
    CREATE TABLE [dbo].[tbl_Login](
			[iRegistrationId] [int] FOREIGN KEY REFERENCES tbl_UserRegistration,
			[sUserId] [nvarchar](255) unique Not null,
			[sUserPassword] [nvarchar](500) NULL,
        )
END

insert into tbl_Login (iRegistrationId, sUserId,sUserPassword) values (1, 'su', 'su')

SELECT *FROM tbl_Menu 

--Load Studnet
SELECT a.iRegistrationId, c.iStdId, b.sUserName, c.iCurrentClass
FROM tbl_Students a
join tbl_UserRegistration b on b.iRegistrationId = a.iRegistrationId
JOIN tbl_StudentClasswiseInfo c ON c.iRegistrationId = b.iRegistrationId 
WHERE c.bIsActive = 1 and 
c.iCurrentClass = 2
ORDER BY 1


--drop table [tbl_CommitteeInfo]
If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_CommitteeInfo')
BEGIN
    CREATE TABLE [dbo].[tbl_CommitteeInfo](
			iMemberId int IDENTITY (1,1) PRIMARY KEY, 
	        iId int,
			sName nvarchar (200)
        )
END


--Checking Admin module
select *from tbl_LicenseInfo
CREATE TABLE tbl_LicenseInfo (
	iLicenceInfo int IDENTITY (1,1) PRIMARY KEY, 
	sDbName nvarchar (255), 
	sProvider nvarchar (255),  
	sKey nvarchar(255),
	iValidity int,
	iInstallationDate bigint,
	iExpiryDate bigint,
)

select *from tbl_SchoolInfo
CREATE TABLE tbl_SchoolInfo (
	iSchoolId int IDENTITY(1,1) PRIMARY KEY,    
	sSchoolName nvarchar (250),
	sPrincipal nvarchar(255),
    sEstablish nvarchar(255),
	iRegistrationDate bigint,
	sRegistrationNo nvarchar(100),
    sAddress nvarchar(255),
	iContact bigint,
	sEmail nvarchar(100) ,
	biSchoolImage varbinary(MAX)
);
select *from tbl_SchoolInfo 
select sSchoolName, sPrincipal,sEstablish,iRegistrationDate,sRegistrationNo,sAddress, iContact,sEmail,biSchoolImage
from tbl_SchoolInfo 
alter table tbl_SchoolInfo add sEmail nvarchar(100) 
alter table tbl_SchoolInfo add biSchoolImage varbinary(MAX)

--Checking Admin module
CREATE TABLE tbl_UserRegistration (
iRegistrationId int IDENTITY (1,1) PRIMARY KEY, 
sFirstName nvarchar (50),
sUserName nvarchar (100), 
iAdmissionInClass int,
iExperience int,
sFatherName nvarchar (200),
iRegContact bigint,
iDOB int,
iDOBId bigint,
iGender int,
sBloodGroup nvarchar (20),
sReligion nvarchar (50),
--sLoginName nvarchar (255) unique Not null,  
--sUserPassword nvarchar(255),
iUserType int
)
select IsNull(sFirstName, '')sFirstName,*from tbl_UserRegistration

SELECT iRegistrationId, IsNull(sFirstName, 'FirstName')sFirstName, sUserName, IsNull(iAdmissionInClass,1)iAdmissionInClass, IsNull(iExperience,1)iExperience,
ISNULL(sFatherName, '')sFatherName, ISNULL(iContact,8686)iContact, ISNULL(iDOB,111)iDOB, ISNULL(iDOBId,222)iDOBId, ISNULL(iGender,1)iGender, 
ISNULL(sBloodGroup,'A')sBloodGroup, ISNULL(sReligion,'Islam')sReligion, iUserType FROM tbl_UserRegistration 

INSERT INTO tbl_UserRegistration 
(sFirstName, sUserName, iAdmissionInClass, iExperience, sFatherName, iContact, iDOB, iDOBId, iGender, sBloodGroup, sReligion, iUserType) 
VALUES ('su', 'su', 0, 0, 'su', 0, 0, 0, 0, 'su', 'su', 1) 

--drop table tbl_Admins
CREATE TABLE tbl_Admins(
	iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
	sLoginName nvarchar (255) unique Not null,	 
	sUserPassword nvarchar(255),
	iContact bigint,
	bActive bit
);
insert into tbl_Admins (iRegistrationId, sLoginName, sUserPassword,iContact,bActive) values (1, 'su','su',8686360214,1)
select *from tbl_Admins

insert into tbl_UserRegistration (sUserName, sLoginName,sUserPassword, iUserType) values ('su','su','su',1)

select *from tbl_Menu
CREATE TABLE tbl_Menu (
	iMenuId int --IDENTITY(1,1) PRIMARY KEY,    
	sMenuName nvarchar(255),
    sCaption nvarchar(255),
	iModule int,
	iSubModule int,
	bIsGroup bit,
	bIsActive bit,
);
select *from tbl_Menu
update tbl_Menu set bisactive=1

--update tbl_Menu set sMenuName='Developer' where sMenuName='Dev'
--module
insert into tbl_Menu (sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive)values ('Dev','cDev', 0, -1, 1, 1)
insert into tbl_Menu (sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive)values ('Admin', 'cAdmin', 1, -1, 1, 1)
insert into tbl_Menu (sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive)values ('Teacher','cTeacher', 2, -1, 1, 1)
insert into tbl_Menu (sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive)values ('Accounts','cAccounts', 3, -1, 1, 1)
insert into tbl_Menu (sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive)values ('Student', 'cStudent', 4, -1, 1, 1)
insert into tbl_Menu (sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive)values ('Admission', 'Admission Dept', 5, -1, 1, 1)

--submodule
insert into tbl_Menu (sMenuName, iSubModule) values ('Add Menu', 1)
--Add these Screen of Admin
--AddTeacher
--TeachersDetail
--ActiveTeachers
--InActiveTeachers
--TeachersIdCards
--StudentsIdCards
--TakeTeacherAttendanceInputs
--LoadTeacherAttendanceInputs
--TeacherRegistration

SELECT iMenuId, sMenuName, ISNULL(sCaption,'')[sCaption], iModule, iSubModule, bIsGroup, bIsActive FROM tbl_Menu 
update tbl_Menu set sMenuName ='SchoolInfo' where iMenuId =41
--drop table tbl_Teachers
CREATE TABLE tbl_Teachers(
	iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
	sLoginName nvarchar (255) unique Not null,	 
	sUserPassword nvarchar(255),
	sAddress nvarchar(255),
	iContact bigint,
	iExperience int,
    sQualification nvarchar(255),
	iJoiningDate bigint,
	iDOB int,
	bIsActive bit,
	biTeacherImage varbinary(MAX),
	iCurrentYear int, --it should be update for next year
);
select iRegistrationId, sUserName,sLoginName,sUserPassword, iUserType from tbl_UserRegistration 
select * from tbl_Teachers
--Delete from tbl_Teachers where iRegistrationId=2

SELECT iRegistrationId, ISNULL(iContact,0)iContact, sQualification, iJoiningDate, iExperiance,ISNULL(bActive,0)[bActive] 
                                    FROM tbl_Teachers

									--NOTE : create commontable for Attendance
--drop table tbl_TeacherAttendance
CREATE TABLE tbl_TeacherAttendance (
	iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
	iDate int,
	iStatus int --0: Absent 1: Present 3: onLeave
);
select *from tbl_TeacherAttendance
SELECT iRegistrationId, iDate, iStatus FROM tbl_TeacherAttendance 
                                        where dbo.getdatepart('m', iDate) = 9 and dbo.getdatepart('y', iDate) = 2023

--drop table tbl_Students
CREATE TABLE tbl_Students(
	iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
    sLoginName nvarchar (255) unique Not null,	 
	sUserPassword nvarchar(255),
    sAddress nvarchar(255),
    sCity nvarchar(255),
	iContact bigint,
	iAdmissionInClass int,
	iAdmissionDate bigint,
	iDOB bigint,
	bIsActive bit,
	biStudentImage varbinary(MAX)
);
select *from tbl_Students


--drop table tbl_StudentClasswiseInfo
CREATE TABLE tbl_StudentClasswiseInfo(
	iStdId int IDENTITY(1,1) PRIMARY KEY,   
	iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
	iCurrentClass int, 
	iCurrentYear int, 
	bIsActive bit, 
	bResultPrepared bit
);
alter table tbl_StudentClasswiseInfo add iResultStatus int 

--drop table tbl_StudentAttendance
CREATE TABLE tbl_StudentAttendance (
	iStdId int FOREIGN KEY REFERENCES tbl_StudentClasswiseInfo,
	iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
	iClass int,
	iDate bigint,
	iStatus int --0: Absent 1: Present 3: onLeave
);
--drop table tbl_Fees
CREATE TABLE tbl_Fees (
	--iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
	iStdId int FOREIGN KEY REFERENCES tbl_StudentClasswiseInfo,
	iClass int,
    iForMonth int,
	iYear int,
	iDate bigint,  --submission date
	iFee int,
	iPending int,
	iYearlyFee int, --it will come in Fee structure table
	iConcession int,
);

select *from tbl_UserRegistration
select *from tbl_Students
select *from tbl_StudentClasswiseInfo
select *from tbl_StudentAttendance
select *from tbl_Fees

update tbl_Students set iContact=2 where iRegistrationId=11
SELECT DISTINCT a.iRegistrationId, b.sUserName, sAddress, sCity, iContact, iAdmissionInClass, iDOB, c.bIsActive, iAdmissionDate, biStudentImage 
                                        FROM tbl_Students a
										join tbl_UserRegistration b on a.iRegistrationId =b.iRegistrationId
                                        JOIN tbl_StudentClasswiseInfo c ON c.iRegistrationId = b.iRegistrationId
                                        ORDER BY 1

										
select *from tbl_UserRegistration
select *from tbl_Students
select *from tbl_StudentClasswiseInfo where iRegistrationId=11
select *from tbl_StudentAttendance
select *from tbl_Fees

SELECT a.iRegistrationId, c.iStdId, b.sUserName, c.iCurrentClass,c.iCurrentYear 
                                        FROM tbl_Students a 
										join tbl_UserRegistration b on a.iRegistrationId =b.iRegistrationId
                                        JOIN tbl_StudentClasswiseInfo c ON c.iRegistrationId= b.iRegistrationId
                                        WHERE a.bIsActive = 1;


SELECT a.iStdId, d.sUserName, a.iClass, a.iDate, a.iStatus
                                        FROM tbl_StudentAttendance a
                                        JOIN tbl_StudentClasswiseInfo b on a.iStdId = b.iStdID
                                        JOIN tbl_Students c on c.iRegistrationId = b.iRegistrationId
                                        join tbl_UserRegistration d on d.iRegistrationId =b.iRegistrationId
										WHERE iClass = {0}
                                        AND dbo.getdatepart('m',132581633) = {1}
                                        AND dbo.getdatepart('y',132581633) = {2}

						
--drop table tbl_Subjects
CREATE TABLE tbl_Subjects (
	iSubjectId int Primary key identity(1,1),   --as Class
	iClass int,
    sSubjectName nvarchar(100) unique,
	iMaxMark int,
	bIsDefaultSubject bit
);


--drop table tbl_MarkSheet
CREATE TABLE tbl_MarkSheet (
	iMarkSheetId int Primary key identity(1,1),
	iStdId int FOREIGN KEY REFERENCES tbl_StudentClasswiseInfo,
	iClass int,
	iYear int,
	bResultPrepared bit,
);

--drop table tbl_MarksOfSubjects 
CREATE TABLE tbl_MarksOfSubjects (
	iMarkSheetId int FOREIGN KEY REFERENCES tbl_MarkSheet,
	iExamType int
);

select *from tbl_Subjects
select *from tbl_MarkSheet
select *from tbl_MarksOfSubjects

ALTER TABLE tbl_MarksOfSubjects ADD [English] INT NOT NULL DEFAULT(0)


SELECT b.iStdId, c.sUserName, b.iCurrentClass, b.iCurrentYear
FROM tbl_Students a
JOIN tbl_StudentClasswiseInfo b ON a.iRegistrationId = b.iRegistrationId
join tbl_UserRegistration c on c.iRegistrationId =b.iRegistrationId
WHERE b.bIsActive = 1 AND b.bResultPrepared = 0
AND b.iCurrentClass = 4 AND dbo.GETDATEPART('Y',b.iCurrentYear) = 2023
ORDER BY 1

select *from tbl_Students
--select *from tbl_UserRegistration 
select *from tbl_StudentClasswiseInfo 

SELECT a.iRegistrationId, c.iStdId, b.sUserName, c.iCurrentClass,c.iCurrentYear 
FROM tbl_Students a 
join tbl_UserRegistration b on a.iRegistrationId =b.iRegistrationId
JOIN tbl_StudentClasswiseInfo c ON c.iRegistrationId= b.iRegistrationId
WHERE c.bIsActive = 0

SELECT a.iRegistrationId, a.sUserName, ISNULL(iContact, 0)iContact, sQualification, iJoiningDate, iExperiance,ISNULL(bActive,0)[bActive] 
                                    FROM tbl_UserRegistration a
                                    JOIN tbl_Teachers  b on a.iRegistrationId = b.iRegistrationId
                                    WHERE bActive =1

SELECT iRegistrationId, sUserName, iUserType from tbl_UserRegistration where iUserType = 2 and iRegistrationId Not in 
                                    (
                                     select iRegistrationId from tbl_Students  where bIsActive = 1
                                    )

SELECT iRegistrationId, sUserName, iUserType FROM tbl_UserRegistration WHERE iUserType = 2 AND iRegistrationId NOT IN 
                                    (
                                     SELECT iRegistrationId FROM tbl_Students  WHERE bIsActive = 1
                                    )order by sUserName

--============================================
select *from tbl_Menu
update tbl_Menu set iSubModule = 4 where iMenuId=32
--drop table tbl_FeeStructure
CREATE TABLE tbl_FeeStructure (
	iFeeStructureId int Primary key identity(1,1),   --notRequired
	iClass int,
    iYear int,
	--iDate bigint,  --submission date
	--iRegFee int,
	--iAdmissionFee int,
	--iExamFee int,
	iPerMonthFee int, 
	iPerYearFee int, --it will come in Fee structure table
	--iConcession int,
);

--drop table tbl_SalaryIncrement
CREATE TABLE tbl_SalaryIncrement (
	iSalaryId int Primary key identity(1,1),   --notRequired
	iRegistrationId int,
    --iYear int,
	--iDate bigint,  --submission date
	--iRegFee int,
	--iAdmissionFee int,
	--iExamFee int,
	iPerMonthSalary int, 
	--iPerYearFee int, --it will come in Fee structure table
	--iConcession int,
	iHikeDate int, 
	iHikeAmt int
);

--drop table 
select *from tbl_StudentFees
CREATE TABLE tbl_StudentFees (
	iStudentFeesId int Primary key identity(1,1),   --notRequired
	iRegistrationId int FOREIGN KEY REFERENCES tbl_UserRegistration,
	iStdId int FOREIGN KEY REFERENCES tbl_StudentClasswiseInfo,
	iClass int
);

--drop table tbl_MonthlyFee
CREATE TABLE tbl_MonthlyFee (	
	iMonthlyFeeId int Primary key identity(1,1),
	iStudentFeesId int FOREIGN KEY REFERENCES tbl_StudentFees,    
	iDate bigint,  --submission date
	iForMonth int,
	iFee int,
	iConcession int,
);

--drop table tbl_OtherMonthlyFee
CREATE TABLE tbl_OtherMonthlyFee (	
	iOtherMonthlyFeeId int Primary key identity(1,1),
	iMonthlyFeeId int FOREIGN KEY REFERENCES tbl_MonthlyFee,    
	--iDate bigint,  --submission date
	--iForMonth int,
	iFeeType int,
	iAmount int,
	--iConcession int,
);


--drop table tbl_Wallet
CREATE TABLE tbl_Wallet (	
	iWalletId int Primary key identity(1,1),
	iMonthlyFeeId int FOREIGN KEY REFERENCES tbl_MonthlyFee, 
	iSettlement int,
);
select *from tbl_class
select *from tbl_UserRegistration
select c.iStudentFeesId, a.iRegistrationId ,a.iStdId ,b.sUserName ,a.iCurrentClass ,dbo.GETDATEPART('y' ,a.iCurrentYear)[iYear] ,d.iPerMonthFee, ISNULL(e.iSettlement, 0)[iSettlement]
                                            FROM tbl_StudentClasswiseInfo a
                                            JOIN tbl_UserRegistration b on a.iRegistrationId=b.iRegistrationId
                                            JOIN tbl_StudentFees c on c.iRegistrationId = a.iRegistrationId or c.iStdId = a.iStdId
                                            JOIN tbl_FeeStructure d on d.iClass = a.iCurrentClass
										    LEFT JOIN tbl_StudentWallet e on e.iStudentFeesId = c.iStudentFeesId
                                            where a.iRegistrationId = 12 or a.iStdId= 0

SELECT iStudentFeesId FROM tbl_StudentFees where iRegistrationId = 0 or iStdId = 3


select *from tbl_StudentClasswiseInfo where iRegistrationId=10
select *from tbl_UserRegistration where iUserType =3 and iRegistrationId=10
select *from tbl_StudentFees where iRegistrationId=10
select *from tbl_MonthlyFee 
select *from tbl_StudentWallet
 where iUserType =3 and iRegistrationId=10
select *from tbl_UserRegistration where iUserType =3 and iRegistrationId=10


select * from tbl_Menu where iMenuId = 210
update tbl_Menu set isubmodule =0 where iMenuId = 181

select *from tbl_UserRegistration  where susername like '%Ahsa%'
select *from tbl_teachers where iRegistrationId=20

select a.iRegistrationId, c.sUserName, COUNT(a.iRegistrationId)[NoOfWorkingDays], b.iPerMonthSalary , COUNT(a.iRegistrationId) * b.iPerMonthSalary [NetMonthlySalary]
from tbl_TeacherAttendance a
join tbl_Salary b on a.iRegistrationId = b.iRegistrationId
join tbl_UserRegistration c on a.iRegistrationId = c.iRegistrationId
join tbl_Teachers d on  a.iRegistrationId = d.iRegistrationId
where dbo.GetDatePart('m',iDate) = 9 and dbo.GetDatePart('y',iDate) = 2023
And d.bActive = 1
group by a.iRegistrationId ,c.sUserName,  b.iPerMonthSalary


--dbo.GetDatePart('d',iDate)

select *from tbl_TeacherAttendance where iRegistrationId=20 and iDate= dbo.GetDatePart('d',iDate)
select *from tbl_StudentAttendance

select *from tbl_UserRegistration 
select *from tbl_Teachers 

SELECT b.iRegistrationId, b.sUserName, ISNULL(c.iPerMonthSalary,0) from tbl_Teachers a
JOIN tbl_UserRegistration b ON a.iRegistrationId=b.iRegistrationId
LEFT JOIN tbl_Salary c ON c.iRegistrationId = a.iRegistrationId
where a.bActive = 1 or c.iYear=2023



select a.iRegistrationId, c.sUserName,30 [DayOfMonths], COUNT(a.iRegistrationId)[NoOfWorkingDays] , 30 - COUNT(a.iRegistrationId) [DeductionDays], 
b.iPerMonthSalary/12 [iPerDaySalary], COUNT(a.iRegistrationId) * b.iPerMonthSalary/12 [iNetMonthlySalary], b.iPerMonthSalary [iMaxMonthlySalary]
from tbl_TeacherAttendance a
join tbl_Salary b on a.iRegistrationId = b.iRegistrationId
join tbl_UserRegistration c on a.iRegistrationId = c.iRegistrationId
join tbl_Teachers d on  a.iRegistrationId = d.iRegistrationId
where dbo.GetDatePart('m',iDate) = 9 and dbo.GetDatePart('y',iDate) = 2023 And d.bActive = 1
group by a.iRegistrationId ,c.sUserName,  b.iPerMonthSalary
order by c.sUserName


SELECT a.iRegistrationId, b.iStdId, a.sUserName FROM tbl_UserRegistration a
JOIN tbl_StudentClasswiseInfo b ON a.iRegistrationId = b.iRegistrationId
WHERE b.iCurrentClass = 1 AND dbo.GETDATEPART('y' ,b.iCurrentYear) = 2023

select *from tbl_Menu where sMenuName='LoadFeesStructure'
update tbl_Menu set sMenuName='FeeStructure'  where sMenuName='LoadFeesStructure'



select *from tbl_StudentFees
select *from tbl_MonthlyFee where iStudentFeesId=10




select * from tbl_TimeTable where iClass=1
select *from tbl_TimeTableRowData where iTimeTableId=1

--select *from tbl_subjects
--select *from tbl_TimeTableRowData where icla
--update tbl_TimeTableRowData  set SubjectName

--alter tbl_TimeTableRowData drop SubjectName  

----add SubjectName nvarchar (50) Default 'Hindi'

select *from tbl_FeeStructure WHERE iFeeStructureId = 1
UPDATE tbl_FeeStructure SET iPerMonthFee = 200, iPerYearFee = 1000 WHERE iFeeStructureId = 1
SELECT iRegistrationId, sUserName, sLoginName, sUserPassword, iUserType FROM tbl_UserRegistration WHERE iRegistrationId = 57

SELECT * Delete from tbl_UserRegistration where iRegistrationId=0
where iUserType=2 
and iRegistrationId NOT IN
(
	select iRegistrationId from tbl_Teachers 
)

SELECT iRegistrationId, sUserName, iUserType FROM tbl_UserRegistration WHERE iUserType = 2 AND iRegistrationId NOT IN 
(
    SELECT iRegistrationId FROM tbl_Teachers
)ORDER BY sUserName



SELECT *FROM tbl_StudentFees where iRegistrationId = 15
select *from tbl_MonthlyFee where iStudentFeesId = 15 
select *from tbl_Wallet where iWalletId=24

delete from tbl_MonthlyFee  where iStudentFeesId = 15
delete from  tbl_Wallet 




--drop table tbl_TimeTableLayout
CREATE TABLE tbl_TimeTableLayout (
	iLayoutId int IDENTITY (1,1) PRIMARY KEY, 
	sLayoutName nvarchar (200), 
	iNoOfPeriod int, 
	iFirstPeriod int,  
	iDuration int,
	iLunchDuration int,
	iLunchBreak int,
	iClass int,
	iCreatedDate int,
)
select iLayoutId,sLayoutName,iNoOfPeriod,iFirstPeriod,iDuration,iLunchBreak,iClass,iCreatedDate 
from tbl_TimeTableLayout where sLayoutName='1' and iClass=1

insert into tbl_TimeTableLayout (sLayoutName,iNoOfPeriod,iFirstPeriod,iDuration,iLunchBreak,iClass,iCreatedDate)
values (sLayoutName,iNoOfPeriod,iFirstPeriod,iDuration,iLunchBreak,iClass,iCreatedDate)

--Drop table tbl_TimeTableRowData
CREATE TABLE tbl_TimeTableRowData(	
	iRowDataId int Primary key identity(1,1),
	iLayoutId int FOREIGN KEY REFERENCES tbl_TimeTableLayout, 
	iRowInd int,
	iColInd int,
	iTeacherId int, 
	sTeacherName nvarchar (200),
	sSubjectName nvarchar (50) 
);

select *from tbl_TimeTableLayout
select *from tbl_TimeTableRowData

SELECT iLayoutId, sLayoutName, iNoOfPeriod, iFirstPeriod, iDuration, iLunchBreak, iClass, iCreatedDate 
                                        FROM tbl_TimeTableLayout 
                                        WHERE sLayoutName = ISNULL(sLayoutName ,'') or iClass = 4

select a.iRegistrationId, b.iStdId,  a.sUserName,  b.iCurrentClass,d.iDate, d.iFee, MaxFee.iPerMonthFee, d.iFee-MaxFee.iPerMonthFee [GettingFee],
d.iForMonth,d.iMonthlyFeeId
 from tbl_UserRegistration a 
join tbl_StudentClasswiseInfo b on a.iRegistrationId=b.iRegistrationId
join tbl_FeeStructure MaxFee on MaxFee.iClass=b.iCurrentClass
join tbl_StudentFees c on c.iStdId=b.iStdId
join tbl_MonthlyFee d on d.iStudentFeesId = c.iStudentFeesId
where (a.iRegistrationId=10 or b.iStdId = 3) and d.iMonthlyFeeId = 71


SELECT a.iMonthlyFeeId, a.iForMonth, c.iPerMonthFee[iMaxFee], a.iFee [iAmount], (a.iFee - c.iPerMonthFee)[iSettlement], a.iConcession,
                                        CASE 
	                                        WHEN (a.iFee - c.iPerMonthFee) = 0 THEN 'Full paid' 
	                                        WHEN (a.iFee - c.iPerMonthFee) > 0 THEN 'Advance' 
	                                        ELSE 'Partially' 
                                        END [Status] 
                                        FROM tbl_MonthlyFee a
                                        JOIN tbl_StudentFees b ON b.iStudentFeesId = a.iStudentFeesId
                                        JOIN tbl_FeeStructure c ON c.iClass = b.iClass
                                        WHERE a.iStudentFeesId = 2


select *from tbl_SchoolInfo

--Drop table tbl_StudentPersonalFields
CREATE TABLE tbl_StudentPersonalFields(		
iFieldId int Primary key identity(1,1),	
iModule int,
iSubModule int,
iPanelId int,
sName nvarchar (200),
sCaption nvarchar (200),
sClass nvarchar (20),
iControlType int,
iReadonly bit,
iHidden bit
);

select *from tbl_StudentPersonalFields
Select iFieldId, iModule, iSubModule, iPanelId, sName, sCaption, sClass, iControlType, iReadonly, iHidden from tbl_StudentPersonalFields 
insert into tbl_StudentPersonalFields (iFieldId, iModule, iSubModule, iPanelId, sName, sCaption, sClass, iControlType, iReadonly, iHidden)values (@iFieldId, @iModule, @iSubModule, @iPanelId, @sName, @sCaption, @sClass, @iControlType, @iReadonly, @iHidden)
Delete from tbl_StudentPersonalFields where iFieldId=0

--LoadModuleSubmodule as Menu of Module
select *from tbl_Menu where iSubModule = 0
select *from tbl_Menu where iSubModule = 1
select *from tbl_Menu where iSubModule = 2
select *from tbl_Menu where iSubModule = 3
select *from tbl_Menu where iSubModule = 4
select *from tbl_Menu where iSubModule = 5
update tbl_Menu set iModule=1 where iMenuId = 5


select *from tbl_StudentPersonalFields
where iModule = 5 and iSubModule = 5 and iPanelId = 1



If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_ExtraFields')
BEGIN
    CREATE TABLE [dbo].[tbl_ExtraFields](
	        [iFieldId] [int] IDENTITY(1,1) NOT NULL
        )
END

select *from tbl_ExtraFields
select * from tbl_StudentPersonalFields

alter table tbl_ExtraFields add [sEmail] nvarchar (200)
alter table tbl_ExtraFields add [sPassword] nvarchar (200)
alter table tbl_ExtraFields add [iRememberMe] int

alter table tbl_ExtraFields drop column [sEmail] 
alter table tbl_ExtraFields drop column [iRememberMe]

SELECT name [sFieldColumn] FROM sys.columns WHERE object_id in 
(
    SELECT object_id FROM sys.tables WHERE NAME ='tbl_ExtraFields'
) AND name <> 'iFieldId'


select top(2)* from tbl_CommitteeInfo order by  1
select * from tbl_CommitteeInfo order by 1 desc

select top(1)* from tbl_schoolinfo 
insert into tbl_CommitteeInfo (iid,sname) values (1, 'abc')

update  tbl_UserRegistration set sFatherName = 'Father name'

select iRegistrationId, sUserName, iUserType, ISNULL(sFirstName, '')sFirstName, ISNULL(iAdmissionInClass, 0)iAdmissionInClass, ISNULL(iExperience, 0)iExperience, ISNULL(sFatherName,'')sFatherName, ISNULL(iContact, 0)iContact, ISNULL(iDOB,0)iDOB, 
ISNULL(iDOBId, 0)iDOBId, ISNULL(iGender, 0) iGender, ISNULL(sBloodGroup,'')sBloodGroup, ISNULL(sReligion, '')sReligion    
from tbl_UserRegistration where iUserType = 3
select *from tbl_StudentClasswiseInfo
select *from tbl_Students 


select *From tbl_UserRegistration 
alter table tbl_UserRegistration add iReligion int

alter table tbl_UserRegistration drop column sReligion

SELECT iGender, iRegistrationId, sUserName, iUserType FROM tbl_UserRegistration WHERE iUserType = 3 AND iRegistrationId NOT IN 
(
SELECT iRegistrationId FROM tbl_Students
)ORDER BY sUserName




SELECT DISTINCT a.iRegistrationId, b.sUserName, a.sAddress, a.sCity, a.iContact, a.iAdmissionInClass, a.iDOB, c.bIsActive, a.iAdmissionDate, a.biStudentImage 
                                        FROM tbl_Students a
										join tbl_UserRegistration b on a.iRegistrationId =b.iRegistrationId
                                        JOIN tbl_StudentClasswiseInfo c ON c.iRegistrationId = b.iRegistrationId
                                        ORDER BY 1
update tbl_UserRegistration set sFirstName = @sFirstName, sUserName = @sUserName, iAdmissionInClass = @iAdmissionInClass, iExperience = @iExperience, sFatherName = @sFatherName, iContact = @iContact, iDOB = @iDOB, iDOBId = @iDOBId, iGender = @iGender,  iBloodGroup = @iBloodGroup, iReligion = @iReligion, iUserType = @iUserType
where iRegistrationId = 

SELECT iRegistrationId FROM tbl_Teachers
SELECT * FROM tbl_UserRegistration WHERE iRegistrationId = 2104
SELECT * FROM tbl_StudentClasswiseInfo

Delete from tbl_UserRegistration WHERE iRegistrationId = 22

alter table tbl_Teachers add iContact bigint
SELECT iRegistrationId FROM tbl_Teachers WHERE iRegistrationId = 22
select * delete from tbl_TeacherAttendance where iRegistrationId
in(select iRegistrationId from tbl_UserRegistration where iUserType = 3)

select iRegistrationId, ISNULL(sAddress,'')[sAddress], ISNULL(sCity, '')[sCity], ISNULL(iContact, 0)[iContact], ISNULL(iAdmissionInClass, 0)[iAdmissionInClass],
                ISNULL(iDOB, 0)[iDOB], ISNULL(bIsActive, 0)[bIsActive], ISNULL(biStudentImage, 0)[biStudentImage], ISNULL(sLoginName, '')[sLoginName], ISNULL(sUserPassword, '')[sUserPassword]
                FROM tbl_Students WHERE iRegistrationId = 2104

update tbl_Students set icontact =9999999999 WHERE iRegistrationId = 1


select * FROM tbl_UserRegistration where iRegistrationId=2102
select *from tbl_Teachers  where iRegistrationId=2102

update tbl_UserRegistration set iRegContact = 90 where iRegistrationId=2104
update tbl_Teachers set iContact = 0 where iRegistrationId=2102

SELECT a.iRegistrationId, a.sUserName, 
CASE WHEN a.iRegContact > 0 THEN a.iRegContact 
WHEN b.iContact > 0 THEN b.iContact 
END [iContact]
,sQualification, iJoiningDate, b.iExperience,ISNULL(bIsActive,0)[bIsActive] 
FROM tbl_UserRegistration a
JOIN tbl_Teachers  b on a.iRegistrationId = b.iRegistrationId
ORDER BY a.sUserName

update tbl_menu set bisactive where isubmodule = 5 


select *from tbl_menu.TABLES
tbl_Teachers
drop table tbl_TeacherAttandence
select *from tbl_TeacherAttendance

select *from tbl_StudentAttendance



select *from tbl_UserRegistration
select *from tbl_Students
select *from tbl_StudentClasswiseInfo

SELECT DISTINCT a.iRegistrationId, b.sUserName, a.sAddress, a.sCity, a.iContact, a.iAdmissionInClass, a.iDOB, c.bIsActive, a.iAdmissionDate, a.biStudentImage 
                                        FROM tbl_Students a
										join tbl_UserRegistration b on a.iRegistrationId =b.iRegistrationId
                                        JOIN tbl_StudentClasswiseInfo c ON c.iRegistrationId = b.iRegistrationId
										where c.iCurrentClass=4
                                        ORDER BY 1


--2 ajaj 99
--2 ajaj 100
--3 ajaj 101

If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_ClassInfo')
BEGIN
    CREATE TABLE [dbo].[tbl_ClassInfo](
	        [iClassInfoId] [int] IDENTITY(1,1),
			iClass int, 
			sSection nvarchar (50), 
			sCreatedBy nvarchar (50), 
			iCreatedDate int
        )
END

SELECT ISNULL(iLicenseInfo, 0) iLicenseInfo, ISNULL(sDbName, '')sDbName, ISNULL(sProvider, '')sProvider, ISNULL(sKey, '')sKey, ISNULL(iValidity, 0)iValidity, ISNULL(iInstallationDate, 0)iInstallationDate, ISNULL(iExpiryDate, 0)iExpiryDate, ISNULL(iEducationStage, 0)iEducationStage 
FROM tbl_LicenseInfo ORDER BY 1

SELECT ISNULL(iClassInfoId ,0)iClassInfoId, ISNULL(iClass, 0)iClass, ISNULL(sSection,'')sSection, ISNULL(sCreatedBy,'')sCreatedBy, ISNULL(iCreatedDate, 0)iCreatedDate
FROM tbl_ClassInfo

select *FROM tbl_ClassInfo

update tbl_LicenseInfo set iEducationStage =2
select *from [tbl_ClassInfo]



select *from tbl_UserRegistration
select *from tbl_Students
--alter table tbl_Students add sSection nvarchar (50)
select *from tbl_StudentClasswiseInfo
select *FROM tbl_LicenseInfo 
select *FROM tbl_ClassInfo

select *FROM tbl_ClassInfo where iClass = 1

SELECT a.iStdId, d.sUserName, a.iClass, a.iDate, a.iStatus , *
                                        FROM tbl_StudentAttendance a
                                        JOIN tbl_StudentClasswiseInfo b on a.iStdId = b.iStdID
                                        JOIN tbl_Students c on c.iRegistrationId = b.iRegistrationId
                                        join tbl_UserRegistration d on d.iRegistrationId =b.iRegistrationId
										WHERE iClass = 4 and ssection='4-A'


--alter table tbl_Students drop column sSection sClassSection varchar (20)
--alter table tbl_UserRegistration add sClassSection varchar (20)
--alter table tbl_StudentClasswiseInfo add sClassSection varchar (20)
--alter table tbl_StudentAttendance add sClassSection varchar (20)

select *from tbl_UserRegistration where iRegistrationId = 2121
select *from tbl_Students where iRegistrationId = 2121
select *from tbl_StudentClasswiseInfo where iRegistrationId = 2121

SELECT b.iStdId, a.sUserName, b.sClassSection --, b.iCurrentClass, a.iDate, a.iStatus
                                    FROM tbl_UserRegistration a
                                    JOIN tbl_StudentClasswiseInfo b on a.iRegistrationId= b.iRegistrationId
	                                WHERE (b.iCurrentClass = 0 OR b.sClassSection = N'4-A') and b.bIsActive = 1  
									ORDER BY a.sUserName

									update tbl_StudentClasswiseInfo set sClassSection='4-A' where iStdId=1034
									update tbl_StudentAttendance set iDate=132581642 where iStdId=1034

SELECT iStdId, iDate, iStatus FROM tbl_StudentAttendance 
where ((dbo.getdatepart('m', iDate) = 9 and dbo.getdatepart('y', iDate) = 2023) OR iDate = 132581642)
and sClassSection='4-A'

select *from tbl_StudentAttendance

select *from tbl_StudentClasswiseInfo
select * from tbl_MarkSheet
select dbo.getdatepart('M', iCreatedDate)[Month], * from tbl_MarksOfSubjects  
order by 2

--alter table tbl_MarkSheet add sClassSection varchar (20)
--ALTER TABLE tbl_MarksOfSubjects ADD iCreatedDate INT 


SELECT b.iStdId, c.sUserName, b.iCurrentClass, b.iCurrentYear
                                        FROM tbl_Students a
                                        JOIN tbl_StudentClasswiseInfo b ON a.iRegistrationId = b.iRegistrationId
										join tbl_UserRegistration c on c.iRegistrationId =b.iRegistrationId
                                        WHERE b.bIsActive = 1 AND b.bResultPrepared = 0
                                        AND b.sClassSection = '1-A' AND dbo.GETDATEPART('Y',b.iCurrentYear) = 2024
                                        ORDER BY 1

select iMarkSheetId, * from tbl_MarkSheet where iStdId in(1034,1036)
select dbo.getdatepart('M', iCreatedDate)[Month], * from tbl_MarksOfSubjects  
where iMarkSheetId in (select iMarkSheetId from tbl_MarkSheet where iStdId in(1034,1036))
order by 2

--update tbl_Menu set sMenuName= 'CreateSubjectInput' where sMenuName='CreateSubjectInput'
SELECT iSubjectId, iClass, sSubjectName, iMaxMark, ISNULL(bIsDefaultSubject, 0)[bIsDefaultSubject]
                                        FROM tbl_Subjects

Update tbl_Subjects set iClass = 1, sSubjectName = '1', iMaxMark = 0 Where iSubjectId = 0

select *from tbl_LicenseInfo
--delete from tbl_LicenseInfo where iLicenseInfo=2
--alter table tbl_LicenseInfo drop column iInstallationDate
--alter table tbl_LicenseInfo drop column iExpiryDate
--alter table tbl_LicenseInfo drop column iValidity
--alter table tbl_LicenseInfo add iFromDate int
--alter table tbl_LicenseInfo add iToDate int
--alter table tbl_LicenseInfo add iInstallationDate int

SELECT b.iStdId, c.sUserName,*
                                FROM tbl_StudentClasswiseInfo b 
                                JOIN tbl_Students a ON a.iRegistrationId = b.iRegistrationId
                                join tbl_UserRegistration c on c.iRegistrationId =b.iRegistrationId
                                WHERE b.bIsActive = 1 AND b.bResultPrepared = 0
                                AND b.sClassSection = '1-A' AND dbo.GETDATEPART('Y',b.iCurrentYear) = 2024
                                ORDER BY 1

select *from tbl_MarkSheet where iStdId in (1036,1039,1040,1041)
select *from tbl_MarksOfSubjects where iMarkSheetId in (1147,1148,1149,1150)
update tbl_MarksOfSubjects set [Sub-2]=11 where iMarkSheetId=1147
update tbl_MarksOfSubjects set [Sub-2]=18 where iMarkSheetId=1148


--select dbo.GetDatePart('M', iCreatedDate)[Month], HindiForClass1 from tbl_MarksOfSubjects  
--                        where iMarkSheetId = (select iMarkSheetId from tbl_MarkSheet where iStdId = 1036) and iExamType = 1
--                        order by 1

--SELECT name [sSubjectColumnName],* FROM sys.columns WHERE object_id in 
--                                    (
--                                        SELECT object_id FROM sys.tables WHERE NAME ='tbl_MarksOfSubjects'
--                                    ) AND name <> 'iMarkSheetId' AND name <> 'iExamType' AND name <> 'iCreatedDate'

--select dbo.GetDatePart('M', iCreatedDate)[Month], 1[Sub-2],[Sub-1] from tbl_MarksOfSubjects  
--                        where iMarkSheetId = (select iMarkSheetId from tbl_MarkSheet where iStdId = 1036) and iExamType = 1
--                        order by 1

--Special drop
--alter table tbl_MarksOfSubjects drop constraint DF__tbl_Marks__Engli__68D28DBC
--alter table tbl_MarksOfSubjects drop column [[English_2]]]
--EXEC sp_RENAME 'tbl_MarksOfSubjects.[English]' , 'English_1', 'COLUMN'

select *from tbl_Subjects
select *from tbl_MarksOfSubjects
update tbl_Subjects set sSubjectName='English_1' where sSubjectName='English'
--update tbl_MarksOfSubjects set English_1 =20

select *from tbl_Students where iRegistrationId NOT IN (select iRegistrationId from tbl_UserRegistration where iUserType=3)
select *from tbl_UserRegistration where iRegistrationId NOT IN (select iRegistrationId from tbl_Students) and iUserType=3





SELECT a.iRegistrationId, sUserName, iUserType 
FROM tbl_UserRegistration a
right join tbl_Students b on a.iRegistrationId=b.iRegistrationId
WHERE iUserType = 3 
AND iRegistrationId=2125 --iAdmissionInClass = 1
SELECT *FROM tbl_Students 

If NOT EXISTS (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tbl_SubjectMM')
BEGIN
CREATE TABLE [dbo].[tbl_SubjectMM](
	[iSubjectMMId] [int] IDENTITY(1,1) NOT NULL,
	[iSubjectId] int FOREIGN KEY REFERENCES tbl_Subjects, 
	[iExamType] [int] NULL,
	[iMaxMark] [int] NULL,
	[iCreatedDate] [int] NULL,
)
END

--create Function [dbo].[DateToInt]  
--                        (  
--                         @dDate Datetime  
--                        )  
--                        returns int  
--                        Begin  
--                         return ((DATEPART(YEAR,@dDate) * 65536) | (DATEPART(MONTH,@dDate) *256) | DATEPART(DAY,@dDate))  
--                        End
select *from tbl_Subjects
select *from tbl_MarkSheet
select *from tbl_MarksOfSubjects
select *from tbl_SubjectMM

SELECT SUM(imaxmark) FROM tbl_SubjectMM WHERE iSubjectId IN (SELECT iSubjectId FROM tbl_Subjects WHERE iClass = 1) AND iExamType = 1

select *from tbl_UserRegistration where iRegistrationId=2127
select *from tbl_Students where iRegistrationId=2127
select *from tbl_Students where istdid=2127
select dbo.IntToDate(icurrentyear), * delete from tbl_StudentClasswiseInfo where iRegistrationId=2127 and bResultPrepared = 0

select sclassSection, dbo.IntToDate(icurrentyear),dbo.GetDatePart('Y', icurrentyear), *from tbl_StudentClasswiseInfo 
where (sclassSection is null or sclassSection='') and icurrentClass= 2 and iCurrentYear >= 132580097

--add screen to update section who just passout and comes in new class
select dbo.DateToInt('01-03-2023') --132580097 // mm/dd/y
select dbo.IntToDate(132580097)
select dbo.IntToDate(132645633)

SELECT icurrentyear,* FROM tbl_StudentClasswiseInfo WHERE iStdId = 1043
SELECT icurrentyear,* FROM tbl_StudentClasswiseInfo WHERE iStdId = 1046

SELECT icurrentyear,* FROM tbl_StudentClasswiseInfo WHERE iRegistrationId = 2127
SELECT icurrentyear,* FROM tbl_StudentClasswiseInfo WHERE iRegistrationId = 2128

--alter table tbl_teachers add iReligion int , iBloodGroup int, iGender int

SELECT b.iStdId, c.sUserName                                  
FROM tbl_StudentClasswiseInfo b                                   
JOIN tbl_Students a ON a.iRegistrationId = b.iRegistrationId                                  
join tbl_UserRegistration c on c.iRegistrationId =b.iRegistrationId                                  
WHERE b.bIsActive = 1 AND b.bResultPrepared = 0                                  
AND b.sClassSection = '1-A' --AND b.iCurrentYear <= 132580097
ORDER BY 1

select dbo.IntToDate(132580097)
select dbo.IntToDate(132580353)
select dbo.IntToDate(132580123)
select dbo.datetoint(132580123)

--alter table tbl_StudentClasswiseInfo add iDateUpto int
--update tbl_StudentClasswiseInfo set iDateUpto =132645889

SELECT b.iStdId, c.sUserName
FROM tbl_StudentClasswiseInfo b 
JOIN tbl_Students a ON a.iRegistrationId = b.iRegistrationId
join tbl_UserRegistration c on c.iRegistrationId =b.iRegistrationId
WHERE b.bIsActive = 1 --AND b.bResultPrepared = 0
AND b.sClassSection = '1-A' AND b.iCurrentYear <= 132580123 And b.iDateUpto >= 132580123
ORDER BY 1

select sUserPassword,sLoginName, * from tbl_Teachers
--alter table tbl_Teachers drop column sUserPassword
--alter table tbl_Teachers drop constraint UQ__tbl_Teac__36A88882251D5D98
--alter table tbl_Teachers drop column sLoginName
--alter table tbl_Students drop column sUserPassword
--alter table tbl_Students drop constraint UQ__tbl_Stud__36A88882B9804671
--alter table tbl_Students drop column sLoginName
--alter table tbl_UserRegistration drop column idob, idobid,igender,ibloodgroup,ireligion
alter table tbl_Students drop column bIsActive
select *from tbl_Students
select *from tbl_StudentClasswiseInfo

select * FROM tbl_Menu where sMenuName like '%defin%'

select * from tbl_UserAttendance  where sClassSection <> '' --AND dbo.GetDatePart('M', iAttendanceDate) = 1 AND dbo.GetDatePart('Y', iAttendanceDate) = 2024
select * from tbl_AttendanceRegister where iDayId in (select iDayid from tbl_UserAttendance  where sClassSection <> '' )

select dbo.IntToDate(132645121)

SELECT iUserId FROM tbl_AttendanceRegister where iDayId in (8,9)
SELECT a.iDayId, iLogedUserId, iAttendanceDate, sClassSection FROM tbl_UserAttendance a
join tbl_AttendanceRegister b on a.iDayId=b.iDayId
where sClassSection = '' 
AND dbo.GetDatePart('M', iAttendanceDate) = 1 AND dbo.GetDatePart('Y', iAttendanceDate) = 2024
SELECT iDayId, iLogedUserId, iAttendanceDate, sClassSection FROM tbl_UserAttendance WHERE iAttendanceDate = 132580353 and sClassSection = '1-B'

SELECT a.iUserId, b.iAttendanceDate FROM tbl_AttendanceRegister a
join tbl_UserAttendance b on a.iDayId = b.iDayId
where b.iDayId in (10)

SELECT iUserId, iAttendanceDate from where tbl_AttendanceRegister iDayId = 10

drop table tbl_TeacherAttendance
drop table tbl_StudentAttendance

--==================

--Create a screen to declare salary of teacher and upgrade it yealy or when declare hike of teacher
select *from tbl_UserRegistration where iusertype=3 
select *from tbl_teachers --Deep info

SELECT a.iRegistrationId, a.sUserName, b.iJoiningDate FROM tbl_UserRegistration a
JOIN tbl_teachers b ON a.iRegistrationId = b.iRegistrationId
WHERE iUserType = 2


select dbo.inttoDate(iHikeDate), isalaryid, *from tbl_Salary where iregistrationid=11 
order by iHikeDate desc
--alter table tbl_Salary add iHikeDate int, iHikeAmt int
 

select distinct a.iRegistrationId, a.sUserName, 30 [iDaysOfMonth], COUNT(a.iRegistrationId)[iNoOfWorkingDays]
,e.iPerMonthSalary
--, (
--	select top (1)iPermonthSalary  from tbl_Salary 
--	--where iregistrationid=11 
--	order by ihikeDate desc 

--)iPermonthSalary
--,c.iDayId,d.iLogedUserId[WhoTakenAttendance],
--d.iAttendanceDate, 
--, *
from tbl_UserRegistration a
join tbl_Teachers b on b.iRegistrationId=a.iRegistrationId
join tbl_AttendanceRegister c on c.iUserId=a.iRegistrationId
join tbl_UserAttendance d on d.iDayId=c.iDayId
join tbl_Salary e on e.iRegistrationId = a.iRegistrationId
where a.iUserType = 2 and b.bIsActive=1
and dbo.GetDatePart('m', d.iAttendanceDate)=1
and dbo.GetDatePart('y', d.iAttendanceDate)=2025
and dbo.GetDatePart('m', e.iHikeDate) = 1
and dbo.GetDatePart('y', e.iHikeDate) = 2025
--and e.iPerMonthSalary
--and iDateInput Month Year
GROUP BY a.iRegistrationId ,
--d.iAttendanceDate,
a.sUserName,
e.iPermonthSalary



select iDayId, dbo.inttodate(d.iAttendanceDate), *from tbl_UserAttendance d
where dbo.GetDatePart('m', d.iAttendanceDate)=1
and dbo.GetDatePart('y', d.iAttendanceDate)=2025

select *from tbl_AttendanceRegister where idayid in (15,16)

SELECT a.iUserId, c.sUserName, 30 [iDayOfMonths], COUNT(a.iUserId)[iNoOfWorkingDays] , 30 - COUNT(a.iUserId) [iDeductionDays], 
b.iPerMonthSalary/12 [iPerDaySalary], COUNT(a.iUserId) * b.iPerMonthSalary/12 [iNetMonthlySalary], b.iPerMonthSalary [iMaxMonthlySalary]
FROM tbl_AttendanceRegister a
join tbl_UserAttendance aa on a.iDayId=aa.iDayId
join tbl_Salary b on a.iUserId = b.iRegistrationId
join tbl_UserRegistration c on a.iUserId = c.iRegistrationId
join tbl_Teachers d on  a.iUserId = d.iRegistrationId
WHERE dbo.GetDatePart('m',aa.iAttendanceDate) = 4 
--and dbo.GetDatePart('y',aa.iAttendanceDate) = 2023 
And d.bIsActive = 1
GROUP BY a.iUserId,c.sUserName,  b.iPerMonthSalary
ORDER BY c.sUserName

select a.iRegistrationId, a.sUserName, 30 [DaysOfMonth], temp
(
--select *from tbl_Salary where iregistrationid=11 order by ihikeDate desc 
select top (1)iPermonthSalary  from tbl_Salary where iregistrationid=11 order by ihikeDate desc 

)temp,
--,c.iDayId,d.iLogedUserId[WhoTakenAttendance],
--d.iAttendanceDate, 
COUNT(a.iRegistrationId)[iNoOfWorkingDays]
--, *
from tbl_UserRegistration a
join tbl_Teachers b on b.iRegistrationId=a.iRegistrationId
join tbl_AttendanceRegister c on c.iUserId=a.iRegistrationId
join tbl_UserAttendance d on d.iDayId=c.iDayId
join tbl_Salary e on e.iRegistrationId = a.iRegistrationId
where a.iUserType=2 and b.bIsActive=1
and dbo.GetDatePart('m', d.iAttendanceDate)=1
and dbo.GetDatePart('y', d.iAttendanceDate)=2025
--and iDateInput Month Year
GROUP BY a.iRegistrationId ,
--d.iAttendanceDate,
a.sUserName





select dbo.inttodate(ihikedate), *from tbl_Salary 

select distinct iRegistrationId, ipermonthsalary from tbl_Salary 
group by iRegistrationId,ipermonthsalary 

select *from tbl_userregistration where iuserid=3

select iDayId, dbo.inttodate(d.iAttendanceDate), *from tbl_UserAttendance d
where dbo.GetDatePart('m', d.iAttendanceDate)=1
and dbo.GetDatePart('y', d.iAttendanceDate)=2025

select *from tbl_AttendanceRegister where idayid in (15,16)

select  dbo.inttodate(iattendancedate) ,*from tbl_UserAttendance where idayid in (select idayid from tbl_AttendanceRegister where iuserid=3)


declare @iMonth int = 2
select distinct a.iRegistrationId, a.sUserName, 30 [iDaysOfMonth], COUNT(a.iRegistrationId)[iNoOfWorkingDays]
,e.iPerMonthSalary, COUNT(a.iRegistrationId) * e.iPerMonthSalary [NetSalary]
from tbl_UserRegistration a
join tbl_Teachers b on b.iRegistrationId=a.iRegistrationId
join tbl_AttendanceRegister c on c.iUserId=a.iRegistrationId
join tbl_UserAttendance d on d.iDayId=c.iDayId
join tbl_Salary e on e.iRegistrationId = a.iRegistrationId
where a.iUserType = 2 and b.bIsActive=1
and dbo.GetDatePart('m', d.iAttendanceDate)=@iMonth 
and dbo.GetDatePart('y', d.iAttendanceDate)=2025
and dbo.GetDatePart('m', e.iHikeDate) = @iMonth 
and dbo.GetDatePart('y', e.iHikeDate) = 2025
--and e.iPerMonthSalary
--and iDateInput Month Year
GROUP BY a.iRegistrationId ,
--d.iAttendanceDate,
a.sUserName,
e.iPermonthSalary


declare @iMonth int = 1

select 
(
	select 
	--distinct a.iRegistrationId, a.sUserName, 30 [iDaysOfMonth], COUNT(a.iRegistrationId)[iNoOfWorkingDays]
	--,e.iPerMonthSalary, (COUNT(a.iRegistrationId) * e.iPerMonthSalary) [NetSalary]
	temp.iDayId
	from 

	(
		select *
		--dbo.inttodate(iattendancedate) ,*
		from tbl_UserAttendance 
		where 
		idayid in (
			select a.idayid --,a.iuserid
			--,	*
			from tbl_AttendanceRegister a
			join tbl_UserRegistration b on b.iRegistrationId = a.iUSerid
			where --iuserid = 11 -- in (3,11)
			b.iusertype = 2
		)
		and 
		sClassSection = '' 
		and dbo.GetDatePart('m', iAttendanceDate) = 1 
		and dbo.GetDatePart('y', iAttendanceDate) = 2025

	)temp
)temp2

tbl_UserRegistration a
join tbl_Teachers b on b.iRegistrationId=a.iRegistrationId
join tbl_AttendanceRegister c on c.iUserId=a.iRegistrationId
join tbl_UserAttendance d on d.iDayId=c.iDayId
join tbl_Salary e on e.iRegistrationId = a.iRegistrationId
where a.iUserType = 2 and b.bIsActive=1
and dbo.GetDatePart('m', d.iAttendanceDate)=@iMonth 
and dbo.GetDatePart('y', d.iAttendanceDate)=2025
--and dbo.GetDatePart('m', e.iHikeDate) = @iMonth 
--and dbo.GetDatePart('y', e.iHikeDate) = 2025
--and e.iPerMonthSalary
--and iDateInput Month Year
GROUP BY a.iRegistrationId ,
--d.iAttendanceDate,
a.sUserName,
e.iPermonthSalary


select  dbo.inttodate(iattendancedate) ,*
from tbl_UserAttendance 
where 
idayid in (
	select idayid 
--	,	*
	from tbl_AttendanceRegister where iuserid = 11 -- in (3,11)

)
and 
sClassSection = '' 
and dbo.GetDatePart('m', iAttendanceDate) = 1 
and dbo.GetDatePart('y', iAttendanceDate) = 2025



select   dbo.inttodate(iattendancedate) ,*
from tbl_UserAttendance 
where 
idayid in (
	select iuserid, count( idayid )
--	,	*
	from tbl_AttendanceRegister 
	--where iuserid in (3,11)
group by iuserid

)
and 
sClassSection = '' 
and dbo.GetDatePart('m', iAttendanceDate) = 1 
and dbo.GetDatePart('y', iAttendanceDate) = 2025


select * from [tbl_UserAttendance]
select *from tbl_AttendanceRegister where iuserid=3

select  dbo.inttodate(iattendancedate) ,*from tbl_UserAttendance 
--where idayid in (select idayid from tbl_AttendanceRegister where iuserid=3)
select *from tbl_AttendanceRegister 
where idayid in (15,16)

--original
SELECT userRegistration.iRegistrationId , userRegistration.sUserName,  attendanceRegister.iPresentDay
FROM  tbl_UserRegistration userRegistration
RIGHT JOIN (
    SELECT a.iLogedUserId, b.iUserId, COUNT(b.iUserId)[iPresentDay]
    FROM[tbl_UserAttendance] a JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
    WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132710913) 
	AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132710913) 
	AND sClassSection = ''
    GROUP BY a.iLogedUserId, b.iUserId
) AS attendanceRegister
ON attendanceRegister.iUserId = userRegistration.iRegistrationId
JOIN tbl_Teachers teacher ON teacher.iRegistrationId = userRegistration.iRegistrationId WHERE teacher.bIsActive = 1


SELECT a.iAttendanceDate
FROM[tbl_UserAttendance] a JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132710913) 
AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132710913) 
AND sClassSection = ''
AND b.iUserId =11

declare @iDate int = 132645890
						SELECT a.iRegistrationId, a.sUserName, b.iJoiningDate FROM tbl_UserRegistration a
                            JOIN tbl_teachers b ON a.iRegistrationId = b.iRegistrationId
                            WHERE iUserType = 2 and b.bIsActive=1 and iJoiningDate <= @iDate


select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME like '%salary%'

--Not in use
--CREATE TABLE [dbo].[tbl_UserMonthwiseSalary](
--	[iSalaryId] [int] IDENTITY(1,1),
--	[iRegistrationId] [int],
--	[iDate] [int],
--	[iSalary] [int],
--)
--select *from [tbl_UserMonthwiseSalary]
--insert into tbl_UserMonthwiseSalary (iSalaryId, iRegistrationId, iDate, iSalary) values (0,0,0,0)

--==========================Salary distribution
select iPerMonthSalary
 from tbl_Salary
 where iRegistrationId = 11 
and dbo.getdatepart('m', iHikeDate) = dbo.getdatepart('m', 132710940) 
and dbo.getdatepart('y', iHikeDate) = dbo.getdatepart('y', 132710940) 


--else

select top(1) iPerMonthSalary 
from tbl_Salary
 where iRegistrationId = 11 
order by ihikedate desc

--===============================
--use madarsa123

SELECT userRegistration.iRegistrationId , userRegistration.sUserName,  attendanceRegister.iPresentDay, c.iSalary
FROM  tbl_UserRegistration userRegistration
RIGHT JOIN (
    SELECT a.iLogedUserId, b.iUserId, COUNT(b.iUserId)[iPresentDay]
    FROM[tbl_UserAttendance] a JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
    WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132710940) AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132710940) AND sClassSection = ''
    GROUP BY a.iLogedUserId, b.iUserId
) AS attendanceRegister
ON attendanceRegister.iUserId = userRegistration.iRegistrationId
JOIN tbl_UserMonthwiseSalary c on c.iRegistrationId = userRegistration.iRegistrationId
JOIN tbl_Teachers teacher ON teacher.iRegistrationId = userRegistration.iRegistrationId 
WHERE teacher.bIsActive = 1

SELECT iHikeDate, iPerMonthSalary, iHikeAmt FROM tbl_salary WHERE iregistrationid=11 and iHikeDate < 0

SELECT iHikeDate, iPerMonthSalary, iHikeAmt FROM tbl_salary WHERE iRegistrationId = 11 AND iHikeDate < 132710940



SELECT userRegistration.iRegistrationId , userRegistration.sUserName,  attendanceRegister.iPresentDay, c.iSalary 
                    FROM  tbl_UserRegistration userRegistration
                    RIGHT JOIN (
                        SELECT a.iLogedUserId, b.iUserId, COUNT(b.iUserId)[iPresentDay]
                        FROM[tbl_UserAttendance] a JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
                        WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132711196) AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132711196) AND sClassSection = ''
                        GROUP BY a.iLogedUserId, b.iUserId
                    ) AS attendanceRegister
                    ON attendanceRegister.iUserId = userRegistration.iRegistrationId
                    JOIN tbl_UserMonthwiseSalary c on c.iRegistrationId = userRegistration.iRegistrationId
                    JOIN tbl_Teachers teacher ON teacher.iRegistrationId = userRegistration.iRegistrationId 
					WHERE teacher.bIsActive = 1
					and c.iDate = 132710940

SELECT b.iUserId, c.sUserName, COUNT(b.iUserId)[iPresentDay]
FROM tbl_UserAttendance a 
JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
join tbl_UserRegistration c on b.iUserId = c.iRegistrationId
WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132710940) 
AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132710940) 
AND sClassSection = ''
GROUP BY b.iUserId, c.sUserName

select top(1) *from tbl_SalaryIncrement
where iRegistrationId = 11 
order by iHikeDate

IF EXISTS (select iRegistrationId from tbl_SalaryIncrement where iRegistrationId = 11 and iHikeDate = 132710941)
begin 
	select iRegistrationId from tbl_SalaryIncrement 
	where --iRegistrationId = 11 And
	dbo.GetDatePart('M', iHikeDate) = dbo.GetDatePart('M', 132710940) 
	AND dbo.GetDatePart('Y', iHikeDate) = dbo.GetDatePart('Y', 132710940) 
	order by iHikeDate desc
end
else
begin
		select top (1) iRegistrationId from tbl_SalaryIncrement order by iHikeDate desc
end 



SELECT b.iUserId[iRegistrationId], c.sUserName,  COUNT(b.iUserId)[iPresentDay]
FROM[tbl_UserAttendance] a 
JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
JOIN tbl_UserRegistration c on c.iRegistrationId = b.iUserId
WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132710940) 
AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132710940) AND sClassSection = ''
GROUP BY b.iUserId, c.sUserName

IF EXISTS (select iRegistrationId from tbl_SalaryIncrement where iRegistrationId = 3 and iHikeDate = 132710941)
begin 
	select iSalaryId, iRegistrationId, iHikeDate, iHikeAmt, iPerMonthSalary from tbl_SalaryIncrement 
	where dbo.GetDatePart('M', iHikeDate) = dbo.GetDatePart('M', 132710940) 
	AND dbo.GetDatePart('Y', iHikeDate) = dbo.GetDatePart('Y', 132710940) 
	order by iHikeDate desc
end
else
begin
		select top (1) iSalaryId, iRegistrationId, iHikeDate, iHikeAmt, iPerMonthSalary from tbl_SalaryIncrement order by iHikeDate desc
end 

SELECT b.iUserId[iRegistrationId], c.sUserName,  COUNT(b.iUserId)[iPresentDay]
                            FROM[tbl_UserAttendance] a 
                            JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
                            JOIN tbl_UserRegistration c on c.iRegistrationId = b.iUserId
                            WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132711452) 
                            AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132711452) AND sClassSection = ''
                            GROUP BY b.iUserId, c.sUserName


SELECT userRegistration.iRegistrationId , userRegistration.sUserName,  attendanceRegister.iPresentDay, c.iSalary
                    FROM  tbl_UserRegistration userRegistration
                    RIGHT JOIN (
                        SELECT a.iLogedUserId, b.iUserId, COUNT(b.iUserId)[iPresentDay]
                        FROM[tbl_UserAttendance] a JOIN tbl_AttendanceRegister b ON a.iDayId = b.iDayId
                        WHERE dbo.GetDatePart('M', iAttendanceDate) = dbo.GetDatePart('M', 132710940) AND dbo.GetDatePart('Y', iAttendanceDate) = dbo.GetDatePart('Y', 132710940) AND sClassSection = ''
                        GROUP BY a.iLogedUserId, b.iUserId
                    ) AS attendanceRegister
                    ON attendanceRegister.iUserId = userRegistration.iRegistrationId
                    JOIN tbl_UserMonthwiseSalary c on c.iRegistrationId = userRegistration.iRegistrationId
                    JOIN tbl_Teachers teacher ON teacher.iRegistrationId = userRegistration.iRegistrationId 
                    WHERE teacher.bIsActive = 1 AND c.iDate = 132710940

					select *from tbl_SalaryIncrement
					select *from tbl_UserMonthwiseSalary 


select *from tbl_menu where smenuname like '%salary%'
--update tbl_menu set smenuname = 'DefineUserSalaryInputs' where smenuname = 'MonthlySalary'
--update tbl_menu set smenuname = 'UserSalaryDistribution' where smenuname = 'SalaryRegister'
--update tbl_menu set smenuname = 'UserSalaryReportInput' where smenuname = 'LoadTeachersSalaryInput'


use madarsa123
select *from tbl_menu where smenuname like '%salary%'
select *from tbl_menu where scaption like '%salary%'

select c.iStudentFeesId, a.iRegistrationId ,a.iStdId ,b.sUserName ,a.iCurrentClass ,dbo.GETDATEPART('y' ,a.iCurrentYear)[iYear] ,
                                            d.iPerMonthFee, ISNULL(ccc.iSettlement, 0)[iSettlement]
                                            FROM tbl_StudentClasswiseInfo a
                                            JOIN tbl_UserRegistration b on a.iRegistrationId=b.iRegistrationId
                                            JOIN tbl_StudentFees c on c.iRegistrationId = a.iRegistrationId or c.iStdId = a.iStdId
                                            join tbl_MonthlyFee cc on cc.iStudentFeesId=c.iStudentFeesId
                                            LEFT JOIN tbl_Wallet ccc on ccc.iMonthlyFeeId = cc.iMonthlyFeeId
                                            JOIN tbl_FeeStructure d on d.iClass = a.iCurrentClass
                                            where a.iRegistrationId = 6 or a.iStdId= 0



--Student info
select dbo.IntToDate(iRegDate), *from tbl_UserRegistration where iregistrationid=6
select dbo.IntToDate(iAdmissionDate), *from tbl_students where iregistrationid=6
select dbo.IntToDate(iCurrentYear),dbo.IntToDate(iDateUpto),  *from tbl_StudentClasswiseInfo where iregistrationid=6

select a.iRegistrationId, c.iStdId, a.sUserName, a.sFatherName, c.iCurrentClass from tbl_UserRegistration a
join tbl_students b on b.iRegistrationId = a.iRegistrationId
join tbl_StudentClasswiseInfo c on c.iRegistrationId = a.iRegistrationId
WHERE c.iCurrentClass = 1 AND dbo.GETDATEPART('y' ,c.iCurrentYear) = 2023 AND dbo.GETDATEPART('y' ,c.iDateUpto) = 2024
--where a.iRegistrationId=6



delete from tbl_Wallet --where iStudentFeesId in (select iStudentFeesId from tbl_MonthlyFee )
delete from tbl_MonthlyFee --where iStudentFeesId=9

SELECT * FROM tbl_FeeStructure --Where iYear = {0} ORDER BY iClass



select *from tbl_MonthlyFee
select *from tbl_OtherMonthlyFee

--update tbl_StudentClasswiseInfo   set iAdmissionFee =250
alter table tbl_StudentClasswiseInfo  add iAdmissionFee int

SELECT iFeeType, iAmount FROM tbl_OtherMonthlyFee WHERE iMonthlyFeeId = 313

use madarsa123
select *from tbl_students


select *from tbl_FeeStructure
select *from tbl_StudentFees
select *from tbl_MonthlyFee 
select *from tbl_OtherMonthlyFee
select *from tbl_Wallet

select *from tbl_MonthlyFee 
select *from tbl_OtherMonthlyFee
select *from tbl_Wallet


SELECT d.sUserName ,a.iMonthlyFeeid [Monthly Fee id], a.iStudentFeesId [Student Fees Id], a.iForMonth [For Month], a.iFee [Fee Collection], b.isettlement [Settlement] 
FROM tbl_StudentFees c
JOIN tbl_MonthlyFee a ON a.iStudentFeesId = c.iStudentFeesId
JOIN tbl_Wallet  b ON b.iMonthlyFeeid = a.iMonthlyFeeid
Join tbl_UserRegistration d on d.iRegistrationId = c.iRegistrationId
WHERE c.iClass = 1 
AND iForMonth = 1 
AND dbo.GetDatePart('y', a.iDate) =  0

select *from tbl_StudentFees 
select *from tbl_MonthlyFee 
select *from tbl_otherMonthlyFee 

select istudentfeesid from tbl_StudentFees where iregistrationid = 6
select *from tbl_MonthlyFee where istudentfeesid in (select istudentfeesid from tbl_StudentFees where iregistrationid = 6)


SELECT d.sUserName, a.iMonthlyFeeid [Monthly Fee id], a.iStudentFeesId [Student Fees Id], a.iForMonth [For Month], a.iFee [Fee Collection], b.isettlement [Settlement] FROM tbl_StudentFees c
                                        JOIN tbl_MonthlyFee a ON a.iStudentFeesId = c.iStudentFeesId
                                        JOIN tbl_Wallet  b ON b.iMonthlyFeeid = a.iMonthlyFeeid
                                        JOIN tbl_UserRegistration d on d.iRegistrationId = c.iRegistrationId
                                        WHERE c.iClass = 1 
										AND dbo.GetDatePart('M', a.iForMonth) =  5
										AND dbo.GetDatePart('Y', a.iForMonth) =  2023
										--AND iDate = 2025
select dbo.getdatepart('Y', 132580353)
										--AND dbo.GetDatePart('y', a.iDate) =  0


