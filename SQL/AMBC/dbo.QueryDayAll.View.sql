USE [ambc]
GO
/****** Object:  View [dbo].[QueryDayAll]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryDayAll]
AS
SELECT     TOP 100 PERCENT dbo.QueryCook.DocID, dbo.QueryCook.DietID, dbo.QueryCook.Code, dbo.QueryCook.Description, dbo.QueryCook.FoodID, 
                      SUM(dbo.QueryCook.[Count]) AS [count], dbo.QueryCook.Price * dbo.QueryCook.Quantity AS Price, dbo.QueryCook.Measure, dbo.Diets.DietDescription, 
                      dbo.Food.FoodDesc, dbo.QueryCook.Quantity
FROM         dbo.QueryCook INNER JOIN
                      dbo.Food ON dbo.QueryCook.FoodID = dbo.Food.FoodID INNER JOIN
                      dbo.Diets ON dbo.QueryCook.DietID = dbo.Diets.DietID
GROUP BY dbo.QueryCook.DocID, dbo.QueryCook.DietID, dbo.QueryCook.Code, dbo.QueryCook.Description, dbo.QueryCook.FoodID, 
                      dbo.QueryCook.Price * dbo.QueryCook.Quantity, dbo.QueryCook.Measure, dbo.Diets.DietDescription, dbo.Food.FoodDesc, 
                      dbo.QueryCook.Quantity
ORDER BY dbo.QueryCook.DocID

GO
