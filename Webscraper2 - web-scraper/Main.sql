use v2
go

SELECT 
    (SELECT COUNT(*) FROM [linkHashTbl]) AS LinkHashCount,
    (SELECT COUNT(*) FROM [linkTbl]) AS LinkCount,
    (SELECT COUNT(*) FROM [pageTbl]) AS PageCount;



SELECT * FROM [linkHashTbl]
SELECT * FROM [linkTbl]
SELECT * FROM [pageTbl]

-- SELECT * FROM SchemaVersions
-- SELECT * FROM [seedTbl]
-- SELECT * FROM [skipDomainTbl]




GO

