USE [ambc]
GO
/****** Object:  Table [dbo].[taxDeclarationItems]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxDeclarationItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeclarationType] [int] NOT NULL,
	[Item] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Required] [smallint] NOT NULL,
	[isGroup] [bit] NOT NULL,
	[FormatMin] [smallint] NOT NULL,
	[FormatMax] [smallint] NOT NULL,
	[AfterFormat] [smallint] NOT NULL,
	[Parent] [int] NOT NULL,
 CONSTRAINT [PK_taxDeclarationItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[taxDeclarationItems] ADD  CONSTRAINT [DF_taxDeclarationItems_DeclarationType]  DEFAULT ((1)) FOR [DeclarationType]
GO
ALTER TABLE [dbo].[taxDeclarationItems] ADD  CONSTRAINT [DF_taxDeclarationItems_isGroup]  DEFAULT ((0)) FOR [isGroup]
GO
ALTER TABLE [dbo].[taxDeclarationItems] ADD  CONSTRAINT [DF_taxDeclarationItems_FormatMin]  DEFAULT ((0)) FOR [FormatMin]
GO
ALTER TABLE [dbo].[taxDeclarationItems] ADD  CONSTRAINT [DF_taxDeclarationItems_Format]  DEFAULT ((1)) FOR [FormatMax]
GO
ALTER TABLE [dbo].[taxDeclarationItems] ADD  CONSTRAINT [DF_taxDeclarationItems_AfterFormat]  DEFAULT ((0)) FOR [AfterFormat]
GO
ALTER TABLE [dbo].[taxDeclarationItems] ADD  CONSTRAINT [DF_taxDeclarationItems_Parent]  DEFAULT ((0)) FOR [Parent]
GO
