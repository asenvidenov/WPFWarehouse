USE [ambc]
GO
/****** Object:  View [dbo].[QueryINOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryINOUT]
AS
SELECT     dbo.Goods.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.Goods.Price, dbo.Goods.Saldo, SUM(ISNULL(dbo.QueryIN.SumOfReal, 0)) 
                      AS RealIN, SUM(ISNULL(dbo.QueryOUT.SumOfReal, 0)) AS RealOUT, ROUND(SUM(ISNULL(dbo.Goods.Saldo, 0) + ISNULL(dbo.QueryIN.SumOfReal, 0) 
                      - ISNULL(dbo.QueryOUT.SumOfReal, 0)), 3) AS [real], SUM(ISNULL(dbo.QueryIN.SumOfQuantityDoc, 0)) AS QuantityIN, 
                      SUM(ISNULL(dbo.QueryOUT.RealPercent, 0)) AS QuantityOUT, dbo.Goods.[Group], dbo.Goods.Parent, dbo.measure.Measure, 
                      ROUND(SUM(ISNULL(dbo.Goods.SaldoPercent, 0) + ISNULL(dbo.QueryIN.SumOfQuantityDoc, 0) - ISNULL(dbo.QueryOUT.RealPercent, 0)), 3) 
                      AS Quantity, Goods_1.Parent AS Parent2, Goods_2.Parent AS Parent3, Goods_3.Parent AS Parent4, Goods_4.Parent AS Parent5, dbo.Goods.SaldoPrice, 
                      dbo.Goods.SaldoPercent, dbo.Goods.SaldoPercentPrice
FROM         dbo.measure INNER JOIN
                      dbo.Goods LEFT OUTER JOIN
                      dbo.QueryIN ON dbo.Goods.GoodsID = dbo.QueryIN.GoodsID ON dbo.measure.MeasureID = dbo.Goods.Measure LEFT OUTER JOIN
                      dbo.Goods Goods_1 ON dbo.Goods.Parent = Goods_1.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_2 ON Goods_1.Parent = Goods_2.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_3 ON Goods_2.Parent = Goods_3.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_4 ON Goods_3.Parent = Goods_4.GoodsID LEFT OUTER JOIN
                      dbo.QueryOUT ON dbo.Goods.GoodsID = dbo.QueryOUT.GoodsID
GROUP BY dbo.Goods.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.Goods.Price, dbo.Goods.Saldo, dbo.Goods.[Group], dbo.Goods.Parent, 
                      dbo.measure.Measure, Goods_1.Parent, Goods_2.Parent, Goods_3.Parent, Goods_4.Parent, dbo.Goods.SaldoPrice, dbo.Goods.SaldoPercent, 
                      dbo.Goods.SaldoPercentPrice
HAVING      (dbo.Goods.[Group] = 0)
GO
