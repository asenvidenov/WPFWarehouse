USE [ambc]
GO
/****** Object:  Table [dbo].[Partitions]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partitions](
	[PartitionID] [int] IDENTITY(1,1) NOT NULL,
	[PartPrice] [float] NOT NULL,
	[PartQuantity] [float] NOT NULL,
	[PartInDate] [smalldatetime] NULL,
	[PartExpDate] [smalldatetime] NULL,
	[GoodsID] [int] NOT NULL,
	[PartOUT] [float] NULL,
	[Active] [bit] NOT NULL,
	[DocID] [int] NOT NULL,
	[ExtraInfo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partitions] PRIMARY KEY NONCLUSTERED 
(
	[PartitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partitions] ADD  CONSTRAINT [DF_Partitions_PartPrice]  DEFAULT ((0)) FOR [PartPrice]
GO
ALTER TABLE [dbo].[Partitions] ADD  CONSTRAINT [DF_Partitions_PartQuantity]  DEFAULT ((0)) FOR [PartQuantity]
GO
ALTER TABLE [dbo].[Partitions] ADD  CONSTRAINT [DF_Partitions_PartOUT]  DEFAULT ((0)) FOR [PartOUT]
GO
ALTER TABLE [dbo].[Partitions] ADD  CONSTRAINT [DF_Partitions_Active]  DEFAULT ((0)) FOR [Active]
GO
