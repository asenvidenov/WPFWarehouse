USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPQueryMiddleINOUTByContr]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPQueryMiddleINOUTByContr]
@Parent int = 0
AS

SELECT     dbo.QueryINOUTByContr.GoodsID, dbo.QueryINOUTByContr.Code, dbo.QueryINOUTByContr.Description, isnull(dbo.QueryINOUTByContr.Saldo,0) as Saldo, 
                      isnull(dbo.QueryINOUTByContr.SaldoPrice,0) as SaldoPrice, ISNULL(dbo.QueryINOUTByContr.RealIN, 0) AS RealIN, isnull(dbo.QueryMiddleINPriceByContr.realinprice,0) as realinprice, 
                      ISNULL(dbo.QueryINOUTByContr.RealOUT, 0) AS RealOUT, dbo.QueryINOUTByContr.[real], ROUND(dbo.QueryINOUTByContr.SaldoPrice, 3) 
                      + ISNULL(ROUND(dbo.QueryMiddleINPriceByContr.realinprice, 3), 0) - isnull(ROUND(dbo.QueryMiddleOUTPriceByContr.realoutprice, 3),0) AS Price, 
                      dbo.QueryINOUTByContr.Parent, dbo.QueryINOUTByContr.Parent2, dbo.QueryINOUTByContr.Parent3, dbo.QueryINOUTByContr.Parent4, 
                      dbo.QueryINOUTByContr.Parent5, isnull(dbo.QueryMiddleOUTPriceByContr.realoutprice,0) as realoutprice
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

GO
