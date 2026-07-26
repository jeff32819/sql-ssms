DECLARE @quoteID INT = 64518;

select * from quoteTbl where quoteID = @quoteID
select * from quoteEstimateDateTbl where quoteID = @quoteID

select * from empTbl where empID in (select estimatorId from quoteEstimateDateTbl where quoteID = @quoteID)

go
-- delete from estimateMessageTbl

select * from estimateMessageTbl

-- delete  from quoteestimateDateTbl where quoteID = 64518