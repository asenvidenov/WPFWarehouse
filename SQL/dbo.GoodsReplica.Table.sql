USE [ambc]
GO
/****** Object:  Table [dbo].[GoodsReplica]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsReplica](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GoodsID] [bigint] NOT NULL,
	[Version] [bigint] NOT NULL,
 CONSTRAINT [PK_GoodsReplica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GoodsReplica] ADD  CONSTRAINT [DF_GoodsReplica_Version]  DEFAULT ((0)) FOR [Version]
GO
