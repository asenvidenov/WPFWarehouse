USE [ambc]
GO
/****** Object:  Table [dbo].[ContragentsExported]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContragentsExported](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ContrID] [bigint] NOT NULL,
	[ParentID] [bigint] NOT NULL,
	[DateAdded] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContragentsExported] ADD  CONSTRAINT [DF_ContragentsExported_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
