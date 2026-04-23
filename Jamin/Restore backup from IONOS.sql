
-- Generated UTC : [2026-04-23 19:56:46] 
-- Target Server : [PANAMACITY\DEV14]
-- Database      : [Jamin]


USE [master];
GO

-- =============================================
-- 1. CONFIGURATION VARIABLES
-- =============================================

DECLARE @TargetServer NVARCHAR(128) = N'PANAMACITY\DEV14';
DECLARE @DbName       NVARCHAR(128) = N'Jamin';

-- Logical Names (from the backup file)
DECLARE @DataName NVARCHAR(128) = N'Jamin';
DECLARE @LogsName NVARCHAR(128) = N'Jamin_log';

-- Physical Paths
DECLARE @DataFilePath NVARCHAR(500) = N'X:\SqlServerData\Dev14\Jamin_data.mdf';
DECLARE @LogsFilePath NVARCHAR(500) = N'X:\SqlServerData\Dev14\Jamin_logs.ldf';
DECLARE @BakFilePath  NVARCHAR(500) = N'X:\SqlServerBak\Dev14\063_quotesearchcontactqry__ 26-04-18__1407~[JEFF32819VM01~jsm14]~[Jamin].bak';

-- =============================================
-- 2. SERVER SAFETY CHECK
-- =============================================

IF (@@SERVERNAME != @TargetServer)
BEGIN
    RAISERROR('STOP! Incorrect Server. Expected %s but found %s', 16, 1, @TargetServer, @@SERVERNAME);
    SET NOEXEC ON;
END

-- =============================================
-- 3. PREPARE & RESTORE (Using Dynamic SQL)
-- =============================================

DECLARE @Sql NVARCHAR(MAX);
DECLARE @KickUsers BIT = 1; -- You could also make this a template variable

-- Kick users out if DB exists
IF DB_ID(@DbName) IS NOT NULL AND @KickUsers = 1
BEGIN
    PRINT 'KickUsers is enabled. Setting ' + @DbName + ' to SINGLE_USER...';
    SET @Sql = N'ALTER DATABASE ' + QUOTENAME(@DbName) + N' SET SINGLE_USER WITH ROLLBACK IMMEDIATE';
    EXEC sp_executesql @Sql;
END
ELSE IF DB_ID(@DbName) IS NOT NULL AND @KickUsers = 0
BEGIN
    PRINT 'KickUsers is disabled. Attempting restore while users are connected (may fail if DB is busy).';
END
-- The Restore Command
-- Fixed the variable name from @LgsName to @LogsName
SET @Sql = N'RESTORE DATABASE ' + QUOTENAME(@DbName) + N' 
    FROM DISK = ''' + @BakFilePath + ''' 
    WITH REPLACE,
    MOVE ''' + @DataName + ''' TO ''' + @DataFilePath + ''',
    MOVE ''' + @LogsName + ''' TO ''' + @LogsFilePath + ''';';

PRINT 'Executing Restore for ' + @DbName + '...';
PRINT ''
PRINT '--- SQL START --------------------------------'
PRINT @Sql
PRINT '--- SQL END --------------------------------'
PRINT ''
EXEC sp_executesql @Sql;

-- Bring it back to Multi User
IF DB_ID(@DbName) IS NOT NULL
BEGIN
    SET @Sql = N'ALTER DATABASE ' + QUOTENAME(@DbName) + N' SET MULTI_USER';
    EXEC sp_executesql @Sql;
    PRINT 'Restore successful.';
END

SET NOEXEC OFF;amin] SET MULTI_USER
GO
