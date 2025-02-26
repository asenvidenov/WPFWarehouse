USE [ambc]
GO
/****** Object:  View [dbo].[QueryINByContrGrouped]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryINByContrGrouped]
AS
SELECT     dbo.QueryWarehouseIN.GoodsID, SUM(dbo.QueryWarehouseIN.[Real]) AS SumOfReal, SUM(dbo.QueryWarehouseIN.QuantityDoc) 
                      AS SumOfQuantityDoc, dbo.QueryWarehouseIN.ContrID, dbo.QueryWarehouseIN.InPrice, 
                      dbo.QueryWarehouseIN.InPrice * dbo.QueryWarehouseIN.[Real] AS inValue
FROM         dbo.QueryWarehouseIN CROSS JOIN
                      dbo.Period
GROUP BY dbo.QueryWarehouseIN.GoodsID, dbo.QueryWarehouseIN.ContrID, dbo.QueryWarehouseIN.InPrice, 
                      dbo.QueryWarehouseIN.InPrice * dbo.QueryWarehouseIN.[Real]
HAVING      (dbo.QueryWarehouseIN.ContrID = MAX(dbo.Period.ContrID))
GO
