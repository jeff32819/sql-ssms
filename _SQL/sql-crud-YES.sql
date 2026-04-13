DECLARE @TableName NVARCHAR(128) = 'linktbl';
DECLARE @SchemaName NVARCHAR(128) = 'dbo';
DECLARE @KeyColumn NVARCHAR(128);
DECLARE @InsertColumns NVARCHAR(MAX);
DECLARE @InsertParams NVARCHAR(MAX);
DECLARE @InsertValues NVARCHAR(MAX);
DECLARE @UpdateColumns NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(MAX);

-- Identify the primary key column (fallback: first identity column)
SELECT TOP 1 @KeyColumn = COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = @TableName
  AND TABLE_SCHEMA = @SchemaName
ORDER BY ORDINAL_POSITION;

IF @KeyColumn IS NULL
BEGIN
    SELECT TOP 1 @KeyColumn = COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
      AND TABLE_SCHEMA = @SchemaName
      AND COLUMNPROPERTY(object_id(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 1;
END

-- Build parameter list (all columns including key)
SELECT @InsertParams = STUFF((
    SELECT ', @' + COLUMN_NAME + ' ' + DATA_TYPE +
           CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL AND CHARACTER_MAXIMUM_LENGTH > 0
                THEN '(' + CAST(CHARACTER_MAXIMUM_LENGTH AS NVARCHAR) + ')'
                ELSE '' END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
      AND TABLE_SCHEMA = @SchemaName
    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

-- Build insert column list (exclude identity if PK is identity)
SELECT @InsertColumns = STUFF((
    SELECT ', ' + COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
      AND TABLE_SCHEMA = @SchemaName
      AND COLUMNPROPERTY(object_id(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 0
    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

-- Build insert values list
SELECT @InsertValues = STUFF((
    SELECT ', @' + COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
      AND TABLE_SCHEMA = @SchemaName
      AND COLUMNPROPERTY(object_id(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 0
    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

-- Build update set clause (exclude identity and key column)
SELECT @UpdateColumns = STUFF((
    SELECT ', ' + COLUMN_NAME + ' = @' + COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
      AND TABLE_SCHEMA = @SchemaName
      AND COLUMNPROPERTY(object_id(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 0
      AND COLUMN_NAME <> @KeyColumn
    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '');

-- Final procedure text
SET @SQL = '
CREATE PROCEDURE ' + @SchemaName + '.spUpsert_' + @TableName + '
(
    ' + @InsertParams + '
)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM ' + @SchemaName + '.' + @TableName + ' WHERE ' + @KeyColumn + ' = @' + @KeyColumn + ')
    BEGIN
        UPDATE ' + @SchemaName + '.' + @TableName + '
        SET ' + @UpdateColumns + '
        WHERE ' + @KeyColumn + ' = @' + @KeyColumn + ';
    END
    ELSE
    BEGIN
        INSERT INTO ' + @SchemaName + '.' + @TableName + ' (' + @InsertColumns + ')
        VALUES (' + @InsertValues + ');
    END
END;
';

PRINT @SQL;  -- Copy the output and run it to create the procedure