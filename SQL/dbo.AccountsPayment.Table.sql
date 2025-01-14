USE [ambc]
GO
/****** Object:  Table [dbo].[AccountsPayment]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsPayment](
	[PayID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[CurrID] [int] NOT NULL,
	[Coeff] [real] NOT NULL,
	[Amount] [real] NOT NULL,
	[Sign] [bit] NOT NULL,
 CONSTRAINT [PK_AccountPayment] PRIMARY KEY CLUSTERED 
(
	[PayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountsPayment] ADD  CONSTRAINT [DF_AccountPayment_Sign]  DEFAULT ((1)) FOR [Sign]
GO
