/*

After next update #063 move to DbUp

*/

USE Jamin
GO

/** quote reminder **/

-- Views
IF OBJECT_ID('[dbo].[quoteMoveReminderDailyQry]', 'V') IS NOT NULL DROP VIEW [dbo].[quoteMoveReminderDailyQry];
IF OBJECT_ID('[dbo].[quoteReminderQueueInsertQry]', 'V') IS NOT NULL DROP VIEW [dbo].[quoteReminderQueueInsertQry];

-- Tables
IF OBJECT_ID('[dbo].[quoteMoveReminderLogTbl]', 'U') IS NOT NULL DROP TABLE [dbo].[quoteMoveReminderLogTbl];
IF OBJECT_ID('[dbo].[quoteReminderQueueTbl]', 'U') IS NOT NULL DROP TABLE [dbo].[quoteReminderQueueTbl];

/** email history reminder -- changed to emailSendTbl **/
IF OBJECT_ID('[dbo].[emailHistorySendToTbl]', 'U') IS NOT NULL DROP TABLE [dbo].[emailHistorySendToTbl];
IF OBJECT_ID('[dbo].[emailHistoryTbl]', 'U') IS NOT NULL DROP TABLE [dbo].[emailHistoryTbl];
IF OBJECT_ID('[dbo].[emailHistoryQry]', 'V') IS NOT NULL DROP VIEW [dbo].[emailHistoryQry];

-- EmailHistorySendToTbl was last used on 2025-02-22 with only a few rows.


/********************* BLANK SCRIPTS **********************************************************

IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[]'))
BEGIN
    DROP VIEW [dbo].[];
END
GO
---------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.tables WHERE name = '' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
    DROP TABLE [dbo].[];
END
GO

*/