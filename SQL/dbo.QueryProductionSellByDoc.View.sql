USE [ambc]
GO
/****** Object:  View [dbo].[QueryProductionSellByDoc]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryProductionSellByDoc]
AS
SELECT     TOP 100 PERCENT dbo.Documents.DocDate, dbo.DocuType.Type, dbo.Documents.TypeNumber, dbo.Contragents.Code, dbo.Contragents.ContrName, 
                      dbo.Documents.[Sum], dbo.Documents.VAT, dbo.Documents.SumVAT, dbo.Contragents.ContrID
FROM         dbo.Period INNER JOIN
                      dbo.QueryProductionCookByDoc INNER JOIN
                      dbo.Documents INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID INNER JOIN
                      dbo.Contragents ON dbo.Documents.Contragent = dbo.Contragents.ContrID ON dbo.QueryProductionCookByDoc.DocID = dbo.Documents.DocID ON 
                      dbo.Period.InDate <= dbo.Documents.DocDate AND dbo.Period.OutDate >= dbo.Documents.DocDate
ORDER BY dbo.Documents.DocDate

GO
