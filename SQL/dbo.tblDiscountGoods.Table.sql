USE [ambc]
GO
/****** Object:  Table [dbo].[tblDiscountGoods]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscountGoods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Discount] [int] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ContrID] [int] NOT NULL,
 CONSTRAINT [PK_tblDiscountGoods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDiscountGoods] ADD  CONSTRAINT [DF_tblDiscountGoods_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[tblDiscountGoods] ADD  CONSTRAINT [DF_tblDiscountGoods_ContrID]  DEFAULT ((0)) FOR [ContrID]
GO
ALTER TABLE [dbo].[tblDiscountGoods]  WITH CHECK ADD  CONSTRAINT [FK_tblDiscountGoods_tblDiscount] FOREIGN KEY([Discount])
REFERENCES [dbo].[tblDiscount] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDiscountGoods] CHECK CONSTRAINT [FK_tblDiscountGoods_tblDiscount]
GO
