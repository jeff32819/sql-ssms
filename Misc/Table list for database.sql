SELECT 
    name AS TableName, 
    create_date AS CreationDate, 
    modify_date AS LastModifiedDate
FROM sys.tables
ORDER BY create_date DESC;