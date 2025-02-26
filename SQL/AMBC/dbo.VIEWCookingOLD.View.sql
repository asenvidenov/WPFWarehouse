USE [ambc]
GO
/****** Object:  View [dbo].[VIEWCookingOLD]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWCookingOLD]
AS
SELECT dbo.Cooking.DocID, dbo.Documents.DocDate, 
    dbo.Goods.GoodsID, dbo.Goods.CashCode AS Code, 
    dbo.Goods.CashName AS Description, dbo.Food.FoodDesc, 
    ABS(dbo.Cooking.Quantity) AS Quantity, 
    ABS(dbo.Cooking.Price) AS Price, dbo.Goods.ByReceipt
FROM dbo.Documents INNER JOIN
    dbo.Food INNER JOIN
    dbo.Goods INNER JOIN
    dbo.Cooking ON 
    dbo.Goods.GoodsID = dbo.Cooking.GoodsID ON 
    dbo.Food.FoodID = dbo.Cooking.FoodID ON 
    dbo.Documents.DocID = dbo.Cooking.DocID
GROUP BY dbo.Cooking.DocID, dbo.Documents.DocDate, 
    dbo.Goods.GoodsID, dbo.Goods.CashCode, 
    dbo.Goods.CashName, dbo.Food.FoodDesc, 
    ABS(dbo.Cooking.Price), dbo.Goods.ByReceipt, 
    ABS(dbo.Cooking.Quantity)
GO
