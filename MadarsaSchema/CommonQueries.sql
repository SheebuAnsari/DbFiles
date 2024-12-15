--use MadarsaD
----Start : Provide Licence info
--select *from tbl_LicenseInfo
--insert into tbl_LicenseInfo (sDbName, sProvider,sKey,iEducationStage,iInstallationDate,iFromDate,iToDate) 
--values ('MadarsaA', 'Sheebu', 'Key-123', 2, 0, 132580097, 132710940)
----End : Provide Licence info

--INSERT INTO tbl_UserRegistration (sUserName, iUserType) VALUES ('su', 1) 
--INSERT INTO tbl_Login (iRegistrationId, sUserId,sUserPassword) values (1, 'su@MadarsaA.com', 'su')

--select *from tbl_Menu where bIsGroup= 1 order by iModule
--select *from tbl_Menu where iSubModule in (select iModule from tbl_Menu where iModule = 0)

--Dont show Dev tab to End user.
--select *from tbl_Menu where bIsGroup= 1 order by iModule
update tbl_Menu set bIsActive = 0 where bIsGroup= 1 and iMenuId =0 
--update tbl_Menu set bIsActive = 0 where iSubModule in (select iModule from tbl_Menu where iModule = 0)

--Start : Provide Licence info
--insert into tbl_LicenseInfo (sDbName, sProvider,sKey,iEducationStage,iInstallationDate,iFromDate,iToDate, sDbNameCaption) values ('MadarsaA', 'Sheebu', 'Key-123', 2, 0, 132580097, 132710940, 'MadarsaA')
--select *from tbl_LicenseInfo
--End : Provide Licence info

