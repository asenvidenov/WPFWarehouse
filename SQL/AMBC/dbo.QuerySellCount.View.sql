USE [ambc]
GO
/****** Object:  View [dbo].[QuerySellCount]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QuerySellCount]
AS
SELECT     TOP 100 PERCENT dbo.tblSale.SellDate, dbo.tblSale.GoodsID, SUM(dbo.tblSale.[Count]) AS SumOfCount, dbo.tblSale.Price, dbo.tblSale.InPrice, 
                      dbo.Goods.Description
FROM         dbo.tblSale INNER JOIN
                      dbo.Goods ON dbo.tblSale.GoodsID = dbo.Goods.GoodsID
GROUP BY dbo.tblSale.SellDate, dbo.tblSale.GoodsID, dbo.tblSale.Price, dbo.tblSale.InPrice, dbo.Goods.Description
ORDER BY dbo.tblSale.SellDate
GO
