select count(*)
    FROM [WebScraper].[dbo].[hostTbl] wh 
    WHERE maxPageToScrape >= 0 and not exists (select 1 from [Scraper02].[dbo].[hostTbl] sh where sh.host = wh.host)
