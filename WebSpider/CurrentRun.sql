use WebSpider
go
select 
tbl.total
,tbl.need2visit
,(tbl.need2visit / convert(decimal(10,2),tbl.total)) as percentLeft2do
from 
(select 
(select count(*) from linktbl) as total
,(select count(*) from linktbl where isnull(statuscode,'') = '') as need2visit) tbl




SELECT TOP 100 * FROM LINKTBL ORDER BY ID DESC
delete FROM linktbl where linkurl like '%407area.com/login%'