USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookManuImport]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookManuImport]
AS
SELECT     TOP 100 PERCENT dbo.Documents.DocDate, dbo.Cooking.DocID, dbo.Contragents.ContrName, dbo.Documents.ExtraInfo
FROM         dbo.Food INNER JOIN
                      dbo.Documents INNER JOIN
                      dbo.Goods INNER JOIN
                      dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID ON dbo.Documents.DocID = dbo.Cooking.DocID ON 
                      dbo.Food.FoodID = dbo.Cooking.FoodID INNER JOIN
                      dbo.Contragents ON dbo.Documents.Contragent = dbo.Contragents.ContrID
GROUP BY dbo.Documents.DocDate, dbo.Cooking.DocID, dbo.Contragents.ContrName, dbo.Documents.ExtraInfo
ORDER BY dbo.Documents.DocDate DESC

GO
