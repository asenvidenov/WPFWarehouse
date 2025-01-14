USE [ambc]
GO
/****** Object:  View [dbo].[QueryStockByCooking]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryStockByCooking]
AS
SELECT TOP 100 PERCENT dbo.Documents.DocDate, 
    dbo.DocuType.Type, dbo.Documents.TypeNumber, 
    SUM(dbo.ReceiptDetails.Quantity / dbo.ReceiptDetails.[Count] * dbo.Cooking.[Count])
     AS [Real], 
    SUM(dbo.ReceiptDetails.Quantity * dbo.ReceiptDetails.Coeff / dbo.ReceiptDetails.[Count]
     * dbo.Cooking.[Count] - dbo.ReceiptDetails.Quantity / dbo.ReceiptDetails.[Count]
     * dbo.Cooking.[Count]) AS Diff, 
    SUM(dbo.ReceiptDetails.Quantity * dbo.ReceiptDetails.Coeff / dbo.ReceiptDetails.[Count]
     * dbo.Cooking.[Count]) AS [Percent], Goods_1.Code, 
    Goods_1.Description
FROM dbo.Period CROSS JOIN
    dbo.DocuType INNER JOIN
    dbo.Goods INNER JOIN
    dbo.Documents INNER JOIN
    dbo.Cooking ON 
    dbo.Documents.DocID = dbo.Cooking.DocID ON 
    dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
    dbo.Receipt ON 
    dbo.Goods.GoodsID = dbo.Receipt.GoodsID INNER JOIN
    dbo.ReceiptDetails ON 
    dbo.Receipt.ReceiptID = dbo.ReceiptDetails.ReceiptID ON 
    dbo.DocuType.DocuTypeID = dbo.Documents.DocuType INNER JOIN
    dbo.Goods Goods_1 ON 
    dbo.ReceiptDetails.GoodsID = Goods_1.GoodsID
GROUP BY dbo.Documents.DocDate, dbo.DocuType.Type, 
    dbo.Documents.TypeNumber, Goods_1.Code, 
    Goods_1.Description
HAVING (dbo.Documents.DocDate >= MAX(dbo.Period.InDate)) AND 
    (dbo.Documents.DocDate <= MAX(dbo.Period.OutDate))
ORDER BY dbo.Documents.DocDate

GO
