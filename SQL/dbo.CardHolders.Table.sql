USE [ambc]
GO
/****** Object:  Table [dbo].[CardHolders]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardHolders](
	[HolderID] [int] IDENTITY(1,1) NOT NULL,
	[HolderNum] [nvarchar](50) NOT NULL,
	[HolderName] [nvarchar](50) NOT NULL,
	[HolderMiddle] [nvarchar](50) NULL,
	[HolderLast] [nvarchar](50) NULL,
	[HolderEgn] [nvarchar](50) NULL,
	[ContrID] [int] NULL,
	[CardID] [int] NOT NULL,
 CONSTRAINT [PK_CardHolders_1] PRIMARY KEY CLUSTERED 
(
	[HolderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CardHolders]  WITH CHECK ADD  CONSTRAINT [FK_CardHolders_Cards] FOREIGN KEY([CardID])
REFERENCES [dbo].[Cards] ([CardID])
GO
ALTER TABLE [dbo].[CardHolders] CHECK CONSTRAINT [FK_CardHolders_Cards]
GO
ALTER TABLE [dbo].[CardHolders]  WITH CHECK ADD  CONSTRAINT [FK_CardHolders_Contragents] FOREIGN KEY([ContrID])
REFERENCES [dbo].[Contragents] ([ContrID])
GO
ALTER TABLE [dbo].[CardHolders] CHECK CONSTRAINT [FK_CardHolders_Contragents]
GO
