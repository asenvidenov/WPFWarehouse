USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookImport]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookImport]
AS
SELECT     TOP 100 PERCENT dbo.Diets.DietNum, dbo.Cooking.CookingID, dbo.Cooking.DietID, dbo.Documents.DocDate, dbo.Cooking.DocID, dbo.Cooking.FoodID,
                       dbo.Contragents.Code, dbo.Contragents.ContrName, dbo.Documents.ExtraInfo, dbo.Cooking.GoodsID, dbo.Goods.Price, dbo.Cooking.Quantity, 
                      dbo.Cooking.HiddenPercent
FROM         dbo.Diets INNER JOIN
                      dbo.Food INNER JOIN
                      dbo.Contragents INNER JOIN
                      dbo.Documents ON dbo.Contragents.ContrID = dbo.Documents.ContrID INNER JOIN
                      dbo.Goods INNER JOIN
                      dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID ON dbo.Documents.DocID = dbo.Cooking.DocID ON 
                      dbo.Food.FoodID = dbo.Cooking.FoodID ON dbo.Diets.DietID = dbo.Cooking.DietID
ORDER BY dbo.Diets.DietNum, dbo.Cooking.CookingID, dbo.Documents.DocDate DESC

GO
