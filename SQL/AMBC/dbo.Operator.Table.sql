USE [ambc]
GO
/****** Object:  Table [dbo].[Operator]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operator](
	[OperatorID] [int] IDENTITY(1,1) NOT NULL,
	[OpLogin] [nvarchar](20) NOT NULL,
	[OpPass] [nvarchar](10) NOT NULL,
	[OpName] [nvarchar](20) NULL,
	[OpLevel] [int] NULL,
	[OpHash] [binary](64) NULL,
	[UID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Operator] PRIMARY KEY NONCLUSTERED 
(
	[OperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
