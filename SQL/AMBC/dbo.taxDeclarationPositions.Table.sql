USE [ambc]
GO
/****** Object:  Table [dbo].[taxDeclarationPositions]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxDeclarationPositions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaxDeclarationID] [int] NOT NULL,
	[TaxItem] [int] NOT NULL,
	[Spec] [nvarchar](3000) NULL,
	[GoodsID] [int] NOT NULL,
 CONSTRAINT [PK_taxDeclarationPositions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[taxDeclarationPositions] ADD  CONSTRAINT [DF_taxDeclarationPositions_GoodsID]  DEFAULT ((0)) FOR [GoodsID]
GO
