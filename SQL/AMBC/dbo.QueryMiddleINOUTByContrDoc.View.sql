USE [ambc]
GO
/****** Object:  View [dbo].[QueryMiddleINOUTByContrDoc]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryMiddleINOUTByContrDoc]
AS
SELECT     TOP 100 PERCENT dbo.QueryINOUTByContr.GoodsID, dbo.QueryINOUTByContr.Code, dbo.QueryINOUTByContr.Description, 
                      dbo.QueryINOUTByContr.SaldoPercent AS Saldo, ROUND(dbo.QueryINOUTByContr.SaldoPercentPrice, 3) AS SaldoPrice, 
                      dbo.QueryINOUTByContr.Parent, dbo.QueryINOUTByContr.Parent2, dbo.QueryINOUTByContr.Parent3, dbo.QueryINOUTByContr.Parent4, 
                      dbo.QueryINOUTByContr.Parent5, dbo.QueryMiddleINPriceByContr.docinprice, ISNULL(dbo.QueryINOUTByContr.QuantityIN, 0) AS QuantityIN, 
                      ISNULL(dbo.QueryINOUTByContr.QuantityOUT, 0) AS QuantityOUT, ROUND(dbo.QueryINOUTByContr.SaldoPercentPrice, 3) 
                      + ROUND(dbo.QueryMiddleINPriceByContr.docinprice, 3) - ROUND(dbo.QueryMiddleOUTPriceByContr.docoutprice, 3) AS Price, 
                      dbo.QueryMiddleOUTPriceByContr.docoutprice, dbo.QueryINOUTByContr.Quantity, dbo.QueryINOUTByContr.GoodsID AS Expr1
FROM         dbo.QueryINOUTByContr LEFT OUTER JOIN
                      dbo.QueryMiddleINPriceByContr ON dbo.QueryINOUTByContr.GoodsID = dbo.QueryMiddleINPriceByContr.GoodsID LEFT OUTER JOIN
                      dbo.QueryMiddleOUTPriceByContr ON dbo.QueryINOUTByContr.GoodsID = dbo.QueryMiddleOUTPriceByContr.GoodsID
ORDER BY dbo.QueryINOUTByContr.Description
GO
