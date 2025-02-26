USE [ambc]
GO
/****** Object:  Table [dbo].[WarehouseOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseOUT](
	[OUTID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[OutDate] [datetime] NOT NULL,
	[OutPrice] [real] NOT NULL,
	[DocID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[QuantityPercent] [float] NOT NULL,
	[HiddenPercent] [tinyint] NULL,
	[ContrID] [int] NULL,
 CONSTRAINT [PK_WarehouseOUT] PRIMARY KEY NONCLUSTERED 
(
	[OUTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WarehouseOUT]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseOUT_Contragents] FOREIGN KEY([ContrID])
REFERENCES [dbo].[Contragents] ([ContrID])
GO
ALTER TABLE [dbo].[WarehouseOUT] CHECK CONSTRAINT [FK_WarehouseOUT_Contragents]
GO
ALTER TABLE [dbo].[WarehouseOUT]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseOUT_Documents] FOREIGN KEY([DocID])
REFERENCES [dbo].[Documents] ([DocID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarehouseOUT] CHECK CONSTRAINT [FK_WarehouseOUT_Documents]
GO
