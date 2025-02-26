USE [ambc]
GO
/****** Object:  View [dbo].[QueryCalculationWare]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryCalculationWare]
AS
SELECT     dbo.Goods.Code, dbo.Goods.Description, dbo.measure.Measure, 
                      SUM((dbo.BufferOUT.Quantity - dbo.BufferOUT.Quantity * dbo.BufferOUT.HiddenPercent / 100) * dbo.BufferOUT.[Count]) AS [Real], 
                      dbo.Documents.DocDate, SUM(dbo.BufferOUT.QuantityPercent * dbo.BufferOUT.[Count]) AS QDoc
FROM         dbo.measure INNER JOIN
                      dbo.Food INNER JOIN
                      dbo.BufferOUT INNER JOIN
                      dbo.Goods ON dbo.BufferOUT.GoodsID = dbo.Goods.GoodsID LEFT OUTER JOIN
                      dbo.Receipt ON dbo.BufferOUT.ParentID = dbo.Receipt.GoodsID ON dbo.Food.FoodID = dbo.BufferOUT.FoodID ON 
                      dbo.measure.MeasureID = dbo.Goods.Measure INNER JOIN
                      dbo.Documents ON dbo.BufferOUT.DocID = dbo.Documents.DocID
GROUP BY dbo.Goods.Code, dbo.Goods.Description, dbo.measure.Measure, dbo.Documents.DocDate, dbo.BufferOUT.QuantityPercent
HAVING      (SUM((dbo.BufferOUT.Quantity - dbo.BufferOUT.Quantity * dbo.BufferOUT.HiddenPercent / 100) * dbo.BufferOUT.[Count]) > 0)
GO
