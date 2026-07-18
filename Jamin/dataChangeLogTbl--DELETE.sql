USE [Jamin]
GO

-- DELETE FROM [PANAMACITY\DEV14].[Jamin].[dbo].[dataChangeLogTbl]


DELETE FROM [PANAMACITY\DEV14].[Jamin].[dbo].[dataChangeLogTbl]
WHERE id < (
    SELECT MIN(id)
    FROM (
        SELECT TOP 20 id
        FROM [PANAMACITY\DEV14].[Jamin].[dbo].[dataChangeLogTbl]
        ORDER BY id DESC
    ) AS KeepRows
);