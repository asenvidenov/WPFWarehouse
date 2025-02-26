USE [ambc]
GO
/****** Object:  View [dbo].[QueryDocWareIN]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryDocWareIN]
AS
SELECT dbo.WarehouseIN.INID AS BufferID, 
    dbo.WarehouseIN.GoodsID, dbo.Goods.Description, 
    dbo.WarehouseIN.InDate, dbo.WarehouseIN.InPrice, 
    dbo.WarehouseIN.DocID, dbo.WarehouseIN.Quantity, 
    dbo.WarehouseIN.HiddenPercent, dbo.WarehouseIN.ContrID, 
    dbo.WarehouseIN.InPrice * dbo.WarehouseIN.QuantityDoc AS SumAll,
     dbo.Goods.Measure, dbo.WarehouseIN.QuantityDoc, 
    dbo.WarehouseIN.ExpDate, dbo.WarehouseIN.Active
FROM dbo.Goods INNER JOIN
    dbo.WarehouseIN ON 
    dbo.Goods.GoodsID = dbo.WarehouseIN.GoodsID

GO
