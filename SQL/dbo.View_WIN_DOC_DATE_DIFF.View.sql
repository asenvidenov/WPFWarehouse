USE [ambc]
GO
/****** Object:  View [dbo].[View_WIN_DOC_DATE_DIFF]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_WIN_DOC_DATE_DIFF]
AS
SELECT     dbo.DocuType.Type, dbo.Documents.TypeNumber, dbo.Documents.DocDate, dbo.WarehouseIN.InDate
FROM         dbo.DocuType INNER JOIN
                      dbo.Documents ON dbo.DocuType.DocuTypeID = dbo.Documents.DocuType INNER JOIN
                      dbo.WarehouseIN ON dbo.Documents.DocID = dbo.WarehouseIN.DocID AND dbo.Documents.DocDate <> dbo.WarehouseIN.InDate

GO
