USE [ambc]
GO
/****** Object:  View [dbo].[QueryProductionSellDetail]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryProductionSellDetail]
AS
SELECT     TOP 100 PERCENT dbo.Documents.DocDate, dbo.Goods.Code, dbo.Goods.Description, dbo.measure.Measure, dbo.Cooking.[Count], 
                      dbo.Cooking.InPrice, dbo.Cooking.Price, dbo.Documents.Contragent, dbo.Cooking.[Count] * dbo.Cooking.InPrice * dbo.Cooking.Quantity AS CinPrice, 
                      dbo.Cooking.Price * dbo.Cooking.[Count] * dbo.Cooking.Quantity AS CPrice, dbo.Diets.DietNum, dbo.Diets.DietDescription, dbo.Goods.GoodsID
FROM         dbo.Period INNER JOIN
                      dbo.Cooking INNER JOIN
                      dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Goods ON dbo.Cooking.GoodsID = dbo.Goods.GoodsID INNER JOIN
                      dbo.measure ON dbo.Goods.Measure = dbo.measure.MeasureID INNER JOIN
                      dbo.Diets ON dbo.Cooking.DietID = dbo.Diets.DietID ON dbo.Period.InDate <= dbo.Documents.DocDate AND 
                      dbo.Period.OutDate >= dbo.Documents.DocDate
ORDER BY dbo.Documents.DocDate

GO
