USE [ambc]
GO
/****** Object:  Table [dbo].[Saldo]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saldo](
	[SaldoID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsID] [int] NOT NULL,
	[ContrID] [int] NOT NULL,
	[Saldo] [float] NULL,
	[SaldoPrice] [float] NULL,
	[SaldoDoc] [float] NULL,
	[SaldoDocPrice] [float] NULL,
 CONSTRAINT [PK_Saldo] PRIMARY KEY NONCLUSTERED 
(
	[SaldoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Saldo] ADD  CONSTRAINT [DF_Saldo_Saldo]  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[Saldo] ADD  CONSTRAINT [DF_Saldo_SaldoPrice]  DEFAULT ((0)) FOR [SaldoPrice]
GO
ALTER TABLE [dbo].[Saldo] ADD  CONSTRAINT [DF_Saldo_SaldoDoc]  DEFAULT ((0)) FOR [SaldoDoc]
GO
ALTER TABLE [dbo].[Saldo] ADD  CONSTRAINT [DF_Saldo_SaldoDocPrice]  DEFAULT ((0)) FOR [SaldoDocPrice]
GO
