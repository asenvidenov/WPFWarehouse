USE [ambc]
GO
/****** Object:  View [dbo].[QueryOkladAdd]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryOkladAdd]
AS
SELECT     dbo.Documents.DocDate, dbo.Diets.DietNum, dbo.Documents.TypeNumber, MAX(dbo.Cooking.[Count]) AS MaxOfCount, dbo.Contragents.ContrName, 
                      SUM(dbo.Cooking.Price * dbo.Cooking.Quantity * dbo.Cooking.[Count]) AS CookPrice
FROM         dbo.Period CROSS JOIN
                      dbo.tblDietPrice INNER JOIN
                      dbo.Cooking INNER JOIN
                      dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Diets ON dbo.Cooking.DietID = dbo.Diets.DietID ON dbo.tblDietPrice.DietID = dbo.Diets.DietID INNER JOIN
                      dbo.Contragents ON dbo.tblDietPrice.ContrID = dbo.Contragents.ContrID AND dbo.Documents.Contragent = dbo.Contragents.ContrID
WHERE     (dbo.Cooking.FoodID = 6)
GROUP BY dbo.Documents.DocDate, dbo.Diets.DietNum, dbo.Documents.TypeNumber, dbo.Contragents.ContrName
HAVING      (dbo.Documents.DocDate >= MAX(dbo.Period.DateFrom)) AND (dbo.Documents.DocDate <= MAX(dbo.Period.Dateto))

GO
