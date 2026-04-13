

CREATE TABLE [dbo].[coldCallTbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NULL,
	[addedDateTime] [datetime2](7) NULL,
	[archivedDateTime] [datetime2](7) NULL,
 CONSTRAINT [PK_coldCallTbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[coldCallTbl] ADD  CONSTRAINT [DF_coldCallTbl_dateTimeAdded]  DEFAULT (getutcdate()) FOR [addedDateTime]
GO

CREATE TABLE [dbo].[coldCallItemTbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[coldCallId] [int] NOT NULL,
	[itemType] [varchar](50) NULL,
	[itemNote] [varchar](max) NULL,
	[addedDateTime] [datetime2](7) NOT NULL,
	[archivedDateTime] [datetime2](7) NULL,
 CONSTRAINT [PK_coldCallItemTbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[coldCallItemTbl] ADD  CONSTRAINT [DF_coldCallItemTbl_addedDateTime]  DEFAULT (getutcdate()) FOR [addedDateTime]
GO

ALTER TABLE [dbo].[coldCallItemTbl]  WITH CHECK ADD  CONSTRAINT [FK_coldCallItemTbl_coldCallTbl] FOREIGN KEY([coldCallId])
REFERENCES [dbo].[coldCallTbl] ([id])
GO

ALTER TABLE [dbo].[coldCallItemTbl] CHECK CONSTRAINT [FK_coldCallItemTbl_coldCallTbl]
GO

CREATE view [dbo].[coldCallQry]
as
SELECT cct.[id]
      ,cct.[title]
      ,cct.[addedDateTime]
	  ,(select max(ccit.addedDateTime) from coldCallItemTbl ccit where (ccit.coldCallId = cct.id)) as lastNoteTimeStamp
	  ,isNull((select top 1 itemNote from coldCallItemTbl ccit where (ccit.coldCallId = cct.id and isNull(itemType, '') = '') order by cct.addedDateTime desc), '') as lastNote
	  
  FROM [coldCallTbl] cct
  where cct.archivedDateTime is null;
GO