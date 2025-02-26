USE [ambc]
GO
/****** Object:  Table [dbo].[asgoodsmatch]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asgoodsmatch](
	[ID] [bigint] NOT NULL,
	[ExtID] [int] NOT NULL,
	[InnerID] [int] NOT NULL,
	[ExtObj] [int] NULL,
	[InnerObj] [int] NULL,
 CONSTRAINT [PK_asgoodsmatch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
