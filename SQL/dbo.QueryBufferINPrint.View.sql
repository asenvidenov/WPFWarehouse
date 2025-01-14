USE [ambc]
GO
/****** Object:  View [dbo].[QueryBufferINPrint]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryBufferINPrint]
AS
SELECT     dbo.Documents.DocID, dbo.Documents.Number, dbo.DocuType.Type, dbo.Documents.TypeNumber, dbo.Documents.DocDate, 
                      Contragents_1.ContrName, Contragents_1.ContrName AS Contragent, dbo.Buffer.GoodsID, dbo.Goods.Description, dbo.Buffer.InDate, 
                      dbo.Buffer.InPrice, dbo.Buffer.Quantity, dbo.Buffer.HiddenPercent, dbo.Buffer.InPrice * dbo.Buffer.Quantity AS SumAll, 
                      dbo.Buffer.Quantity - dbo.Buffer.Quantity * dbo.Buffer.HiddenPercent / 100 AS [Real], dbo.measure.Measure, dbo.Documents.[Sum], 
                      dbo.Documents.VAT, dbo.Documents.SumVAT, dbo.Goods.Code
FROM         dbo.measure INNER JOIN
                      dbo.DocuType INNER JOIN
                      dbo.Goods INNER JOIN
                      dbo.Buffer ON dbo.Goods.GoodsID = dbo.Buffer.GoodsID INNER JOIN
                      dbo.Documents ON dbo.Buffer.DocID = dbo.Documents.DocID ON dbo.DocuType.DocuTypeID = dbo.Documents.DocuType ON 
                      dbo.measure.MeasureID = dbo.Goods.Measure AND dbo.measure.MeasureID = dbo.Goods.Measure INNER JOIN
                      dbo.Contragents Contragents_1 ON dbo.Documents.ContrID = Contragents_1.ContrID INNER JOIN
                      dbo.Contragents Contragents_2 ON dbo.Buffer.ContrID = Contragents_2.ContrID
GO
