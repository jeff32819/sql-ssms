SELECT TOP (1000) [uid]
      ,[quoteID]
      ,[title]
      ,[qty]
      ,[pointId]
  FROM [Jamin].[dbo].[quoteMoveItemTbl]
  where [quoteid] = 56170;

  /*** use to fill just text (not with qty) ***************/
  SELECT STUFF((
    SELECT ', ' + CAST([title] AS NVARCHAR(MAX))
    FROM [quoteMoveItemTbl]
    WHERE [title] IS NOT NULL and [quoteid] = 56170
    ORDER BY [title]
    FOR XML PATH(''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS delimited_string

/*** use to fill qty & text *********************************/
SELECT STUFF((
    SELECT ', ' + 
           CASE 
               WHEN [qty] >= 2 THEN CAST([qty] AS NVARCHAR(50)) + ' ' 
               ELSE '' 
           END + 
           CAST([title] AS NVARCHAR(MAX))
    FROM [quoteMoveItemTbl]
    WHERE [title] IS NOT NULL 
      AND [quoteid] = 56170
    ORDER BY [title]
    FOR XML PATH(''), TYPE
).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS delimited_string;
