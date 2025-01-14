USE [ambc]
GO
/****** Object:  Table [dbo].[Period]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Period](
	[PeriodID] [int] IDENTITY(1,1) NOT NULL,
	[InDate] [datetime] NOT NULL,
	[OutDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[ContrID] [int] NULL,
	[Dateto] [datetime] NULL,
	[DateFrom] [datetime] NULL,
 CONSTRAINT [PK_Period] PRIMARY KEY NONCLUSTERED 
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Period] ADD  CONSTRAINT [DF_Period_Active]  DEFAULT ((0)) FOR [Active]
GO
