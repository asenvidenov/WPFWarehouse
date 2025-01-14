USE [ambc]
GO
/****** Object:  Table [dbo].[tmpImport]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpImport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocNum] [nvarchar](50) NULL,
	[ArtNum] [nvarchar](50) NULL,
	[ArtName] [nvarchar](50) NULL,
	[ArtPrice] [nvarchar](50) NULL,
	[ArtMeasure] [nvarchar](50) NULL,
	[VAT] [nvarchar](50) NULL,
	[ArtQuantity] [nvarchar](50) NULL,
	[ArtNal] [nvarchar](50) NULL,
	[SumVAT] [nvarchar](50) NULL,
 CONSTRAINT [PK_tmpImport] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
