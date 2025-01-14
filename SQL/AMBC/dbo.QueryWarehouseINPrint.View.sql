USE [ambc]
GO
/****** Object:  View [dbo].[QueryWarehouseINPrint]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryWarehouseINPrint]
AS
SELECT     dbo.Documents.DocID, dbo.Documents.Number, dbo.DocuType.Type, dbo.Documents.TypeNumber, dbo.Documents.DocDate, 
                      dbo.Contragents.ContrName, Contragents_1.ContrName AS Expr1, dbo.Goods.Description, 
                      dbo.WarehouseIN.InPrice * dbo.WarehouseIN.QuantityDoc AS SumAll, 
                      dbo.WarehouseIN.Quantity - dbo.WarehouseIN.Quantity * dbo.WarehouseIN.HiddenPercent / 100 AS [Real], dbo.measure.Measure, 
                      dbo.Documents.[Sum], dbo.Documents.VAT, dbo.Documents.SumVAT, dbo.Goods.Code, dbo.WarehouseIN.InDate, dbo.WarehouseIN.InPrice, 
                      dbo.WarehouseIN.HiddenPercent, dbo.WarehouseIN.Quantity, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.GoodsID
FROM         dbo.Contragents INNER JOIN
                      dbo.DocuType INNER JOIN
                      dbo.Documents ON dbo.DocuType.DocuTypeID = dbo.Documents.DocuType ON dbo.Contragents.ContrID = dbo.Documents.ContrID INNER JOIN
                      dbo.Contragents Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
                      dbo.measure INNER JOIN
                      dbo.Goods ON dbo.measure.MeasureID = dbo.Goods.Measure AND dbo.measure.MeasureID = dbo.Goods.Measure INNER JOIN
                      dbo.WarehouseIN ON dbo.Goods.GoodsID = dbo.WarehouseIN.GoodsID ON dbo.Documents.DocID = dbo.WarehouseIN.DocID

GO
