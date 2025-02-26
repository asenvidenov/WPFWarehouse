USE [ambc]
GO
/****** Object:  Table [dbo].[tblDensity]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDensity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[temp] [real] NOT NULL,
	[dt] [real] NOT NULL,
	[d15] [real] NOT NULL,
 CONSTRAINT [PK_tblDensity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
