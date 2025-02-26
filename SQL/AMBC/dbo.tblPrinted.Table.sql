USE [ambc]
GO
/****** Object:  Table [dbo].[tblPrinted]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrinted](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [int] NOT NULL,
	[CookID] [int] NOT NULL,
	[Printed] [bit] NOT NULL,
 CONSTRAINT [PK_tblPrinted] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPrinted] ADD  CONSTRAINT [DF_tblPrinted_Printed]  DEFAULT ((0)) FOR [Printed]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPrinted', @level2type=N'COLUMN',@level2name=N'DocID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPrinted', @level2type=N'COLUMN',@level2name=N'DocID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPrinted', @level2type=N'COLUMN',@level2name=N'DocID'
GO
