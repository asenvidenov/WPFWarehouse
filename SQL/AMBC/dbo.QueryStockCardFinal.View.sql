USE [ambc]
GO
/****** Object:  View [dbo].[QueryStockCardFinal]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryStockCardFinal]
AS
SELECT     dbo.tblStock.Saldo, dbo.tblStock.Price, dbo.tblStock.SaldoDoc, dbo.tblStock.DocPrice, SUM(dbo.tblStockCard.StockIN) AS SumOfStockIN, 
                      SUM(dbo.tblStockCard.INPrice * dbo.tblStockCard.StockIN) AS INPrice, SUM(dbo.tblStockCard.StockOUT) AS SumOfStockOUT, 
                      SUM(dbo.tblStockCard.OUTPrice * dbo.tblStockCard.StockOUT) AS OUTPrice, SUM(dbo.tblStockCard.StockINDoc) AS SumOfStockINDoc, 
                      SUM(dbo.tblStockCard.StockOUTDoc) AS SumOfStockOUTDoc, SUM(dbo.tblStockCard.StockINDoc * dbo.tblStockCard.INPrice) AS InDocPrice, 
                      SUM(dbo.tblStockCard.StockOUTDoc * dbo.tblStockCard.OUTPrice) AS OutDocPrice
FROM         dbo.tblStock CROSS JOIN
                      dbo.tblStockCard
GROUP BY dbo.tblStock.Saldo, dbo.tblStock.Price, dbo.tblStock.SaldoDoc, dbo.tblStock.DocPrice

GO
