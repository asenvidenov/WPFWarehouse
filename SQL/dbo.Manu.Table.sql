USE [ambc]
GO
/****** Object:  Table [dbo].[Manu]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manu](
	[ManuID] [int] IDENTITY(1,1) NOT NULL,
	[DietID] [int] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[ManuDate] [smalldatetime] NOT NULL,
	[Calories] [smallint] NULL,
	[HC] [smallint] NULL,
	[FAT] [smallint] NULL,
	[Belt] [smallint] NULL,
 CONSTRAINT [PK_Manu] PRIMARY KEY NONCLUSTERED 
(
	[ManuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
