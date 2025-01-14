USE [ambc]
GO
/****** Object:  Table [dbo].[VAT_pokupki]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAT_pokupki](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[INDS] [nvarchar](15) NOT NULL,
	[TaxPeriod] [nchar](6) NOT NULL,
	[SubObject] [tinyint] NOT NULL,
	[RecNum] [int] NOT NULL,
	[DocType] [nchar](10) NOT NULL,
	[DocNum] [nvarchar](20) NOT NULL,
	[DocDate] [nchar](10) NOT NULL,
	[ContrINDS] [nvarchar](15) NULL,
	[ContrName] [nvarchar](50) NULL,
	[Stock] [nvarchar](30) NULL,
	[DOnoVAT] [float] NOT NULL,
	[DOFULLVAT] [float] NOT NULL,
	[VATfull] [float] NOT NULL,
	[DOPART] [float] NOT NULL,
	[VATPART] [float] NOT NULL,
	[YEARCORR] [float] NOT NULL,
	[DOMiddleMan] [float] NOT NULL,
 CONSTRAINT [PK_VAT_pokupki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_SubObject]  DEFAULT ((0)) FOR [SubObject]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_DOSum]  DEFAULT ((0)) FOR [DOnoVAT]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_DOFULLVAT]  DEFAULT ((0)) FOR [DOFULLVAT]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_VAT20]  DEFAULT ((0)) FOR [VATfull]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_DOVOP]  DEFAULT ((0)) FOR [DOPART]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_DO82]  DEFAULT ((0)) FOR [VATPART]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_VATVOP82]  DEFAULT ((0)) FOR [YEARCORR]
GO
ALTER TABLE [dbo].[VAT_pokupki] ADD  CONSTRAINT [DF_VAT_pokupki_DOMiddleMan]  DEFAULT ((0)) FOR [DOMiddleMan]
GO
