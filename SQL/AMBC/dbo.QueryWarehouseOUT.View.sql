USE [ambc]
GO
/****** Object:  View [dbo].[QueryWarehouseOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryWarehouseOUT]
AS
SELECT dbo.Goods.GoodsID, dbo.Goods.Code, 
    dbo.Goods.Description, dbo.WarehouseOUT.OutDate, 
    dbo.WarehouseOUT.OutPrice, dbo.WarehouseOUT.Quantity, 
    dbo.WarehouseOUT.HiddenPercent, 
    dbo.WarehouseOUT.Quantity AS Real, 
    dbo.WarehouseOUT.QuantityPercent, 
    dbo.Period.OutDate AS Expr1, dbo.WarehouseOUT.ContrID, 
    dbo.WarehouseOUT.DocID
FROM dbo.Period INNER JOIN
    dbo.Goods INNER JOIN
    dbo.WarehouseOUT ON 
    dbo.Goods.GoodsID = dbo.WarehouseOUT.GoodsID ON 
    dbo.Period.OutDate >= dbo.WarehouseOUT.OutDate
GO
