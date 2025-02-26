USE [ambc]
GO
/****** Object:  View [dbo].[QueryReceipt]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryReceipt]
AS
SELECT     dbo.Receipt.ReceiptID, dbo.Goods.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.Receipt.ReceiptNum, dbo.Receipt.Weight, 
                      dbo.Receipt.Price AS [Receipt.Price], dbo.Goods.Price AS [Goods.Price], dbo.Goods.ByReceipt, dbo.Goods.Parent
FROM         dbo.Goods INNER JOIN
                      dbo.Receipt ON dbo.Goods.GoodsID = dbo.Receipt.GoodsID

GO
