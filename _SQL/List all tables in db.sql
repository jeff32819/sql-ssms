SELECT 
    s.name AS [SchemaName],
    t.name AS [TableName],
    t.create_date AS [CreatedDate],
    t.modify_date AS [LastModifiedDate]
FROM 
    sys.tables t
INNER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
ORDER BY 
    t.create_date DESC;