USE [ambc]
GO
/****** Object:  Table [dbo].[Contragents]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contragents](
	[ContrID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NULL,
	[ContrName] [nvarchar](50) NULL,
	[ContrAddress] [nvarchar](50) NULL,
	[ContrDN] [nvarchar](15) NULL,
	[ContrBulstat] [nvarchar](15) NULL,
	[ContrMOL] [nvarchar](50) NULL,
	[INDS] [nchar](13) NULL,
	[ContrPhone] [nvarchar](15) NULL,
	[Parent] [int] NULL,
	[Percent] [real] NULL,
	[ForBooking] [bit] NULL,
	[toPM] [bit] NULL,
	[isUpd] [bit] NULL,
	[isFactoring] [bit] NULL,
 CONSTRAINT [PK_Contragents] PRIMARY KEY CLUSTERED 
(
	[ContrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contragents] ADD  CONSTRAINT [DF_Contragents_ForBooking]  DEFAULT ((0)) FOR [ForBooking]
GO
ALTER TABLE [dbo].[Contragents] ADD  CONSTRAINT [DF_Contragents_isFactoring]  DEFAULT ((0)) FOR [isFactoring]
GO
