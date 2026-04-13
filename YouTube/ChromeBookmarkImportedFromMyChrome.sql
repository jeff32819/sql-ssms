
-- on ionos server

use vorlando
go

SELECT count(*) FROM [vorlando].[dbo].[ChromeBookmarkImportedFromMyChrome]
SELECT count(*) FROM [vorlando].[dbo].[ChromeBookmarkImportedFromMyChrome] where url like '%youtube.com%'
SELECT top 10 * FROM [vorlando].[dbo].[ChromeBookmarkImportedFromMyChrome] where url like '%youtube.com%'