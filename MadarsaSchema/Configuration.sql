use MADARSA123
--START : Enable disable tab and its children menu
select *from tbl_Menu where bIsGroup=1 
select *from tbl_Menu where iMenuId  = 400
select *from tbl_Menu where iSubModule in (select iModule from tbl_Menu where iMenuId  = 400)


--update tbl_Menu set bIsActive = 0 where iMenuId = 0
--update tbl_Menu set bIsActive = 0 where iSubModule in (select iModule from tbl_Menu where iMenuId  = 400)
--END: Enable disable tab and its children menu