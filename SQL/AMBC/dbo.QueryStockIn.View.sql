USE [ambc]
GO
/****** Object:  View [dbo].[QueryStockIn]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryStockIn]
AS
SELECT TOP 100 PERCENT dbo.Documents.DocDate, 
    dbo.Contragents.Code, dbo.Contragents.ContrName, 
    dbo.DocuType.Type, dbo.Documents.TypeNumber, 
    dbo.Goods.Code AS GCode, dbo.Goods.Description, 
    dbo.measure.Measure, dbo.WarehouseIN.InPrice, 
    dbo.Documents.[Sum], dbo.Documents.VAT, 
    dbo.Documents.SumVAT, dbo.Period.InDate, 
    dbo.Period.OutDate, dbo.WarehouseIN.Quantity, 
    dbo.WarehouseIN.HiddenPercent, 
    dbo.WarehouseIN.QuantityDoc, dbo.Contragents.ContrID, 
    dbo.Period.DateFrom, dbo.Period.Dateto, 
    dbo.Documents.DocID, dbo.Goods.GoodsID, 
    dbo.Documents.Contragent AS ToContr, 
    ROUND(dbo.WarehouseIN.InPrice * dbo.WarehouseIN.Quantity, 
    3) AS EndPrice, 
    ROUND(dbo.WarehouseIN.InPrice * dbo.WarehouseIN.Quantity *
     0.2, 3) AS EndPriceVAT, 
    ROUND(dbo.WarehouseIN.InPrice * dbo.WarehouseIN.Quantity, 
    3) 
    + ROUND(dbo.WarehouseIN.InPrice * dbo.WarehouseIN.Quantity
     * 0.2, 3) AS EndPriceAll
FROM dbo.Period INNER JOIN
    dbo.WarehouseIN INNER JOIN
    dbo.Goods ON 
    dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID INNER JOIN
    dbo.Documents ON 
    dbo.WarehouseIN.DocID = dbo.Documents.DocID INNER JOIN
    dbo.DocuType ON 
    dbo.Documents.DocuType = dbo.DocuType.DocuTypeID INNER JOIN
    dbo.Contragents ON 
    dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
    dbo.measure ON 
    dbo.Goods.Measure = dbo.measure.MeasureID ON 
    dbo.Period.InDate <= dbo.Documents.DocDate AND 
    dbo.Period.OutDate >= dbo.Documents.DocDate
GO
