USE [ambc]
GO
/****** Object:  View [dbo].[QueryStockCard]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryStockCard]
AS
SELECT TOP 100 PERCENT dbo.Documents.DocDate, 
    dbo.DocuType.Type, dbo.Documents.TypeNumber, 
    dbo.tblStockCard.StockIN, dbo.tblStockCard.StockINDoc, 
    dbo.tblStockCard.INPrice, dbo.tblStockCard.StockOUT, 
    dbo.tblStockCard.StockOUTDoc, dbo.tblStockCard.OUTPrice, 
    dbo.tblStockCard.StockOUTDoc * dbo.tblStockCard.OUTPrice AS DocValue,
     dbo.tblStockCard.OUTPrice * dbo.tblStockCard.StockOUT AS RealValue,
     dbo.tblStockCard.StockIN * dbo.tblStockCard.INPrice AS realinvalue,
     dbo.tblStockCard.StockINDoc * dbo.tblStockCard.INPrice AS DocInValue
FROM dbo.tblStockCard INNER JOIN
    dbo.Documents ON 
    dbo.tblStockCard.DocID = dbo.Documents.DocID INNER JOIN
    dbo.DocuType ON 
    dbo.Documents.DocuType = dbo.DocuType.DocuTypeID
ORDER BY dbo.Documents.DocDate
GO
