USE [ambc]
GO
/****** Object:  Table [dbo].[Taxes]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxes](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [nvarchar](50) NOT NULL,
	[QorP] [bit] NOT NULL,
	[Coeff] [real] NOT NULL,
	[About] [real] NOT NULL,
 CONSTRAINT [PK_Taxes] PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Taxes] ADD  CONSTRAINT [DF_Taxes_QorP]  DEFAULT ((0)) FOR [QorP]
GO
ALTER TABLE [dbo].[Taxes] ADD  CONSTRAINT [DF_Table_1_Amount]  DEFAULT ((0)) FOR [Coeff]
GO
ALTER TABLE [dbo].[Taxes] ADD  CONSTRAINT [DF_Taxes_ForQ]  DEFAULT ((0)) FOR [About]
GO
