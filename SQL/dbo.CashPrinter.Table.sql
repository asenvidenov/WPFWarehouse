USE [ambc]
GO
/****** Object:  Table [dbo].[CashPrinter]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPrinter](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[PrintPath] [nvarchar](50) NULL,
	[PrintSuffix] [nvarchar](50) NULL,
	[PrintPort] [nvarchar](50) NULL,
 CONSTRAINT [PK_CashPrinter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
