USE [ambc]
GO
/****** Object:  View [dbo].[VIEWDocumentsWOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEWDocumentsWOUT]
AS
SELECT     dbo.Documents.DocID, dbo.Documents.Number, dbo.Documents.DocuType, dbo.Documents.TypeNumber, dbo.Documents.DocDate, 
                      dbo.Documents.ContrID, dbo.Documents.Contragent, dbo.Documents.ExtraInfo, dbo.Documents.[Sum], dbo.Documents.VAT, dbo.Documents.SumVAT, 
                      dbo.Documents.CheckVAT, dbo.Documents.[Percent], dbo.DocuType.WOUT, dbo.DocuType.Money
FROM         dbo.Documents INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID
WHERE     (dbo.DocuType.WOUT = 1) AND (dbo.DocuType.Money = 1)

GO
