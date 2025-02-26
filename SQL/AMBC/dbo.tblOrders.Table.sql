USE [ambc]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNum] [nvarchar](20) NULL,
	[DocID] [int] NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[ContrID] [int] NOT NULL,
	[ContrPerson] [int] NULL,
	[DeliveryDate] [smalldatetime] NOT NULL,
	[Delivery Address] [int] NOT NULL,
	[OperatorID] [int] NULL,
	[isSelected] [smallint] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_tblOrders_isSelected]  DEFAULT ((0)) FOR [isSelected]
GO
