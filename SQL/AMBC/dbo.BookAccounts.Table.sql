USE [ambc]
GO
/****** Object:  Table [dbo].[BookAccounts]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAccounts](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[AccNum] [nvarchar](10) NULL,
	[AccDesc] [nvarchar](50) NULL,
	[ParentID] [int] NOT NULL,
 CONSTRAINT [PK_BookAccounts] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookAccounts] ADD  CONSTRAINT [DF_BookAccounts_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO
