/***************************************

DELETE ALL STORED PROCEDURES WITH PREFIX.

****************************************/

DECLARE @prefix NVARCHAR(MAX) = N'dt_';
DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql = @sql + 'DROP PROCEDURE [' + SCHEMA_NAME(schema_id) + '].[' + name + '];' + CHAR(13)
FROM sys.procedures
WHERE name LIKE @prefix + '%' ESCAPE '\';
PRINT ''
PRINT 'DELETE THESE'
PRINT @sql;  -- Review before executing
PRINT ''
PRINT '-------------------'
-- EXEC sp_executesql @sql;