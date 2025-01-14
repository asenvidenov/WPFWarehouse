USE [ambc]
GO
/****** Object:  Table [dbo].[tblDaySales]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDaySales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Cooked] [float] NULL,
	[Sold] [float] NULL,
	[Correection] [float] NULL,
 CONSTRAINT [PK_tblDaySales] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDaySales] ADD  CONSTRAINT [DF_tblDaySales_Cooked]  DEFAULT ((0)) FOR [Cooked]
GO
ALTER TABLE [dbo].[tblDaySales] ADD  CONSTRAINT [DF_tblDaySales_Sold]  DEFAULT ((0)) FOR [Sold]
GO
ALTER TABLE [dbo].[tblDaySales] ADD  CONSTRAINT [DF_tblDaySales_Correection]  DEFAULT ((0)) FOR [Correection]
GO
