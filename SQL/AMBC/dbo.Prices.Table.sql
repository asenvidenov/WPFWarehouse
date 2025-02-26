USE [ambc]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](20) NULL,
	[Percent] [real] NULL,
 CONSTRAINT [PK_Prices] PRIMARY KEY NONCLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Prices] ADD  CONSTRAINT [DF_Prices_Percent]  DEFAULT ((0)) FOR [Percent]
GO
