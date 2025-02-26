USE [ambc]
GO
/****** Object:  View [dbo].[View_WOUT_DOC_DIFF]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_WOUT_DOC_DIFF]
AS
SELECT     dbo.DocuType.Type, dbo.Documents.TypeNumber, dbo.Documents.DocDate, dbo.WarehouseOUT.OutDate
FROM         dbo.Documents INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID INNER JOIN
                      dbo.WarehouseOUT ON dbo.Documents.DocID = dbo.WarehouseOUT.DocID AND dbo.Documents.DocDate <> dbo.WarehouseOUT.OutDate

GO
