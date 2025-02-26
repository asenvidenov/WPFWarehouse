USE [ambc]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[GoodsID] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[BookCredet] [int] NULL,
	[BookDebet] [int] NULL,
	[BookSum] [float] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Booking_BookSum]  DEFAULT ((0)) FOR [BookSum]
GO
