USE [ambc]
GO
/****** Object:  Table [dbo].[tblCashMove]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCashMove](
	[CashMoveID] [int] IDENTITY(1,1) NOT NULL,
	[MoveDate] [datetime] NOT NULL,
	[DocID] [int] NOT NULL,
	[OperatorID] [int] NOT NULL,
	[HolderID] [int] NULL,
	[Correction] [money] NOT NULL,
	[Cash] [money] NOT NULL,
	[VAT] [money] NOT NULL,
 CONSTRAINT [PK_tblCashMove] PRIMARY KEY CLUSTERED 
(
	[CashMoveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
