USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPQueryMIddleINOUTDoc]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPQueryMIddleINOUTDoc]
@Parent int = 0
As
SELECT     TOP 100 PERCENT 
dbo.QueryINOUT.GoodsID, 
dbo.QueryINOUT.Code, 
dbo.QueryINOUT.[Description], 
ISNULL(dbo.QueryINOUT.SaldoPercent, 0)  AS Saldo, 
ISNULL(ROUND(dbo.QueryINOUT.SaldoPercentPrice ,3), 0) AS SaldoPrice, 
dbo.QueryINOUT.Parent, 
dbo.QueryINOUT.Parent2,
dbo.QueryINOUT.Parent3,
dbo.QueryINOUT.Parent4,
dbo.QueryINOUT.Parent5,
ISNULL(dbo.QueryMiddleInPrice.docinprice, 0) AS docinprice, 
ISNULL(dbo.QueryINOUT.QuantityIN, 0) AS QuantityIN, 
ISNULL(dbo.QueryINOUT.QuantityOUT, 0) AS QuantityOUT, 
isnull(ROUND(isnull(dbo.QueryINOUT.SaldoPercentPrice,0), 3)  + ROUND(isnull(dbo.QueryMiddleInPrice.docinprice,0), 3) - ROUND(isnull(dbo.QueryMiddleOUTPrice.docoutprice,0), 3), 0) AS Price,
ISNULL(dbo.QueryMiddleOUTPrice.docoutprice, 0) AS docoutprice, 
ISNULL(dbo.QueryINOUT.Quantity, 0) AS Quantity
FROM         dbo.QueryMiddleOUTPrice RIGHT OUTER JOIN
                      dbo.QueryMiddleInPrice RIGHT OUTER JOIN
                      dbo.QueryINOUT ON dbo.QueryMiddleInPrice.GoodsID = dbo.QueryINOUT.GoodsID ON 
                      dbo.QueryMiddleOUTPrice.GoodsID = dbo.QueryINOUT.GoodsID
where
dbo.QueryINOUT.Parent = @Parent
or
dbo.QueryINOUT.Parent2 = @Parent
or
dbo.QueryINOUT.Parent3 = @Parent
or
dbo.QueryINOUT.Parent4 = @Parent
or 
dbo.QueryINOUT.Parent5 = @Parent 

ORDER BY dbo.QueryINOUT.[Description]
GO
