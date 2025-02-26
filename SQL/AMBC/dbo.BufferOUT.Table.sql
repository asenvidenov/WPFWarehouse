USE [ambc]
GO
/****** Object:  Table [dbo].[BufferOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BufferOUT](
	[OUTID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NULL,
	[ParentID] [int] NULL,
	[OutDate] [datetime] NULL,
	[OutPrice] [real] NULL,
	[DocID] [int] NULL,
	[Count] [real] NULL,
	[Quantity] [real] NULL,
	[QuantityPercent] [real] NULL,
	[HiddenPercent] [tinyint] NULL,
	[ContrID] [int] NULL,
	[FoodID] [int] NULL,
 CONSTRAINT [PK_BufferOUT] PRIMARY KEY NONCLUSTERED 
(
	[OUTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
