USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookCombine]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookCombine]
AS
SELECT     dbo.Cooking.DocID, dbo.Cooking.GoodsID, dbo.Goods.Code, dbo.Goods.Description, SUM(dbo.Cooking.[Count]) AS SumOfCount, dbo.Cooking.InPrice, 
                      dbo.Cooking.Price, dbo.Cooking.HiddenPercent, dbo.Goods.Measure, dbo.Cooking.Quantity, 
                      dbo.Cooking.Quantity - dbo.Cooking.Quantity * dbo.Cooking.HiddenPercent / 100 AS RealQuantity, ROUND(dbo.Cooking.InPrice * dbo.Cooking.Quantity, 
                      3) AS RealPrice, ROUND(dbo.Cooking.Quantity * dbo.Cooking.Price, 3) AS endprice, 
                      ROUND((dbo.Cooking.Quantity - dbo.Cooking.Quantity * dbo.Cooking.HiddenPercent / 100) * dbo.Cooking.[Count] * dbo.Cooking.InPrice, 3) 
                      AS RealEndPrice, dbo.Contragents.ContrName
FROM         dbo.Documents INNER JOIN
                      dbo.measure INNER JOIN
                      dbo.Food INNER JOIN
                      dbo.Diets INNER JOIN
                      dbo.Goods INNER JOIN
                      dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID ON dbo.Diets.DietID = dbo.Cooking.DietID ON dbo.Food.FoodID = dbo.Cooking.FoodID ON 
                      dbo.measure.MeasureID = dbo.Goods.Measure ON dbo.Documents.DocID = dbo.Cooking.DocID INNER JOIN
                      dbo.Contragents ON dbo.Documents.Contragent = dbo.Contragents.ContrID
GROUP BY dbo.Cooking.DocID, dbo.Cooking.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.Cooking.InPrice, dbo.Cooking.Price, 
                      dbo.Cooking.HiddenPercent, dbo.Goods.Measure, dbo.Cooking.Quantity, ROUND(dbo.Cooking.InPrice * dbo.Cooking.Quantity, 3), 
                      ROUND(dbo.Cooking.Quantity * dbo.Cooking.Price, 3), ROUND((dbo.Cooking.Quantity - dbo.Cooking.Quantity * dbo.Cooking.HiddenPercent / 100) 
                      * dbo.Cooking.[Count] * dbo.Cooking.InPrice, 3), dbo.Contragents.ContrName

GO
