USE [ambc]
GO
/****** Object:  Table [dbo].[GoodsCoeff]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsCoeff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Temperature] [real] NOT NULL,
	[Coeff] [real] NOT NULL,
 CONSTRAINT [PK_GoodsCoeff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GoodsCoeff] ADD  CONSTRAINT [DF_GoodsCoeff_Temperature]  DEFAULT ((15)) FOR [Temperature]
GO
ALTER TABLE [dbo].[GoodsCoeff] ADD  CONSTRAINT [DF_GoodsCoeff_Coeff]  DEFAULT ((1)) FOR [Coeff]
GO
