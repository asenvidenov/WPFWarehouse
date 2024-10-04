USE [ambc]
GO
/****** Object:  View [dbo].[QueryReceiptGroup]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryReceiptGroup]
AS
SELECT     Code, Description
FROM         dbo.Goods
WHERE     ([Group] <> 0) AND (ByReceipt <> 0)

GO
