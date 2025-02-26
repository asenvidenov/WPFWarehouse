USE [ambc]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](20) NULL,
	[DocuType] [int] NOT NULL,
	[TypeNumber] [nvarchar](20) NULL,
	[DocDate] [datetime] NOT NULL,
	[ContrID] [int] NOT NULL,
	[Contragent] [int] NULL,
	[ExtraInfo] [nvarchar](50) NULL,
	[Sum] [float] NULL,
	[VAT] [float] NULL,
	[SumVAT] [float] NULL,
	[CheckVAT] [tinyint] NULL,
	[Percent] [float] NULL,
	[Excise] [float] NULL,
	[ReplID] [bigint] NULL,
	[ParentID] [int] NULL,
	[Credet] [tinyint] NULL,
	[Factoring] [smalldatetime] NULL,
	[isFactoring] [bit] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY NONCLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_Sum]  DEFAULT ((0)) FOR [Sum]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_VAT]  DEFAULT ((0)) FOR [VAT]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_SumVAT]  DEFAULT ((0)) FOR [SumVAT]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_CheckVAT]  DEFAULT ((1)) FOR [CheckVAT]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_Percent]  DEFAULT ((0.2)) FOR [Percent]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_isFactoring]  DEFAULT ((0)) FOR [isFactoring]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Contragents] FOREIGN KEY([ContrID])
REFERENCES [dbo].[Contragents] ([ContrID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Contragents]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_DocuType] FOREIGN KEY([DocuType])
REFERENCES [dbo].[DocuType] ([DocuTypeID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_DocuType]
GO
