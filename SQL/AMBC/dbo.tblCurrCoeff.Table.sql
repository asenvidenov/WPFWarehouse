USE [ambc]
GO
/****** Object:  Table [dbo].[tblCurrCoeff]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCurrCoeff](
	[CoeffID] [int] IDENTITY(1,1) NOT NULL,
	[CurrID] [int] NOT NULL,
	[DateFrom] [smalldatetime] NOT NULL,
	[DateTo] [smalldatetime] NOT NULL,
	[Coeff] [real] NOT NULL,
 CONSTRAINT [PK_tblCurrCoeff] PRIMARY KEY CLUSTERED 
(
	[CoeffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCurrCoeff] ADD  CONSTRAINT [DF_tblCurrCoeff_DateFrom]  DEFAULT (getdate()) FOR [DateFrom]
GO
ALTER TABLE [dbo].[tblCurrCoeff] ADD  CONSTRAINT [DF_tblCurrCoeff_DateTo]  DEFAULT (getdate()+(1)) FOR [DateTo]
GO
ALTER TABLE [dbo].[tblCurrCoeff] ADD  CONSTRAINT [DF_tblCurrCoeff_Coeff]  DEFAULT ((1.000)) FOR [Coeff]
GO
