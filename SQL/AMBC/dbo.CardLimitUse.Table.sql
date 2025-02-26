USE [ambc]
GO
/****** Object:  Table [dbo].[CardLimitUse]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardLimitUse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HolderID] [int] NOT NULL,
	[LimitID] [int] NOT NULL,
	[UseTime] [datetime] NOT NULL,
	[LimitUse] [real] NOT NULL,
	[DocID] [int] NOT NULL,
	[OperatorID] [int] NULL,
 CONSTRAINT [PK_CardLimitUse] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CardLimitUse] ADD  CONSTRAINT [DF_CardLimitUse_LimitUse]  DEFAULT ((0)) FOR [LimitUse]
GO
ALTER TABLE [dbo].[CardLimitUse]  WITH CHECK ADD  CONSTRAINT [FK_CardLimitUse_CardHolders] FOREIGN KEY([HolderID])
REFERENCES [dbo].[CardHolders] ([HolderID])
GO
ALTER TABLE [dbo].[CardLimitUse] CHECK CONSTRAINT [FK_CardLimitUse_CardHolders]
GO
ALTER TABLE [dbo].[CardLimitUse]  WITH CHECK ADD  CONSTRAINT [FK_CardLimitUse_CardLimit] FOREIGN KEY([LimitID])
REFERENCES [dbo].[CardLimit] ([LimitID])
GO
ALTER TABLE [dbo].[CardLimitUse] CHECK CONSTRAINT [FK_CardLimitUse_CardLimit]
GO
ALTER TABLE [dbo].[CardLimitUse]  WITH CHECK ADD  CONSTRAINT [FK_CardLimitUse_Operator] FOREIGN KEY([OperatorID])
REFERENCES [dbo].[Operator] ([OperatorID])
GO
ALTER TABLE [dbo].[CardLimitUse] CHECK CONSTRAINT [FK_CardLimitUse_Operator]
GO
