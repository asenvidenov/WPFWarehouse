USE [ambc]
GO
/****** Object:  Table [dbo].[Coefficient]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coefficient](
	[CoeffID] [int] IDENTITY(1,1) NOT NULL,
	[Price1] [real] NULL,
	[Price2] [real] NULL,
	[Price3] [real] NULL,
	[Price4] [real] NULL,
	[CoeffCalc] [real] NULL,
 CONSTRAINT [PK_Coefficient] PRIMARY KEY NONCLUSTERED 
(
	[CoeffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
