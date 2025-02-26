USE [ambc]
GO
/****** Object:  Table [dbo].[tblDeliveryAddress]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeliveryAddress](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContrID] [int] NOT NULL,
	[DeliveryAddress] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tblDeliveryAddress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
