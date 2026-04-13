/*

 DELETE FROM [Scraper02].[dbo].[hostTbl]
 DELETE FROM [Scraper02].[dbo].[pageTbl]
 DELETE FROM [Scraper02].[dbo].[linkTbl]
 DELETE FROM [Scraper02].[dbo].[scrapeTbl]

*/

SELECT 'hostTbl' as tableName, *  FROM [Scraper02].[dbo].[hostTbl]
SELECT 'pageTbl' as tableName, *  FROM [Scraper02].[dbo].[pageTbl]
SELECT 'linkTbl' as tableName, *  FROM [Scraper02].[dbo].[linkTbl]
SELECT 'scrapeTbl' as tableName, *  FROM [Scraper02].[dbo].[scrapeTbl]

/*
DELETE FROM [Scraper02].[dbo].[logTbl]
SELECT *  FROM [Scraper02].[dbo].[logTbl]
*/



delete from linktbl 
delete FROM [Scraper02].[dbo].[hostTbl] -- where host <> 'jeff32819.com'
delete FROM [Scraper02].[dbo].[pageTbl] -- where cleanLink <> 'https://jeff32819.com'
delete FROM [Scraper02].[dbo].[scrapeTbl] -- where cleanLink <> 'https://jeff32819.com'





/*
update pagetbl set linkcount = -1
update [scrapeTbl] set statusCode = -1
insert into pageTbl (host, cleanLink, fullUrl) values ('jeff32819.com', 'https://jeff32819.com', 'https://jeff32819.com') 
insert into scrapeTbl (host, cleanLink) values ('jeff32819.com', 'https://jeff32819.com') 

DELETE FROM [Scraper02].[dbo].hostTbl
DELETE FROM [Scraper02].[dbo].[linkTbl]

DELETE FROM [Scraper02].[dbo].pageTbl where cleanlink like '%.pdf'
DELETE FROM [Scraper02].[dbo].[scrapeTbl] where cleanlink like '%.pdf'

*/
SELECT *  FROM [Scraper02].[dbo].hostTbl
SELECT * FROM [Scraper02].[dbo].[linkTbl]

SELECT *  FROM [Scraper02].[dbo].pageTbl -- where cleanlink like '%.jpg'
SELECT * FROM [Scraper02].[dbo].[scrapeTbl]  order by scrapedatetime desc
--update scrapetbl set scrapeDatetime = GETUTCDATE () where statuscode <> -1

--select * from pagetbl where cleanlink not in (select cleanlink from scrapetbl where contenttype = 'text/html')

