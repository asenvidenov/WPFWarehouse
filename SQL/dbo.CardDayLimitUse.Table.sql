USE [ambc]
GO
/****** Object:  Table [dbo].[CardDayLimitUse]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDayLimitUse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HolderID] [int] NOT NULL,
	[LimitDayID] [int] NOT NULL,
	[LimitUse] [smallmoney] NOT NULL,
	[UseTime] [datetime] NOT NULL,
	[DocID] [int] NULL,
	[OperatorID] [int] NOT NULL,
	[Manual] [bit] NULL,
 CONSTRAINT [PK_CardDayLimitUse] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CardDayLimitUse]  WITH CHECK ADD  CONSTRAINT [FK_CardDayLimitUse_CardDayLimit] FOREIGN KEY([LimitDayID])
REFERENCES [dbo].[CardDayLimit] ([LimitDayID])
GO
ALTER TABLE [dbo].[CardDayLimitUse] CHECK CONSTRAINT [FK_CardDayLimitUse_CardDayLimit]
GO
ALTER TABLE [dbo].[CardDayLimitUse]  WITH CHECK ADD  CONSTRAINT [FK_CardDayLimitUse_CardHolders] FOREIGN KEY([HolderID])
REFERENCES [dbo].[CardHolders] ([HolderID])
GO
ALTER TABLE [dbo].[CardDayLimitUse] CHECK CONSTRAINT [FK_CardDayLimitUse_CardHolders]
GO
ALTER TABLE [dbo].[CardDayLimitUse]  WITH CHECK ADD  CONSTRAINT [FK_CardDayLimitUse_Documents] FOREIGN KEY([DocID])
REFERENCES [dbo].[Documents] ([DocID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CardDayLimitUse] CHECK CONSTRAINT [FK_CardDayLimitUse_Documents]
GO
