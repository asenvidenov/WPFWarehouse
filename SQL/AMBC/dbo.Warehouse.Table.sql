USE [ambc]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Saldo] [real] NOT NULL,
	[QIN] [real] NOT NULL,
	[QOUT] [real] NOT NULL,
	[GoodsID] [bigint] NOT NULL,
	[ContrID] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_Saldo]  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_QIN]  DEFAULT ((0)) FOR [QIN]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_QOUT]  DEFAULT ((0)) FOR [QOUT]
GO
