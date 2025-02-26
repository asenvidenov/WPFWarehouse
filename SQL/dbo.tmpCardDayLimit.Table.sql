USE [ambc]
GO
/****** Object:  Table [dbo].[tmpCardDayLimit]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpCardDayLimit](
	[LimitDayID] [int] IDENTITY(1,1) NOT NULL,
	[HolderID] [int] NOT NULL,
	[DietID] [int] NOT NULL,
	[LimitDate] [smalldatetime] NOT NULL,
	[LimitDateToUse] [smalldatetime] NOT NULL,
	[Night] [bit] NOT NULL,
 CONSTRAINT [PK_tmpCardDayLimit] PRIMARY KEY CLUSTERED 
(
	[LimitDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
