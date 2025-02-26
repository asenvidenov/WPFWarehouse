USE [ambc]
GO
/****** Object:  View [dbo].[QueryGoodsOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryGoodsOUT]
AS
SELECT     dbo.WarehouseOUT.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.measure.Measure, dbo.WarehouseOUT.DocID, dbo.Documents.DocuType,
                       dbo.Documents.Number, dbo.DocuType.Type, dbo.DocuType.Money, dbo.WarehouseOUT.OutDate, dbo.WarehouseOUT.OutPrice, 
                      dbo.WarehouseOUT.Quantity, dbo.WarehouseOUT.QuantityPercent, dbo.WarehouseOUT.HiddenPercent, dbo.WarehouseOUT.ContrID, 
                      dbo.WarehouseOUT.Quantity - dbo.WarehouseOUT.Quantity * dbo.WarehouseOUT.HiddenPercent / 100 AS [Real]
FROM         dbo.measure INNER JOIN
                      dbo.DocuType INNER JOIN
                      dbo.Documents INNER JOIN
                      dbo.Goods INNER JOIN
                      dbo.WarehouseOUT ON dbo.Goods.GoodsID = dbo.WarehouseOUT.GoodsID ON dbo.Documents.DocID = dbo.WarehouseOUT.DocID ON 
                      dbo.DocuType.DocuTypeID = dbo.Documents.DocuType ON dbo.measure.MeasureID = dbo.Goods.Measure

GO
