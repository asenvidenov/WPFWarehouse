USE [ambc]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[GoodsID] [int] NULL,
	[Quantity] [real] NULL,
	[Cnt] [int] NULL,
	[Price] [real] NULL,
	[measure] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_tblOrderDetails_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[tblOrderDetails] ADD  CONSTRAINT [DF_tblOrderDetails_Cnt]  DEFAULT ((1)) FOR [Cnt]
GO
