USE [ambc]
GO
/****** Object:  Table [dbo].[VAT_prodagbi]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAT_prodagbi](
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
	[DOSum] [float] NOT NULL,
	[VATSum] [float] NOT NULL,
	[DO20] [float] NOT NULL,
	[VAT20] [float] NOT NULL,
	[DOVOP] [float] NOT NULL,
	[DO82] [float] NOT NULL,
	[VATVOP82] [float] NOT NULL,
	[VAT20Other] [float] NOT NULL,
	[DO7] [float] NOT NULL,
	[VAT7] [float] NOT NULL,
	[DO0] [float] NOT NULL,
	[DO0VOD] [float] NOT NULL,
	[DO0140] [float] NOT NULL,
	[DO21] [float] NOT NULL,
	[DO69] [float] NOT NULL,
	[DOfreeVOP] [float] NOT NULL,
	[DOMiddleMan] [float] NOT NULL,
 CONSTRAINT [PK_VAT_prodagbi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_SubObject]  DEFAULT ((0)) FOR [SubObject]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DOSum]  DEFAULT ((0)) FOR [DOSum]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_VATSum]  DEFAULT ((0)) FOR [VATSum]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO20]  DEFAULT ((0)) FOR [DO20]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_VAT20]  DEFAULT ((0)) FOR [VAT20]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DOVOP]  DEFAULT ((0)) FOR [DOVOP]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO82]  DEFAULT ((0)) FOR [DO82]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_VATVOP82]  DEFAULT ((0)) FOR [VATVOP82]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_VAT20Other]  DEFAULT ((0)) FOR [VAT20Other]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO7]  DEFAULT ((0)) FOR [DO7]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_VAT7]  DEFAULT ((0)) FOR [VAT7]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO0]  DEFAULT ((0)) FOR [DO0]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO0VOD]  DEFAULT ((0)) FOR [DO0VOD]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO0140]  DEFAULT ((0)) FOR [DO0140]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO21]  DEFAULT ((0)) FOR [DO21]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DO69]  DEFAULT ((0)) FOR [DO69]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DOfreeVOP]  DEFAULT ((0)) FOR [DOfreeVOP]
GO
ALTER TABLE [dbo].[VAT_prodagbi] ADD  CONSTRAINT [DF_VAT_prodagbi_DOMiddleMan]  DEFAULT ((0)) FOR [DOMiddleMan]
GO
