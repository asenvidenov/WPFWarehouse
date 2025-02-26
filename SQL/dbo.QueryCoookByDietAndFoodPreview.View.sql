USE [ambc]
GO
/****** Object:  View [dbo].[QueryCoookByDietAndFoodPreview]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCoookByDietAndFoodPreview]
AS
SELECT     dbo.QueryCookByDietPreview.DocID, dbo.QueryCookByDietPreview.DietID, dbo.Diets.DietDescription, dbo.QueryCookByDietPreview.FoodID, 
                      dbo.QueryCookByDietPreview.endprice, dbo.QueryCookByFoodPreview.SumOfendprice
FROM         dbo.Diets INNER JOIN
                      dbo.QueryCookByDietPreview ON dbo.Diets.DietID = dbo.QueryCookByDietPreview.DietID INNER JOIN
                      dbo.QueryCookByFoodPreview ON dbo.Diets.DietID = dbo.QueryCookByFoodPreview.DietID

GO
