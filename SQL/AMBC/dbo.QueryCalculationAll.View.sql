USE [ambc]
GO
/****** Object:  View [dbo].[QueryCalculationAll]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryCalculationAll]
AS
SELECT     TOP 100 PERCENT dbo.BufferOUT.FoodID, Goods_1.Code, Goods_1.Description, dbo.Goods.Code AS GCode, dbo.Goods.Description AS GDesc, 
                      dbo.BufferOUT.QuantityPercent, dbo.measure.Measure, dbo.BufferOUT.ContrID, dbo.Receipt.Weight, SUM(dbo.BufferOUT.[Count]) AS SumOfCount, 
                      SUM(dbo.BufferOUT.QuantityPercent * dbo.BufferOUT.[Count]) AS [Real], dbo.Food.FoodDesc, dbo.BufferOUT.DocID
FROM         dbo.Food INNER JOIN
                      dbo.measure INNER JOIN
                      dbo.BufferOUT INNER JOIN
                      dbo.Goods ON dbo.BufferOUT.GoodsID = dbo.Goods.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_1 ON dbo.BufferOUT.ParentID = Goods_1.GoodsID LEFT OUTER JOIN
                      dbo.Receipt ON dbo.BufferOUT.ParentID = dbo.Receipt.GoodsID ON dbo.measure.MeasureID = dbo.Goods.Measure ON 
                      dbo.Food.FoodID = dbo.BufferOUT.FoodID
GROUP BY dbo.BufferOUT.FoodID, Goods_1.Code, Goods_1.Description, dbo.Goods.Code, dbo.Goods.Description, dbo.BufferOUT.QuantityPercent, 
                      dbo.measure.Measure, dbo.BufferOUT.ContrID, dbo.Receipt.Weight, dbo.Food.FoodDesc, dbo.BufferOUT.DocID
ORDER BY dbo.BufferOUT.FoodID
GO
