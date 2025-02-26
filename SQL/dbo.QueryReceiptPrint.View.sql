USE [ambc]
GO
/****** Object:  View [dbo].[QueryReceiptPrint]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryReceiptPrint]
AS
SELECT     dbo.QueryReceipt.ReceiptID, dbo.QueryReceipt.Code, dbo.QueryReceipt.Description, dbo.QueryReceipt.ReceiptNum, dbo.QueryReceipt.Weight, 
                      dbo.QueryReceipt.[Receipt.Price], dbo.QueryReceipt.[Goods.Price], dbo.QueryReceiptDetails.GoodsID, dbo.QueryReceiptDetails.Description AS Expr1, 
                      dbo.QueryReceiptDetails.Quantity, dbo.QueryReceiptDetails.InPrice, dbo.QueryReceiptDetails.[Count], dbo.QueryReceiptDetails.Coeff, 
                      dbo.QueryReceiptDetails.Price
FROM         dbo.QueryReceiptDetails INNER JOIN
                      dbo.QueryReceipt ON dbo.QueryReceiptDetails.ReceiptID = dbo.QueryReceipt.ReceiptID

GO
