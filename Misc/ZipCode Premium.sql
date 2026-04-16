SELECT * 
  FROM [Jamin].[dbo].[ZIPCODEWORLDPREMIUM]
  where zip_code = 30024
  go


--  UPDATE [ZIPCODEWORLDPREMIUM]
--SET geopoint = geography::STPointFromText('POINT(' + CAST([Longitude] AS VARCHAR(20)) + ' ' + 
--                    CAST([Latitude] AS VARCHAR(20)) + ')', 4326)

declare @geo1 geography
select @geo1 = geopoint from [ZIPCODEWORLDPREMIUM] where zip_code = 30024

select 
'insert into jaminAtlanta.dbo.zipTbl (zip, miles) values (''' + convert(varchar(20), zip_code) + ''', ' + convert(varchar(20), miles) + ')' as x
from (SELECT *, convert(int, (@geo1.STDistance(geopoint) / 1609.344)) as miles 
FROM [ZIPCODEWORLDPREMIUM]) tbl
where miles <= 100
