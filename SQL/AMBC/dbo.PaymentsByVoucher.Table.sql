USE [ambc]
GO
/****** Object:  Table [dbo].[PaymentsByVoucher]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentsByVoucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[seria] [nvarchar](50) NOT NULL,
	[nomer] [nvarchar](50) NOT NULL,
	[vsum] [money] NOT NULL,
	[docid] [int] NOT NULL,
	[vtype] [int] NULL,
 CONSTRAINT [PK_PaymentByVoucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentsByVoucher] ADD  CONSTRAINT [DF_PaymentByVoucher_seria]  DEFAULT (N'0') FOR [seria]
GO
ALTER TABLE [dbo].[PaymentsByVoucher] ADD  CONSTRAINT [DF_PaymentByVoucher_nomer]  DEFAULT (N'0') FOR [nomer]
GO
