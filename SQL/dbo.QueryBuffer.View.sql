USE [ambc]
GO
/****** Object:  View [dbo].[QueryBuffer]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryBuffer]
AS
SELECT     dbo.Buffer.BufferID, dbo.Buffer.GoodsID, dbo.Buffer.InDate, dbo.Buffer.InPrice, dbo.Buffer.DocID, dbo.Buffer.Quantity, dbo.Buffer.HiddenPercent, 
                      dbo.DocuType.WIN, dbo.DocuType.WOUT, dbo.DocuType.Money, dbo.Documents.ContrID, dbo.Documents.Contragent, 
                      dbo.Buffer.Quantity - dbo.Buffer.Quantity * dbo.Buffer.HiddenPercent / 100 AS [Real], dbo.Buffer.ExpDate
FROM         dbo.DocuType INNER JOIN
                      dbo.Buffer INNER JOIN
                      dbo.Documents ON dbo.Buffer.DocID = dbo.Documents.DocID ON dbo.DocuType.DocuTypeID = dbo.Documents.DocuType
GO
