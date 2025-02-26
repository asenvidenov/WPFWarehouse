USE [ambc]
GO
/****** Object:  Table [dbo].[tblStock]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Saldo] [real] NULL,
	[SaldoDoc] [real] NULL,
	[Price] [real] NULL,
	[DocPrice] [real] NULL,
 CONSTRAINT [PK_tblStock] PRIMARY KEY NONCLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
