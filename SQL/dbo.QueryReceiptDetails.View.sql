USE [ambc]
GO
/****** Object:  View [dbo].[QueryReceiptDetails]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryReceiptDetails]
AS
SELECT     dbo.ReceiptDetails.ReceiptDetailID, dbo.ReceiptDetails.ReceiptID, dbo.ReceiptDetails.GoodsID, dbo.Goods.Description, dbo.ReceiptDetails.Quantity, 
                      dbo.ReceiptDetails.InPrice, dbo.ReceiptDetails.[Count], dbo.ReceiptDetails.Coeff, dbo.ReceiptDetails.Price
FROM         dbo.Goods INNER JOIN
                      dbo.Receipt INNER JOIN
                      dbo.ReceiptDetails ON dbo.Receipt.ReceiptID = dbo.ReceiptDetails.ReceiptID ON dbo.Goods.GoodsID = dbo.ReceiptDetails.GoodsID INNER JOIN
                      dbo.Goods Goods_1 ON dbo.Receipt.GoodsID = Goods_1.GoodsID

GO
