USE [ambc]
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NULL,
	[ParentID] [int] NULL,
	[OutDate] [datetime] NULL,
	[InDate] [datetime] NULL,
	[OutPrice] [real] NULL,
	[DocID] [int] NULL,
	[OUTCount] [real] NULL,
	[OUTQuantity] [real] NULL,
	[INCount] [real] NULL,
	[INQuantity] [real] NULL,
	[OUTContrID] [int] NULL,
	[INContrID] [int] NULL,
	[OUTOpID] [int] NULL,
	[INOpID] [int] NULL,
	[InFinished] [bit] NULL,
	[OutFinished] [bit] NULL,
	[Transferred] [bit] NULL,
	[ReplID] [bigint] NULL,
 CONSTRAINT [PK_Transport] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transport] ADD  CONSTRAINT [DF_Transport_InFinished]  DEFAULT ((0)) FOR [InFinished]
GO
ALTER TABLE [dbo].[Transport] ADD  CONSTRAINT [DF_Transport_OutFinished]  DEFAULT ((0)) FOR [OutFinished]
GO
ALTER TABLE [dbo].[Transport] ADD  CONSTRAINT [DF_Transport_Transferred]  DEFAULT ((0)) FOR [Transferred]
GO
