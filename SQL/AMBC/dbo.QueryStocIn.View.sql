USE [ambc]
GO
/****** Object:  View [dbo].[QueryStocIn]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryStocIn]
AS
SELECT TOP 100 PERCENT dbo.Documents.DocDate, 
    dbo.Contragents.Code, dbo.Contragents.ContrName, 
    dbo.DocuType.Type, dbo.Documents.TypeNumber, 
    dbo.Goods.Code AS Expr1, dbo.Goods.Description, 
    dbo.measure.Measure, dbo.WarehouseIN.InPrice, 
    dbo.Documents.[Sum], dbo.Documents.VAT, 
    dbo.Documents.SumVAT, dbo.Period.InDate, 
    dbo.Period.OutDate, dbo.WarehouseIN.Quantity, 
    dbo.WarehouseIN.HiddenPercent, 
    dbo.WarehouseIN.QuantityDoc, dbo.Contragents.ContrID, 
    dbo.Period.DateFrom, dbo.Period.Dateto, 
    dbo.Documents.DocID, dbo.Goods.GoodsID
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
