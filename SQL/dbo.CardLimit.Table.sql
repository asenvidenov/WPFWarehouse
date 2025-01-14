USE [ambc]
GO
/****** Object:  Table [dbo].[CardLimit]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardLimit](
	[LimitID] [int] IDENTITY(1,1) NOT NULL,
	[HolderID] [int] NOT NULL,
	[LimitIN] [smalldatetime] NOT NULL,
	[LimitOUT] [smalldatetime] NOT NULL,
	[LimitAll] [smallmoney] NOT NULL,
	[LimitUse] [smallmoney] NOT NULL,
	[LimitUsed] [bit] NOT NULL,
	[ValidFrom] [smalldatetime] NOT NULL,
	[ValidTo] [smalldatetime] NOT NULL,
	[LimitEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_CardLimit] PRIMARY KEY NONCLUSTERED 
(
	[LimitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CardLimit] ADD  CONSTRAINT [DF_CardLimit_LimitAll]  DEFAULT ((0)) FOR [LimitAll]
GO
ALTER TABLE [dbo].[CardLimit] ADD  CONSTRAINT [DF_CardLimit_LimitUse]  DEFAULT ((0)) FOR [LimitUse]
GO
ALTER TABLE [dbo].[CardLimit] ADD  CONSTRAINT [DF_CardLimit_LimitUsed]  DEFAULT ((0)) FOR [LimitUsed]
GO
ALTER TABLE [dbo].[CardLimit] ADD  CONSTRAINT [DF_CardLimit_LimitEnabled]  DEFAULT ((1)) FOR [LimitEnabled]
GO
ALTER TABLE [dbo].[CardLimit]  WITH CHECK ADD  CONSTRAINT [FK_CardLimit_CardHolders] FOREIGN KEY([HolderID])
REFERENCES [dbo].[CardHolders] ([HolderID])
GO
ALTER TABLE [dbo].[CardLimit] CHECK CONSTRAINT [FK_CardLimit_CardHolders]
GO
