USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPQueryMiddleINOUT]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPQueryMiddleINOUT]
@Parent int = 0
AS
SELECT top 100 percent dbo.QueryINOUT.GoodsID, dbo.QueryINOUT.Code, 
    dbo.QueryINOUT.[Description], dbo.QueryINOUT.Saldo, 
    dbo.QueryINOUT.SaldoPrice,
     ISNULL(dbo.QueryINOUT.RealIN, 0) AS RealIN, 
    ISNULL(dbo.QueryMiddleInPrice.realinprice, 0) AS realinprice, 
    ISNULL(dbo.QueryINOUT.RealOUT, 0) AS RealOUT, 
    ISNULL(dbo.QueryMiddleOUTPrice.realoutprice, 0) 
    AS realoutprice,
 ISNULL(dbo.QueryINOUT.[real], 0) AS [real], 
    ROUND(dbo.QueryINOUT.SaldoPrice, 3) 
    + ISNULL(ROUND(dbo.QueryMiddleInPrice.realinprice, 3), 0) 
    - ISNULL(ROUND(dbo.QueryMiddleOUTPrice.realoutprice, 3), 0) 
    AS Price,
dbo.QueryINOUT.Parent, 
dbo.QueryINOUT.Parent2,
dbo.QueryINOUT.Parent3,
dbo.QueryINOUT.Parent4,
dbo.QueryINOUT.Parent5
FROM dbo.QueryMiddleInPrice RIGHT OUTER JOIN
    dbo.QueryINOUT ON 
    dbo.QueryMiddleInPrice.GoodsID = dbo.QueryINOUT.GoodsID LEFT
     OUTER JOIN
    dbo.QueryMiddleOUTPrice ON 
    dbo.QueryINOUT.GoodsID = dbo.QueryMiddleOUTPrice.GoodsID
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
