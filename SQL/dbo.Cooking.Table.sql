USE [ambc]
GO
/****** Object:  Table [dbo].[Cooking]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cooking](
	[CookingID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[CookDate] [smalldatetime] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[DietID] [int] NULL,
	[FoodID] [int] NULL,
	[QCount] [float] NULL,
	[QQuant] [float] NULL,
	[Quantity] [float] NOT NULL,
	[Count] [int] NOT NULL,
	[InPrice] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[HiddenPercent] [tinyint] NOT NULL,
	[RealQuantity] [float] NOT NULL,
	[Coeff] [float] NOT NULL,
	[isTax] [bit] NOT NULL,
	[TaxSum] [float] NOT NULL,
	[ExpDate] [smalldatetime] NULL,
	[Preservation] [nvarchar](10) NULL,
 CONSTRAINT [PK_Cooking] PRIMARY KEY NONCLUSTERED 
(
	[CookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_CookDate]  DEFAULT (getdate()) FOR [CookDate]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_DietID]  DEFAULT ((89)) FOR [DietID]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_FoodID]  DEFAULT ((1)) FOR [FoodID]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_Count]  DEFAULT ((1)) FOR [Count]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_InPrice]  DEFAULT ((0)) FOR [InPrice]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Cooking] ADD  CONSTRAINT [DF_Cooking_HiddenPercent]  DEFAULT ((0)) FOR [HiddenPercent]
GO
ALTER TABLE [dbo].[Cooking]  WITH CHECK ADD  CONSTRAINT [FK_Cooking_Diets] FOREIGN KEY([DietID])
REFERENCES [dbo].[Diets] ([DietID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cooking] CHECK CONSTRAINT [FK_Cooking_Diets]
GO
ALTER TABLE [dbo].[Cooking]  WITH CHECK ADD  CONSTRAINT [FK_Cooking_Documents] FOREIGN KEY([DocID])
REFERENCES [dbo].[Documents] ([DocID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cooking] CHECK CONSTRAINT [FK_Cooking_Documents]
GO
ALTER TABLE [dbo].[Cooking]  WITH CHECK ADD  CONSTRAINT [FK_Cooking_Food] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cooking] CHECK CONSTRAINT [FK_Cooking_Food]
GO
