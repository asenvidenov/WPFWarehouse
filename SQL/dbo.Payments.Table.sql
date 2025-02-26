USE [ambc]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[ContrID] [int] NOT NULL,
	[PaySum] [money] NOT NULL,
	[PayType] [nvarchar](25) NULL,
	[PayDate] [smalldatetime] NOT NULL,
	[PaySign] [bit] NOT NULL,
	[PayFinished] [bit] NOT NULL,
	[BookContrID] [int] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF_Payments_PaySum]  DEFAULT ((0)) FOR [PaySum]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF_Payments_PayDate]  DEFAULT (getdate()) FOR [PayDate]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF_Payments_PaySign]  DEFAULT ((0)) FOR [PaySign]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF_Payments_PayFinished]  DEFAULT ((0)) FOR [PayFinished]
GO
