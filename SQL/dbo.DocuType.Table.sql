USE [ambc]
GO
/****** Object:  Table [dbo].[DocuType]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocuType](
	[DocuTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](40) NOT NULL,
	[WIN] [bit] NOT NULL,
	[WOUT] [bit] NOT NULL,
	[Money] [bit] NOT NULL,
	[Transport] [bit] NULL,
	[Excise] [nvarchar](5) NULL,
	[PriceFormer] [bit] NULL,
 CONSTRAINT [PK_DocuType] PRIMARY KEY NONCLUSTERED 
(
	[DocuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocuType] ADD  CONSTRAINT [DF_DocuType_WIN]  DEFAULT ((0)) FOR [WIN]
GO
ALTER TABLE [dbo].[DocuType] ADD  CONSTRAINT [DF_DocuType_WOUT]  DEFAULT ((0)) FOR [WOUT]
GO
ALTER TABLE [dbo].[DocuType] ADD  CONSTRAINT [DF_DocuType_Money]  DEFAULT ((0)) FOR [Money]
GO
ALTER TABLE [dbo].[DocuType] ADD  CONSTRAINT [DF_DocuType_PriceFormer]  DEFAULT ((0)) FOR [PriceFormer]
GO
