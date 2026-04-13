DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql = @sql +
    'DROP PROCEDURE [' + SCHEMA_NAME(schema_id) + '].[' + name + '];' + CHAR(13)
FROM sys.procedures
WHERE name LIKE 'dt\_%' ESCAPE '\';

PRINT @sql;  -- Review before executing
EXEC sp_executesql @sql;