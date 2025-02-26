USE [ambc]
GO
/****** Object:  Table [dbo].[tmpCooking]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpCooking](
	[CookingID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Quantity] [real] NOT NULL,
	[Count] [smallint] NOT NULL,
	[Price] [real] NOT NULL,
	[ContrID] [int] NOT NULL,
 CONSTRAINT [PK__tmpCooking__6541F3FA] PRIMARY KEY CLUSTERED 
(
	[CookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
