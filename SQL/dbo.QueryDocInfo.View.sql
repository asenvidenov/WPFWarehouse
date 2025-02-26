USE [ambc]
GO
/****** Object:  View [dbo].[QueryDocInfo]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryDocInfo]
AS
SELECT     dbo.Documents.DocID, dbo.Documents.Number, dbo.DocuType.Type, dbo.Documents.TypeNumber, dbo.Documents.DocDate, 
                      dbo.Contragents.ContrName, Contragents_1.ContrName AS Expr1, dbo.Documents.ExtraInfo
FROM         dbo.Contragents INNER JOIN
                      dbo.DocuType INNER JOIN
                      dbo.Documents ON dbo.DocuType.DocuTypeID = dbo.Documents.DocuType ON dbo.Contragents.ContrID = dbo.Documents.ContrID INNER JOIN
                      dbo.Contragents Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID

GO
