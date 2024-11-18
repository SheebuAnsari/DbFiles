--create database MadarsaC
--use Menu1
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[tbl_Menu](
--	[iMenuId] [int] NULL,
--	[sMenuName] [nvarchar](255) NULL unique,
--	[sCaption] [nvarchar](255) NULL,
--	[iModule] [int] NULL,
--	[iSubModule] [int] NULL,
--	[bIsGroup] [bit] NULL,
--	[bIsActive] [bit] NULL,
--	[column1] [int] NULL
--) ON [PRIMARY]
--GO


--use MadarsaD
--From 0-50 as Module
--After 50 all are sub menu for respective module
--------------DEVELOPER -------------------------------DEVELOPER--------------------------DEVELOPER--------------------
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (0, 'Developer', 'Developer', 0, -1, 1, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (51, 'AddMenuInput', 'AddMenu', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (52, 'TestIconsInput', 'TestIcons', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (53, 'SummaryStageOfEducationInput', 'SummaryStageOfEducation', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (54, 'CalculatenoofPeriodsInput', 'CalculatenoofPeriods', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (55, 'PrintRecieptInput', 'PrintReciept', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (56, 'AdmissionFormInput', 'AdmissionForm', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (57, 'RegistrationFormInput', 'RegistrationForm', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (58, 'AddExtraFieldInInput', 'AddExtraFieldIn', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (59, 'TestExtraFieldInInput', 'TestExtraFieldIn', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (60, 'DateforLicenseInput', 'DateforLicense', -1, 0, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (61, 'ManageSchoolTimingInput', 'Manage School Timing', -1, 0, 0, 1)

					
--Till 100

--------------Admin--------------------------------------------Admin--------------------------Admin--------------------
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (1, 'Admin', 'Admin', 1, -1, 1, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (101, 'ActiveTeachersInput', 'ActiveTeachers', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (102, 'InActiveTeachersInput', 'InActiveTeachers', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (103, 'StudentsIdCardsInput', 'StudentsIdCards', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (104, 'TakeTeacherAttendanceInput', 'TakeTeacherAttendanceInput', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (105, 'LoadTeacherAttendanceInput', 'LoadTeacherAttendanceInput', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (106, 'TeachersDetailInput', 'TeachersDetail', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (107, 'TimeTableInput', 'TimeTableNew', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (108, 'TimeTableLayoutInput', 'TimeTableLayout', -1, 1, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (109, 'SchoolInfoInput', 'SchoolInfo', -1, 1, 0, 1)
--Till 200

--------------TEACHER--------------------------------------------TEACHER--------------------------TEACHER--------------------
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (2, 'Teacher', 'Teacher', 2, -1, 1, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (201, 'LoadAllStudentsInput', 'LoadAllStudents', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (202, 'ActiveStudentsInput', 'ActiveStudents', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (203, 'InActiveStudentsInput', 'InActiveStudents', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (204, 'SaveStudentAttendanceInput', 'SaveStudentAttendanceInput', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (205, 'LoadStudentAttendanceInput', 'LoadStudentAttendanceInput', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (206, 'CreateMarksheetInput', 'CreateMarksheetInputs', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (207, 'CreateDMarksheetInput', 'CreateDMarksheetInputs', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (208, 'CreateSubjectInput', 'CreateSubjectInput', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (209, 'DefineMaximumMarksInputs', 'DefineMaximumMarksInputs', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (210, 'DisplayMarksheetInput', 'DisplayMarksheetInputs', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (211, 'LoadSemesterMarksheetInput', 'LoadSemesterMarksheetInputs', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (212, 'LoadTestMarksInput', 'LoadTestMarks', -1, 2, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (213, 'AddMaxMarkInput', 'AddMaxMark', -1, 2, 0, 1)
--Till 300

--------------STUDENT--------------------------------------------STUDENT--------------------------STUDENT--------------------
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (3, 'Student', 'Student', 3, 2, 1, 1)
--Till 400

--------------Account--------------------------------------------Account--------------------------Account--------------------
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (4, 'Account', 'Account', 4, 2, 1, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (401, 'FeeSubmissionInput', 'FeeSubmission', -1, 4, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (402, 'ClasswiseStudentsInput', 'ClasswiseStudents', -1, 4, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (404, 'FeeStructureInput', 'FeeStructure', -1, 4, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (405, 'MonthlySalaryInput', 'Define user salary', -1, 4, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (406, 'LoadTeachersSalaryInput', 'Report user salary', -1, 4, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (407, 'FeeCollectionInput', 'FeeCollection', -1, 4, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (408, 'UserSalaryDistributionInput', 'Salary Distribution', -1, 4, 0, 1)
--Till 500


--------------ADMISSION--------------------------------------------ADMISSION--------------------------ADMISSION--------------------
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (5, 'Admission', 'Admission', 5, -1, 1, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (501, 'DefineClassSectionInput', 'DefineSection', -1, 5, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (502, 'PrintSelectedStudentsInput', 'PrintSelectedStudents', -1, 5, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (503, 'TeacherAdmissionInput', 'TeacherAdmission', -1, 5, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (504, 'DefineEducationStageInput', 'DefineEducationStage', -1, 5, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (505, 'StudentAdmissionInput', 'StudentAdmission', -1, 5, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (506, 'AddPersonalFieldsInput', 'AddPersonalFields', -1, 5, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (507, 'TestAddFieldInput', 'TestAddField', -1, 5, 0, 1)
INSERT INTO tbl_Menu (iMenuId, sMenuName, sCaption, iModule, iSubModule, bIsGroup, bIsActive) 
                    VALUES (508, 'RegistrationWindowInput', 'RegistrationWindow', -1, 5, 0, 1)
--Till 600
