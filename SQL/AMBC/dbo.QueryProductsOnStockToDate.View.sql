USE [ambc]
GO
/****** Object:  View [dbo].[QueryProductsOnStockToDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryProductsOnStockToDate]
AS
SELECT     dbo.Goods.Code, dbo.Goods.Description, dbo.tblDaySales.Cooked, dbo.tblDaySales.Sold, dbo.tblDaySales.Correection, 
                      dbo.tblDaySales.Cooked - dbo.tblDaySales.Sold + dbo.tblDaySales.Correection AS Quantity, dbo.Goods.ByReceipt, dbo.Goods.Price, 
                      ROUND((dbo.tblDaySales.Cooked - dbo.tblDaySales.Sold + dbo.tblDaySales.Correection) * dbo.Goods.Price, 3) AS EndPrice, 
                      dbo.tblDaySales.Cooked * dbo.Goods.Price AS cookprice, dbo.tblDaySales.Sold * dbo.Goods.Price AS soldprice
FROM         dbo.Goods INNER JOIN
                      dbo.tblDaySales ON dbo.Goods.GoodsID = dbo.tblDaySales.GoodsID
WHERE     (dbo.Goods.ByReceipt = 0)
GO
