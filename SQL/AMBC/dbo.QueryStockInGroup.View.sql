USE [ambc]
GO
/****** Object:  View [dbo].[QueryStockInGroup]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryStockInGroup]
AS
SELECT TOP 100 PERCENT dbo.Documents.DocDate, 
    dbo.Contragents.Code, dbo.Contragents.ContrName, 
    dbo.DocuType.Type, dbo.Documents.TypeNumber, 
    SUM((dbo.WarehouseIN.Quantity - dbo.WarehouseIN.Quantity * dbo.WarehouseIN.HiddenPercent
     / 100) * dbo.WarehouseIN.InPrice) AS SumReal, 
    SUM((dbo.WarehouseIN.Quantity - dbo.WarehouseIN.Quantity * dbo.WarehouseIN.HiddenPercent
     / 100) * dbo.WarehouseIN.InPrice * 0.2) AS VATReal, 
    SUM((dbo.WarehouseIN.Quantity - dbo.WarehouseIN.Quantity * dbo.WarehouseIN.HiddenPercent
     / 100) 
    * dbo.WarehouseIN.InPrice + (dbo.WarehouseIN.Quantity - dbo.WarehouseIN.Quantity
     * dbo.WarehouseIN.HiddenPercent / 100) 
    * dbo.WarehouseIN.InPrice * 0.2) AS SumVATReal, 
    dbo.Period.InDate, SUM(dbo.WarehouseIN.QuantityDoc) 
    AS SumOfQuantityDoc, dbo.Contragents.ContrID, 
    dbo.Documents.DocID, dbo.Documents.[Sum], 
    dbo.Documents.SumVAT, dbo.Documents.VAT
FROM dbo.Period CROSS JOIN
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
    dbo.Goods.Measure = dbo.measure.MeasureID
GROUP BY dbo.Documents.DocDate, dbo.Contragents.Code, 
    dbo.Contragents.ContrName, dbo.DocuType.Type, 
    dbo.Documents.TypeNumber, dbo.Period.InDate, 
    dbo.Contragents.ContrID, dbo.Documents.DocID, 
    dbo.Documents.[Sum], dbo.Documents.SumVAT, 
    dbo.Documents.VAT
HAVING (dbo.Documents.DocDate >= MAX(dbo.Period.InDate)) AND 
    (dbo.Documents.DocDate <= MAX(dbo.Period.OutDate))
ORDER BY dbo.Documents.DocDate
GO
