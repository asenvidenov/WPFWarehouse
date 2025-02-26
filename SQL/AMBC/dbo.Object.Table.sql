USE [ambc]
GO
/****** Object:  Table [dbo].[Object]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[ObjectID] [int] IDENTITY(1,1) NOT NULL,
	[Object] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Parent] [int] NULL,
 CONSTRAINT [PK_Object] PRIMARY KEY NONCLUSTERED 
(
	[ObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
