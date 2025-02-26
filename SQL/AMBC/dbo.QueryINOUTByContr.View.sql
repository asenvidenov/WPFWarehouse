USE [ambc]
GO
/****** Object:  View [dbo].[QueryINOUTByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryINOUTByContr]
AS
SELECT     dbo.Goods.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.Goods.Price, dbo.QuerySaldoByContr.Saldo, SUM(dbo.QueryINByContr.[Real]) 
                      AS RealIN, SUM(dbo.QueryOUTByContr.[Real]) AS RealOUT, SUM(ISNULL(dbo.QuerySaldoByContr.saldo, 0) + ISNULL(dbo.QueryINByContr.[Real], 0) 
                      - ISNULL(dbo.QueryOUTByContr.[Real], 0)) AS real, SUM(dbo.QueryINByContr.QuantityDoc) AS QuantityIN, SUM(dbo.QueryOUTByContr.RealPercent) 
                      AS QuantityOUT, dbo.Goods.[Group], dbo.Goods.Parent, dbo.measure.Measure, SUM(ISNULL(dbo.QuerySaldoByContr.saldodoc, 0) 
                      + ISNULL(dbo.QueryINByContr.QuantityDoc, 0) - ISNULL(dbo.QueryOUTByContr.RealPercent, 0)) AS Quantity, Goods_1.Parent AS Parent2, 
                      Goods_2.Parent AS Parent3, Goods_3.Parent AS Parent4, Goods_4.Parent AS Parent5, dbo.QuerySaldoByContr.SaldoPrice, 
                      dbo.QueryINByContr.ValueIN, dbo.QueryOUTByContr.SumOfvalueOUT AS valueOUT, dbo.QuerySaldoByContr.SaldoDoc AS SaldoPercent, 
                      dbo.QuerySaldoByContr.SaldoDocPrice AS SaldoPercentPrice
FROM         dbo.measure INNER JOIN
                      dbo.Goods ON dbo.measure.MeasureID = dbo.Goods.Measure LEFT OUTER JOIN
                      dbo.Goods Goods_1 ON dbo.Goods.Parent = Goods_1.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_2 ON Goods_1.Parent = Goods_2.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_3 ON Goods_2.Parent = Goods_3.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_4 ON Goods_3.Parent = Goods_4.GoodsID LEFT OUTER JOIN
                      dbo.QueryINByContr ON dbo.Goods.GoodsID = dbo.QueryINByContr.GoodsID LEFT OUTER JOIN
                      dbo.QueryOUTByContr ON dbo.Goods.GoodsID = dbo.QueryOUTByContr.GoodsID INNER JOIN
                      dbo.QuerySaldoByContr ON dbo.Goods.GoodsID = dbo.QuerySaldoByContr.GoodsID
GROUP BY dbo.Goods.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.Goods.Price, dbo.QuerySaldoByContr.Saldo, dbo.Goods.[Group], 
                      dbo.Goods.Parent, dbo.measure.Measure, Goods_1.Parent, Goods_2.Parent, Goods_3.Parent, Goods_4.Parent, dbo.QuerySaldoByContr.SaldoPrice, 
                      dbo.QueryINByContr.ValueIN, dbo.QueryOUTByContr.SumOfvalueOUT, dbo.QuerySaldoByContr.SaldoDoc, 
                      dbo.QuerySaldoByContr.SaldoDocPrice
HAVING      (dbo.Goods.[Group] = 0)

GO
