USE [ambc]
GO
/****** Object:  Table [dbo].[Diets]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diets](
	[DietID] [int] IDENTITY(1,1) NOT NULL,
	[DietNum] [int] NOT NULL,
	[DietDescription] [nvarchar](50) NOT NULL,
	[DietValue] [real] NULL,
 CONSTRAINT [PK_Diets] PRIMARY KEY NONCLUSTERED 
(
	[DietID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Diets] ADD  CONSTRAINT [DF_Diets_DietValue]  DEFAULT ((0)) FOR [DietValue]
GO
