USE [ambc]
GO
/****** Object:  Table [dbo].[BookCooking]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCooking](
	[BookCookID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Measure] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_BookCooking] PRIMARY KEY CLUSTERED 
(
	[BookCookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookCooking] ADD  CONSTRAINT [DF_BookCooking_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[BookCooking] ADD  CONSTRAINT [DF_BookCooking_Price]  DEFAULT ((0)) FOR [Price]
GO
