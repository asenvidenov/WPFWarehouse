USE [ambc]
GO
/****** Object:  View [dbo].[QueryOUTByContrGrouped]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryOUTByContrGrouped]
AS
SELECT     dbo.QueryWarehouseOUT.GoodsID, SUM(dbo.QueryWarehouseOUT.[Real]) AS SumOfReal, SUM(dbo.QueryWarehouseOUT.QuantityPercent) 
                      AS [Percent], dbo.QueryWarehouseOUT.ContrID, dbo.QueryWarehouseOUT.OutPrice, 
                      dbo.QueryWarehouseOUT.OutPrice * dbo.QueryWarehouseOUT.[Real] AS valueOUT
FROM         dbo.QueryWarehouseOUT CROSS JOIN
                      dbo.Period
GROUP BY dbo.QueryWarehouseOUT.GoodsID, dbo.QueryWarehouseOUT.ContrID, dbo.QueryWarehouseOUT.OutPrice, 
                      dbo.QueryWarehouseOUT.OutPrice * dbo.QueryWarehouseOUT.[Real]
HAVING      (dbo.QueryWarehouseOUT.ContrID = MAX(dbo.Period.ContrID)) OR
                      (dbo.QueryWarehouseOUT.ContrID = 0)
GO
