USE [ambc]
GO
/****** Object:  View [dbo].[QuerySellProduct]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QuerySellProduct]
AS
SELECT     dbo.Documents.DocDate, dbo.DocuType.Type, dbo.Documents.TypeNumber, dbo.Contragents.ContrName, dbo.Documents.ExtraInfo, 
                      dbo.Documents.[Sum], dbo.Documents.VAT, dbo.Documents.SumVAT
FROM         dbo.Documents INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID

GO
