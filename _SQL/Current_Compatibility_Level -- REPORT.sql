SELECT 
    name AS [Database_Name],
    compatibility_level AS [Current_Compatibility_Level],
    CASE 
        WHEN compatibility_level = 170 THEN 'Up to Date (2025)'
        WHEN compatibility_level = 160 THEN 'SQL Server 2022'
        WHEN compatibility_level = 150 THEN 'SQL Server 2019'
        WHEN compatibility_level = 140 THEN 'SQL Server 2017'
        WHEN compatibility_level = 130 THEN 'SQL Server 2016'
        WHEN compatibility_level = 120 THEN 'SQL Server 2014'
        WHEN compatibility_level = 110 THEN 'SQL Server 2012'
        WHEN compatibility_level = 100 THEN 'SQL Server 2008'
        ELSE 'Older Version'
    END AS [Version_Name],
    is_query_store_on AS [Query_Store_Enabled],
    state_desc AS [Database_State]
FROM sys.databases
WHERE database_id > 4 -- Excludes system databases (master, tempdb, model, msdb)
  AND (compatibility_level < 170 OR is_query_store_on = 0)
ORDER BY compatibility_level ASC;