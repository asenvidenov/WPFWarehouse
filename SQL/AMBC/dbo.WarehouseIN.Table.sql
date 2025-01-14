USE [ambc]
GO
/****** Object:  Table [dbo].[WarehouseIN]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseIN](
	[INID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[InDate] [datetime] NOT NULL,
	[InPrice] [float] NOT NULL,
	[DocID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[HiddenPercent] [tinyint] NULL,
	[QuantityDoc] [float] NOT NULL,
	[ContrID] [int] NOT NULL,
	[ExpDate] [datetime] NULL,
	[PartOUT] [float] NULL,
	[Active] [bit] NULL,
	[ExpPeriod] [smallint] NULL,
	[Preservation] [nvarchar](50) NULL,
 CONSTRAINT [PK_WarehouseIN] PRIMARY KEY NONCLUSTERED 
(
	[INID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WarehouseIN] ADD  CONSTRAINT [DF_WarehouseIN_QuantityDoc]  DEFAULT ((0)) FOR [QuantityDoc]
GO
