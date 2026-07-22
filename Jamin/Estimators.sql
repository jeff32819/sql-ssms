DECLARE @quoteID INT = 64518;

select * from quoteTbl where quoteID = @quoteID
select * from quoteEstimateDateTbl where quoteID = @quoteID