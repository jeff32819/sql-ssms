select primaryContactID, * from quoteTbl where quoteid = 72340 

-- update quoteTbl set primaryContactID = null where quoteid = 72340 
-- delete from quoteContactTbl where quoteid = 72340

select * from quoteContactQry where quoteid = 72340 order by contactid 

-- select * from quoteContacttbl where contactid = 64696;