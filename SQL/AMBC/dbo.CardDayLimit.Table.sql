USE [ambc]
GO
/****** Object:  Table [dbo].[CardDayLimit]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDayLimit](
	[LimitDayID] [int] IDENTITY(1,1) NOT NULL,
	[HolderID] [int] NOT NULL,
	[LimitDate] [smalldatetime] NOT NULL,
	[LimitDateToUse] [smalldatetime] NULL,
	[Limit] [smallmoney] NOT NULL,
	[DietID] [int] NOT NULL,
	[LimitUse] [smallmoney] NOT NULL,
	[LimitUsed] [bit] NOT NULL,
	[LimitEnabled] [bit] NOT NULL,
	[Night] [bit] NOT NULL,
 CONSTRAINT [PK_CardDayLimit] PRIMARY KEY NONCLUSTERED 
(
	[LimitDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CardDayLimit] ADD  CONSTRAINT [DF_CardDayLimit_Limit]  DEFAULT ((0)) FOR [Limit]
GO
ALTER TABLE [dbo].[CardDayLimit] ADD  CONSTRAINT [DF_CardDayLimit_LimitUse]  DEFAULT ((0)) FOR [LimitUse]
GO
ALTER TABLE [dbo].[CardDayLimit] ADD  CONSTRAINT [DF_CardDayLimit_LimitUsed]  DEFAULT ((0)) FOR [LimitUsed]
GO
ALTER TABLE [dbo].[CardDayLimit] ADD  CONSTRAINT [DF_CardDayLimit_LimitEnabled]  DEFAULT ((1)) FOR [LimitEnabled]
GO
ALTER TABLE [dbo].[CardDayLimit] ADD  CONSTRAINT [DF_CardDayLimit_Night]  DEFAULT ((0)) FOR [Night]
GO
ALTER TABLE [dbo].[CardDayLimit]  WITH CHECK ADD  CONSTRAINT [FK_CardDayLimit_CardHolders] FOREIGN KEY([HolderID])
REFERENCES [dbo].[CardHolders] ([HolderID])
GO
ALTER TABLE [dbo].[CardDayLimit] CHECK CONSTRAINT [FK_CardDayLimit_CardHolders]
GO
ALTER TABLE [dbo].[CardDayLimit]  WITH CHECK ADD  CONSTRAINT [FK_CardDayLimit_Diets] FOREIGN KEY([DietID])
REFERENCES [dbo].[Diets] ([DietID])
GO
ALTER TABLE [dbo].[CardDayLimit] CHECK CONSTRAINT [FK_CardDayLimit_Diets]
GO
