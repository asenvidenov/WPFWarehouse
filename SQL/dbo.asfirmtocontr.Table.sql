USE [ambc]
GO
/****** Object:  Table [dbo].[asfirmtocontr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asfirmtocontr](
	[firms] [bigint] NOT NULL,
	[ContrID] [bigint] NOT NULL,
 CONSTRAINT [PK_asfirmtocontr] PRIMARY KEY CLUSTERED 
(
	[firms] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
