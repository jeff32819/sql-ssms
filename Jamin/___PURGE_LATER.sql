/*

ITEMS TO PURGE LATER 

DO MODIFCATIONS NOW FOR LOCAL AND MAKING SURE THAT ALL CODE 
IS UPDATED, THEN LATER MOVE THESE ITEMS TO WEBSITE UPDATE 
WHEN BACKWARDS COMPATIBILITY IS NOT AN ISSUE.

*/

-- 1. Drop default constraint and column for [estimatorId]
IF OBJECT_ID(N'[dbo].[DF_quoteEstimateDateTbl_estimatorId]', N'D') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[quoteEstimateDateTbl]
    DROP CONSTRAINT [DF_quoteEstimateDateTbl_estimatorId];
END
GO

IF COL_LENGTH(N'[dbo].[quoteEstimateDateTbl]', N'estimatorId') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[quoteEstimateDateTbl]
    DROP COLUMN [estimatorId];
END
GO

-- 2. Drop default constraint and column for [estimateJson]
IF OBJECT_ID(N'[dbo].[DF_quoteEstimateDateTbl_estimateJson]', N'D') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[quoteEstimateDateTbl]
    DROP CONSTRAINT [DF_quoteEstimateDateTbl_estimateJson];
END
GO

IF COL_LENGTH(N'[dbo].[quoteEstimateDateTbl]', N'estimateJson') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[quoteEstimateDateTbl]
    DROP COLUMN [estimateJson];
END
GO


IF OBJECT_ID(N'[dbo].[estimateMessageQry]', N'V') IS NOT NULL
BEGIN
    DROP VIEW [dbo].[estimateMessageQry];
END;