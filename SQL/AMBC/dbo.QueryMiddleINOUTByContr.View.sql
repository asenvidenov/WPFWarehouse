USE [ambc]
GO
/****** Object:  View [dbo].[QueryMiddleINOUTByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryMiddleINOUTByContr]
AS
SELECT     dbo.QueryINOUTByContr.GoodsID, dbo.QueryINOUTByContr.Code, dbo.QueryINOUTByContr.Description, dbo.QueryINOUTByContr.Saldo, 
                      dbo.QueryINOUTByContr.SaldoPrice AS SaldoPrice, ISNULL(dbo.QueryINOUTByContr.RealIN, 0) AS RealIN, 
                      dbo.QueryMiddleINPriceByContr.realinprice, ISNULL(dbo.QueryINOUTByContr.RealOUT, 0) AS RealOUT, dbo.QueryINOUTByContr.[real] AS real, 
                      ROUND(dbo.QueryINOUTByContr.SaldoPrice, 3) + ISNULL(ROUND(dbo.QueryMiddleINPriceByContr.realinprice, 3), 0) 
                      - ROUND(dbo.QueryMiddleOUTPriceByContr.realoutprice, 3) AS Price, dbo.QueryINOUTByContr.Parent, dbo.QueryINOUTByContr.Parent2, 
                      dbo.QueryINOUTByContr.Parent3, dbo.QueryINOUTByContr.Parent4, dbo.QueryINOUTByContr.Parent5, 
                      dbo.QueryMiddleOUTPriceByContr.realoutprice
FROM         dbo.QueryINOUTByContr LEFT OUTER JOIN
                      dbo.QueryMiddleINPriceByContr ON dbo.QueryINOUTByContr.GoodsID = dbo.QueryMiddleINPriceByContr.GoodsID LEFT OUTER JOIN
                      dbo.QueryMiddleOUTPriceByContr ON dbo.QueryINOUTByContr.GoodsID = dbo.QueryMiddleOUTPriceByContr.GoodsID
GO
