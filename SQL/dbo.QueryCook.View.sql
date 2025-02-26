USE [ambc]
GO
/****** Object:  View [dbo].[QueryCook]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCook]
AS
SELECT Cooking.DietID, Cooking.FoodID, Cooking.CookingID, 
    Cooking.DocID, Cooking.CookDate, Cooking.GoodsID, 
    Goods.Code, Goods.Description, Cooking.Quantity, 
    Cooking.[COUNT], Cooking.InPrice, Cooking.Price, 
    Cooking.HiddenPercent, Goods.Measure, 
    Goods.Price AS GoodPrice
FROM Measure INNER JOIN
    (Food INNER JOIN
    (Diets INNER JOIN
    (Goods INNER JOIN
    Cooking ON Goods.GoodsID = Cooking.GoodsID) ON 
    Diets.DietID = Cooking.DietID) ON 
    Food.FoodID = Cooking.FoodID) ON 
    Measure.MeasureID = Goods.Measure

GO
