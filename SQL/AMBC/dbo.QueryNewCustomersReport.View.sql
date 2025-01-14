USE [ambc]
GO
/****** Object:  View [dbo].[QueryNewCustomersReport]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryNewCustomersReport]
AS
SELECT     dbo.Documents.DocDate, dbo.Cooking.[Count], dbo.Contragents.ContrName, dbo.Diets.DietNum, SUM(dbo.Cooking.Price) AS SumOfPrice
FROM         dbo.Diets INNER JOIN
                      dbo.Documents INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID ON dbo.Diets.DietID = dbo.Cooking.DietID INNER JOIN
                      dbo.Contragents ON dbo.Documents.Contragent = dbo.Contragents.ContrID
GROUP BY dbo.Documents.DocDate, dbo.Cooking.[Count], dbo.Contragents.ContrName, dbo.Diets.DietNum
HAVING      (dbo.Diets.DietNum = 9)

GO
