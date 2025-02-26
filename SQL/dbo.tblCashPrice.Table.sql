USE [ambc]
GO
/****** Object:  Table [dbo].[tblCashPrice]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCashPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[ContrID] [int] NULL,
	[CashPrice] [real] NOT NULL,
	[Discount] [bit] NOT NULL,
	[CashEnabled] [bit] NOT NULL,
	[CashDynamic] [bit] NOT NULL,
	[CashPrint] [smallint] NULL,
	[Coeff] [real] NOT NULL,
	[CashCode] [nvarchar](25) NULL,
	[CashName] [nvarchar](25) NULL,
 CONSTRAINT [PK_tblCashPrice] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCashPrice] ADD  CONSTRAINT [DF_tblCashPrice_CashPrice]  DEFAULT ((0)) FOR [CashPrice]
GO
ALTER TABLE [dbo].[tblCashPrice] ADD  CONSTRAINT [DF_tblCashPrice_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[tblCashPrice] ADD  CONSTRAINT [DF_tblCashPrice_CashEnabled]  DEFAULT ((0)) FOR [CashEnabled]
GO
ALTER TABLE [dbo].[tblCashPrice] ADD  CONSTRAINT [DF_tblCashPrice_CashDynamic]  DEFAULT ((0)) FOR [CashDynamic]
GO
ALTER TABLE [dbo].[tblCashPrice] ADD  CONSTRAINT [DF_tblCashPrice_Coeff]  DEFAULT ((1)) FOR [Coeff]
GO
ALTER TABLE [dbo].[tblCashPrice]  WITH CHECK ADD  CONSTRAINT [FK_tblCashPrice_Contragents] FOREIGN KEY([ContrID])
REFERENCES [dbo].[Contragents] ([ContrID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCashPrice] CHECK CONSTRAINT [FK_tblCashPrice_Contragents]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'GoodsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'GoodsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'GoodsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'ContrID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'ContrID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'ContrID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashDynamic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashDynamic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashDynamic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashPrint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashPrint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashPrint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'Coeff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'Coeff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'Coeff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice', @level2type=N'COLUMN',@level2name=N'CashName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'tblCashPrice.CashCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCashPrice'
GO
