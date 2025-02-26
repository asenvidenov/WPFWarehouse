USE [ambc]
GO
/****** Object:  View [dbo].[QueryBillStockEcon]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryBillStockEcon]
AS
SELECT     dbo.Documents.DocID, dbo.DocuType.WIN, dbo.DocuType.WOUT, dbo.Documents.[Sum], dbo.Documents.VAT, dbo.Documents.SumVAT, 
                      dbo.Documents.DocDate
FROM         dbo.Period INNER JOIN
                      dbo.Documents INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID ON dbo.Period.DateFrom <= dbo.Documents.DocDate AND 
                      dbo.Period.Dateto >= dbo.Documents.DocDate
WHERE     (dbo.Documents.DocID = 9) AND (dbo.DocuType.WIN = - 1) AND (dbo.DocuType.WOUT = 0)

GO
