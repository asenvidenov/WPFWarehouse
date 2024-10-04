USE [ambc]
GO
/****** Object:  Table [dbo].[CardLimitEnabledLog]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardLimitEnabledLog](
	[ID] [int] NULL,
	[Num] [char](4) NULL,
	[NH] [smallmoney] NULL,
	[forMonth] [char](2) NULL,
	[forYear] [char](2) NULL
) ON [PRIMARY]
GO
