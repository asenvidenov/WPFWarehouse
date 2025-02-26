USE [ambc]
GO
/****** Object:  View [dbo].[QuerySellCountToDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QuerySellCountToDate]
AS
SELECT     dbo.tblSale.GoodsID, SUM(dbo.tblSale.[Count]) AS SumOfCount, dbo.tblSale.Price, dbo.tblSale.InPrice, dbo.Goods.Description
FROM         dbo.Period INNER JOIN
                      dbo.tblSale INNER JOIN
                      dbo.Goods ON dbo.tblSale.GoodsID = dbo.Goods.GoodsID ON dbo.Period.Dateto + 1 >= dbo.tblSale.SellDate
GROUP BY dbo.tblSale.GoodsID, dbo.tblSale.Price, dbo.tblSale.InPrice, dbo.Goods.Description
GO
