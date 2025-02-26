USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPQueryMiddleINOUTByContrDoc]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPQueryMiddleINOUTByContrDoc] 
@Parent int = 0
AS
SELECT     TOP 100 PERCENT dbo.QueryINOUTByContr.GoodsID, dbo.QueryINOUTByContr.Code, dbo.QueryINOUTByContr.Description, 
                      isnull(dbo.QueryINOUTByContr.SaldoPercent,0) AS Saldo, isnull(ROUND(dbo.QueryINOUTByContr.SaldoPercentPrice, 3),0) AS SaldoPrice, 
                      dbo.QueryINOUTByContr.Parent, dbo.QueryINOUTByContr.Parent2, dbo.QueryINOUTByContr.Parent3, dbo.QueryINOUTByContr.Parent4, 
                      dbo.QueryINOUTByContr.Parent5, isnull(dbo.QueryMiddleINPriceByContr.docinprice,0) as docinprice, ISNULL(dbo.QueryINOUTByContr.QuantityIN, 0) AS QuantityIN, 
                      ISNULL(dbo.QueryINOUTByContr.QuantityOUT, 0) AS QuantityOUT, isnull(ROUND(dbo.QueryINOUTByContr.SaldoPercentPrice, 3),0) 
                      + isnull(ROUND(dbo.QueryMiddleINPriceByContr.docinprice,3), 0) - isnull(ROUND(dbo.QueryMiddleOUTPriceByContr.docoutprice,3), 0) AS Price, 
                      isnull(dbo.QueryMiddleOUTPriceByContr.docoutprice,0) as docoutprice, dbo.QueryINOUTByContr.Quantity, dbo.QueryINOUTByContr.GoodsID AS Expr1
FROM         dbo.QueryINOUTByContr LEFT OUTER JOIN
                      dbo.QueryMiddleINPriceByContr ON dbo.QueryINOUTByContr.GoodsID = dbo.QueryMiddleINPriceByContr.GoodsID LEFT OUTER JOIN
                      dbo.QueryMiddleOUTPriceByContr ON dbo.QueryINOUTByContr.GoodsID = dbo.QueryMiddleOUTPriceByContr.GoodsID
where
dbo.QueryINOUTByContr.Parent = @Parent
or
dbo.QueryINOUTByContr.Parent2 = @Parent
or 
dbo.QueryINOUTByContr.Parent3 = @Parent
or
dbo.QueryINOUTByContr.Parent4 = @Parent
or
dbo.QueryINOUTByContr.Parent5 = @Parent

ORDER BY dbo.QueryINOUTByContr.Description

GO
