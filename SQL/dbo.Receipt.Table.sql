USE [ambc]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptNum] [nvarchar](10) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Calories] [smallint] NULL,
	[Weight] [real] NULL,
	[Price] [real] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY NONCLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Calories]  DEFAULT ((0)) FOR [Calories]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Weight]  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Price]  DEFAULT ((0)) FOR [Price]
GO
