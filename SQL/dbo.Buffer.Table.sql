USE [ambc]
GO
/****** Object:  Table [dbo].[Buffer]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buffer](
	[BufferID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[InDate] [datetime] NOT NULL,
	[InPrice] [real] NOT NULL,
	[DocID] [int] NOT NULL,
	[Quantity] [real] NOT NULL,
	[HiddenPercent] [tinyint] NOT NULL,
	[ContrID] [int] NOT NULL,
	[ExpDate] [datetime] NULL,
 CONSTRAINT [PK_Buffer] PRIMARY KEY NONCLUSTERED 
(
	[BufferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Buffer] ADD  CONSTRAINT [DF_Buffer_HiddenPercent]  DEFAULT ((0)) FOR [HiddenPercent]
GO
