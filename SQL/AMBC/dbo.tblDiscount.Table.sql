USE [ambc]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Coefficient] [real] NULL,
	[Description] [nvarchar](50) NULL,
	[ContrID] [int] NULL,
 CONSTRAINT [PK_tblDiscount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDiscount]  WITH CHECK ADD  CONSTRAINT [FK_tblDiscount_Contragents] FOREIGN KEY([ContrID])
REFERENCES [dbo].[Contragents] ([ContrID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDiscount] CHECK CONSTRAINT [FK_tblDiscount_Contragents]
GO
