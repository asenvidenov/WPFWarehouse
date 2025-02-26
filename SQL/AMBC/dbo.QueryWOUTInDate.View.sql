USE [ambc]
GO
/****** Object:  View [dbo].[QueryWOUTInDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryWOUTInDate]
AS
SELECT     dbo.Goods.GoodsID, dbo.WarehouseOUT.OutDate, dbo.WarehouseOUT.OutPrice, 
                      dbo.WarehouseOUT.Quantity - dbo.WarehouseOUT.Quantity * dbo.WarehouseOUT.HiddenPercent / 100 AS [Real], 
                      dbo.WarehouseOUT.QuantityPercent, dbo.WarehouseOUT.ContrID, dbo.WarehouseOUT.DocID, dbo.Period.DateFrom
FROM         dbo.Period INNER JOIN
                      dbo.Goods INNER JOIN
                      dbo.WarehouseOUT ON dbo.Goods.GoodsID = dbo.WarehouseOUT.GoodsID ON dbo.Period.DateFrom > dbo.WarehouseOUT.OutDate

GO
