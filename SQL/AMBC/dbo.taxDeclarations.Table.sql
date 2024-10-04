USE [ambc]
GO
/****** Object:  Table [dbo].[taxDeclarations]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxDeclarations](
	[TaxDeclarationID] [int] IDENTITY(1,1) NOT NULL,
	[StartPeriod] [smalldatetime] NOT NULL,
	[EndPeriod] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_taxDeclarations] PRIMARY KEY CLUSTERED 
(
	[TaxDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
