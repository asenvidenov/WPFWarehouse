USE [ambc]
GO
/****** Object:  Table [dbo].[taxGoodsOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxGoodsOUT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](4) NOT NULL,
	[DocQuantity] [real] NOT NULL,
	[DocNo] [nvarchar](30) NOT NULL,
	[DocDate] [nvarchar](8) NOT NULL,
	[AADReturnDate] [nvarchar](8) NULL,
	[Purpose] [nchar](2) NOT NULL,
	[GoodsID] [int] NOT NULL,
 CONSTRAINT [PK_taxGoodsOUT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
