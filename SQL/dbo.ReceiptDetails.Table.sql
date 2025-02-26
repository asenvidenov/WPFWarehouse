USE [ambc]
GO
/****** Object:  Table [dbo].[ReceiptDetails]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetails](
	[ReceiptDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptID] [int] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Quantity] [real] NULL,
	[InPrice] [real] NULL,
	[Count] [smallint] NULL,
	[Coeff] [real] NULL,
	[Price] [real] NULL,
	[SubObject] [smallint] NULL,
 CONSTRAINT [PK_ReceiptDetails] PRIMARY KEY NONCLUSTERED 
(
	[ReceiptDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReceiptDetails] ADD  CONSTRAINT [DF_ReceiptDetails_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[ReceiptDetails] ADD  CONSTRAINT [DF_ReceiptDetails_InPrice]  DEFAULT ((0)) FOR [InPrice]
GO
ALTER TABLE [dbo].[ReceiptDetails] ADD  CONSTRAINT [DF_ReceiptDetails_Count]  DEFAULT ((0)) FOR [Count]
GO
ALTER TABLE [dbo].[ReceiptDetails] ADD  CONSTRAINT [DF_ReceiptDetails_Coeff]  DEFAULT ((0)) FOR [Coeff]
GO
ALTER TABLE [dbo].[ReceiptDetails] ADD  CONSTRAINT [DF_ReceiptDetails_Price]  DEFAULT ((0)) FOR [Price]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReceiptDetails', @level2type=N'COLUMN',@level2name=N'SubObject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReceiptDetails', @level2type=N'COLUMN',@level2name=N'SubObject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReceiptDetails', @level2type=N'COLUMN',@level2name=N'SubObject'
GO
