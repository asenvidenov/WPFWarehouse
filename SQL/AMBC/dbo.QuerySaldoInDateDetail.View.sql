USE [ambc]
GO
/****** Object:  View [dbo].[QuerySaldoInDateDetail]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QuerySaldoInDateDetail]
AS
SELECT     dbo.Goods.GoodsID, dbo.Goods.Description, dbo.Goods.Saldo, ISNULL(SUM(dbo.Goods.SaldoPrice), 0) AS SaldoPrice, 
                      ISNULL(dbo.QueryWINinDate.[Real], 0) AS realin, ISNULL(SUM(dbo.QueryWINinDate.[Real] * dbo.QueryWINinDate.InPrice), 0) AS Inprice, 
                      ISNULL(dbo.QueryWINinDate.QuantityDoc, 0) AS QuantityDoc, ISNULL(SUM(dbo.QueryWINinDate.QuantityDoc * dbo.QueryWINinDate.InPrice), 0) 
                      AS InDocprice, ISNULL(dbo.QueryWOUTInDate.[Real], 0) AS realout, ISNULL(SUM(dbo.QueryWOUTInDate.[Real] * dbo.QueryWOUTInDate.OutPrice), 0) 
                      AS Outprice, ISNULL(dbo.QueryWOUTInDate.QuantityPercent, 0) AS QuantityPercent, 
                      ISNULL(SUM(dbo.QueryWOUTInDate.QuantityPercent * dbo.QueryWOUTInDate.OutPrice), 0) AS OutDocprice, dbo.Goods.SaldoPercent, 
                      dbo.Goods.SaldoPercentPrice
FROM         dbo.Goods LEFT OUTER JOIN
                      dbo.QueryWINinDate ON dbo.Goods.GoodsID = dbo.QueryWINinDate.GoodsID LEFT OUTER JOIN
                      dbo.QueryWOUTInDate ON dbo.Goods.GoodsID = dbo.QueryWOUTInDate.GoodsID
GROUP BY dbo.Goods.GoodsID, dbo.Goods.Description, dbo.Goods.Saldo, ISNULL(dbo.QueryWINinDate.[Real], 0), ISNULL(dbo.QueryWINinDate.QuantityDoc, 0),
                       ISNULL(dbo.QueryWOUTInDate.[Real], 0), ISNULL(dbo.QueryWOUTInDate.QuantityPercent, 0), dbo.Goods.SaldoPercent, 
                      dbo.Goods.SaldoPercentPrice, dbo.Goods.ByReceipt, dbo.Goods.[Group]
HAVING      (dbo.Goods.ByReceipt = 0) AND (dbo.Goods.[Group] = 0)
GO
