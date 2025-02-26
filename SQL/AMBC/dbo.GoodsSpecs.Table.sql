USE [ambc]
GO
/****** Object:  Table [dbo].[GoodsSpecs]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsSpecs](
	[SpecID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Spec1] [nvarchar](50) NULL,
	[Spec2] [nvarchar](50) NULL,
	[Spec3] [nvarchar](50) NULL,
	[Spec4] [nvarchar](50) NULL,
	[Spec5] [nvarchar](50) NULL,
	[Spec6] [nvarchar](50) NULL,
	[Spec7] [nvarchar](50) NULL,
	[Spec8] [nvarchar](50) NULL,
 CONSTRAINT [PK_GoodsSpecs] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
