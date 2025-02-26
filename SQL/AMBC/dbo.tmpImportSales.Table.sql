USE [ambc]
GO
/****** Object:  Table [dbo].[tmpImportSales]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpImportSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArtNo] [nvarchar](50) NULL,
	[Article] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[measure] [nvarchar](50) NULL,
 CONSTRAINT [PK_tmpImportSales] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
