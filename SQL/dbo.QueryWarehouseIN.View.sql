USE [ambc]
GO
/****** Object:  View [dbo].[QueryWarehouseIN]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryWarehouseIN]
AS
SELECT     dbo.Goods.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.WarehouseIN.InDate, dbo.WarehouseIN.Quantity, 
                      dbo.WarehouseIN.HiddenPercent, dbo.WarehouseIN.InPrice, dbo.WarehouseIN.Quantity AS [Real], dbo.Period.OutDate, 
                      dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.ContrID, dbo.WarehouseIN.DocID, 
                      dbo.WarehouseIN.QuantityDoc * dbo.WarehouseIN.InPrice AS SumAll
FROM         dbo.Period INNER JOIN
                      dbo.Goods INNER JOIN
                      dbo.WarehouseIN ON dbo.Goods.GoodsID = dbo.WarehouseIN.GoodsID ON dbo.Period.OutDate >= dbo.WarehouseIN.InDate

GO
