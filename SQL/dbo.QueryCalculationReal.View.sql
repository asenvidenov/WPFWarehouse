USE [ambc]
GO
/****** Object:  View [dbo].[QueryCalculationReal]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryCalculationReal]
AS
SELECT     TOP 100 PERCENT dbo.BufferOUT.FoodID, Goods_1.Code, Goods_1.Description, dbo.Goods.Code AS GCode, dbo.Goods.Description AS GDesc, 
                      dbo.BufferOUT.ContrID, dbo.Receipt.Weight, dbo.BufferOUT.Quantity, SUM(dbo.BufferOUT.[Count]) AS SumOfCount, dbo.Food.FoodDesc, 
                      dbo.measure.Measure, SUM((dbo.BufferOUT.Quantity - dbo.BufferOUT.Quantity * dbo.BufferOUT.HiddenPercent / 100) * dbo.BufferOUT.[Count]) 
                      AS [Real], dbo.BufferOUT.DocID, dbo.BufferOUT.Quantity - dbo.BufferOUT.Quantity * dbo.BufferOUT.HiddenPercent / 100 AS RealQuantity
FROM         dbo.measure INNER JOIN
                      dbo.Food INNER JOIN
                      dbo.BufferOUT INNER JOIN
                      dbo.Goods ON dbo.BufferOUT.GoodsID = dbo.Goods.GoodsID LEFT OUTER JOIN
                      dbo.Goods Goods_1 ON dbo.BufferOUT.ParentID = Goods_1.GoodsID LEFT OUTER JOIN
                      dbo.Receipt ON dbo.BufferOUT.ParentID = dbo.Receipt.GoodsID ON dbo.Food.FoodID = dbo.BufferOUT.FoodID ON 
                      dbo.measure.MeasureID = dbo.Goods.Measure
GROUP BY dbo.BufferOUT.FoodID, Goods_1.Code, Goods_1.Description, dbo.Goods.Code, dbo.Goods.Description, dbo.BufferOUT.ContrID, dbo.Receipt.Weight, 
                      dbo.BufferOUT.Quantity, dbo.Food.FoodDesc, dbo.measure.Measure, dbo.BufferOUT.DocID, 
                      dbo.BufferOUT.Quantity - dbo.BufferOUT.Quantity * dbo.BufferOUT.HiddenPercent / 100
HAVING      (SUM((dbo.BufferOUT.Quantity - dbo.BufferOUT.Quantity * dbo.BufferOUT.HiddenPercent / 100) * dbo.BufferOUT.[Count]) > 0) AND 
                      (dbo.BufferOUT.Quantity - dbo.BufferOUT.Quantity * dbo.BufferOUT.HiddenPercent / 100 > 0)
ORDER BY dbo.BufferOUT.FoodID
GO
