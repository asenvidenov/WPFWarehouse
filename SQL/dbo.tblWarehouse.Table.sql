USE [ambc]
GO
/****** Object:  Table [dbo].[tblWarehouse]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWarehouse](
	[tmpID] [bigint] IDENTITY(1,1) NOT NULL,
	[GoodsID] [bigint] NOT NULL,
	[Saldo] [real] NOT NULL,
	[SaldoPrice] [real] NOT NULL,
	[QINBefore] [real] NOT NULL,
	[PINBefore] [real] NOT NULL,
	[QINAfter] [real] NOT NULL,
	[PINAfter] [real] NOT NULL,
	[QOUTBefore] [real] NOT NULL,
	[POUTBefore] [real] NOT NULL,
	[QOUTAfter] [real] NOT NULL,
	[POutAfter] [real] NOT NULL,
	[ContrID] [int] NULL,
 CONSTRAINT [PK_tblWarehouse] PRIMARY KEY CLUSTERED 
(
	[tmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_Saldo]  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_SaldoPrice]  DEFAULT ((0)) FOR [SaldoPrice]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_QINBefore]  DEFAULT ((0)) FOR [QINBefore]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_PINBefore]  DEFAULT ((0)) FOR [PINBefore]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_QuantityIN]  DEFAULT ((0)) FOR [QINAfter]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_PriceIN]  DEFAULT ((0)) FOR [PINAfter]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_QOUTAfter]  DEFAULT ((0)) FOR [QOUTBefore]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_POUTBefore]  DEFAULT ((0)) FOR [POUTBefore]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_QuantityOUT]  DEFAULT ((0)) FOR [QOUTAfter]
GO
ALTER TABLE [dbo].[tblWarehouse] ADD  CONSTRAINT [DF_tblWarehouse_PriceOut]  DEFAULT ((0)) FOR [POutAfter]
GO
