USE [ambc]
GO
/****** Object:  View [dbo].[QueryBillIN]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryBillIN]
AS
SELECT     TOP 100 PERCENT dbo.Documents.DocDate, dbo.Documents.DocID, dbo.DocuType.WIN, dbo.DocuType.WOUT, dbo.Documents.[Sum], 
                      dbo.Documents.VAT, dbo.Documents.SumVAT, SUM(dbo.WarehouseIN.Quantity * dbo.WarehouseIN.InPrice) AS [Real], 
                      SUM(dbo.WarehouseIN.QuantityDoc * dbo.WarehouseIN.InPrice) AS Doc
FROM         dbo.Period CROSS JOIN
                      dbo.Documents INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID INNER JOIN
                      dbo.WarehouseIN ON dbo.Documents.DocID = dbo.WarehouseIN.DocID
GROUP BY dbo.Documents.DocDate, dbo.Documents.DocID, dbo.DocuType.WIN, dbo.DocuType.WOUT, dbo.Documents.[Sum], dbo.Documents.VAT, 
                      dbo.Documents.SumVAT
HAVING      (dbo.Documents.DocDate >= MAX(dbo.Period.DateFrom)) AND (dbo.Documents.DocDate <= MAX(dbo.Period.Dateto)) AND (dbo.DocuType.WIN = - 1) AND
                       (dbo.DocuType.WOUT = 0)
ORDER BY dbo.Documents.DocDate

GO
