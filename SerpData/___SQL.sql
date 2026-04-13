declare @id int = 4;

 --   delete FROM [SerpData].[dbo].[spiderTbl] where spiderid = @id


SELECT *   FROM [SerpData].[dbo].[spiderTbl]
SELECT *   FROM [SerpData].[dbo].[spiderTbl] where spiderid = @id
SELECT *   FROM [SerpData].[dbo].[spiderStepTbl]  where spiderid = @id

