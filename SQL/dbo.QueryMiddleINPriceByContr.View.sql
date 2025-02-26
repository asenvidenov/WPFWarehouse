USE [ambc]
GO
/****** Object:  View [dbo].[QueryMiddleINPriceByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryMiddleINPriceByContr]
AS
SELECT dbo.QueryStockIn.GoodsID, 
    ISNULL(SUM(dbo.QueryStockIn.InPrice * dbo.QueryStockIn.Quantity),
     0) AS realinprice, 
    ISNULL(SUM(dbo.QueryStockIn.InPrice * dbo.QueryStockIn.QuantityDoc),
     0) AS docinprice, dbo.QueryStockIn.ToContr
FROM dbo.QueryStockIn, dbo.Period
GROUP BY dbo.QueryStockIn.GoodsID, 
    dbo.QueryStockIn.ToContr
HAVING (dbo.QueryStockIn.ToContr = MAX(dbo.Period.ContrID))
GO
