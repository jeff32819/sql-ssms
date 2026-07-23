DECLARE @quoteID INT = 64518;

select * from quoteTbl where quoteID = @quoteID
select * from quoteEstimateDateTbl where quoteID = @quoteID

select * from empTbl where empID in (select estimatorId from quoteEstimateDateTbl where quoteID = @quoteID)



go
alter view estimatorReportQry as
select 
	d.estimateDateId,
	d.quoteId,
	d.estimatorId,
	e.empFirstName,
	e.empLastName,
	d.dateTime as estimateDateTime
from quoteEstimateDateTbl d
inner join empTbl e on e.empID = d.estimatorId
where d.estimatorId > 0