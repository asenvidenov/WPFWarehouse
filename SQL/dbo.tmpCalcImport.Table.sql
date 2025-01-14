USE [ambc]
GO
/****** Object:  Table [dbo].[tmpCalcImport]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpCalcImport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Num] [nvarchar](50) NULL,
	[ArtNum] [nvarchar](50) NULL,
	[NomenNum] [nvarchar](50) NULL,
	[ArtName] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[PokPrice] [nvarchar](50) NULL,
	[measure] [nvarchar](50) NULL,
 CONSTRAINT [PK_tmpCalcImport] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
