USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookCountToDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryCookCountToDate]
AS
SELECT     dbo.Documents.DocDate, dbo.Cooking.GoodsID, SUM(dbo.Cooking.[Count]) AS SumOfCount, dbo.Cooking.InPrice, dbo.Cooking.HiddenPercent
FROM         dbo.Period CROSS JOIN
                      dbo.Documents INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID
GROUP BY dbo.Documents.DocDate, dbo.Cooking.GoodsID, dbo.Cooking.InPrice, dbo.Cooking.HiddenPercent
HAVING      (dbo.Documents.DocDate <= MAX(dbo.Period.Dateto)) AND (dbo.Cooking.HiddenPercent = 0)
GO
