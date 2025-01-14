USE [ambc]
GO
/****** Object:  View [dbo].[QueryMiddleOUTPriceByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryMiddleOUTPriceByContr]
AS
SELECT     dbo.QueryWarehouseOUT.GoodsID, ISNULL(SUM(dbo.QueryWarehouseOUT.OutPrice * dbo.QueryWarehouseOUT.[Real]), 0) AS realoutprice, 
                      ISNULL(SUM(dbo.QueryWarehouseOUT.OutPrice * dbo.QueryWarehouseOUT.QuantityPercent), 0) AS docoutprice, 
                      ISNULL(SUM(dbo.QueryWarehouseOUT.[Real]), 0) AS SumOfQuantity, ISNULL(SUM(dbo.QueryWarehouseOUT.QuantityPercent), 0) 
                      AS SumOfQuantityPercent, dbo.QueryWarehouseOUT.ContrID
FROM         dbo.QueryWarehouseOUT CROSS JOIN
                      dbo.Period
GROUP BY dbo.QueryWarehouseOUT.GoodsID, dbo.QueryWarehouseOUT.ContrID
HAVING      (dbo.QueryWarehouseOUT.ContrID = MAX(dbo.Period.ContrID))


GO
