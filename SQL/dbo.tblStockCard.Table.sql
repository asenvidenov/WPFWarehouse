USE [ambc]
GO
/****** Object:  Table [dbo].[tblStockCard]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStockCard](
	[StockCardID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[StockIN] [real] NULL,
	[StockINDoc] [real] NULL,
	[INPrice] [real] NULL,
	[StockOUT] [real] NULL,
	[StockOUTDoc] [real] NULL,
	[OUTPrice] [real] NULL,
 CONSTRAINT [PK_tblStockCard] PRIMARY KEY NONCLUSTERED 
(
	[StockCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
