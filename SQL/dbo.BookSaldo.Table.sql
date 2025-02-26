USE [ambc]
GO
/****** Object:  Table [dbo].[BookSaldo]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookSaldo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[SaldoDebet] [float] NOT NULL,
	[SaldoCredet] [float] NOT NULL,
 CONSTRAINT [PK_BookSaldo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookSaldo] ADD  CONSTRAINT [DF_BookSaldo_SaldoDSum]  DEFAULT ((0)) FOR [SaldoDebet]
GO
ALTER TABLE [dbo].[BookSaldo] ADD  CONSTRAINT [DF_BookSaldo_SaldoCredet]  DEFAULT ((0)) FOR [SaldoCredet]
GO
