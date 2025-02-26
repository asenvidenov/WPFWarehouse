USE [ambc]
GO
/****** Object:  View [dbo].[QueryBufferOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryBufferOUT]
AS
SELECT     dbo.BufferOUT.OUTID, dbo.BufferOUT.GoodsID, dbo.BufferOUT.ParentID, dbo.BufferOUT.OutDate, dbo.BufferOUT.OutPrice, dbo.BufferOUT.DocID, 
                      dbo.BufferOUT.[Count], dbo.BufferOUT.Quantity, dbo.BufferOUT.QuantityPercent, dbo.BufferOUT.HiddenPercent, dbo.BufferOUT.ContrID, 
                      dbo.BufferOUT.FoodID, dbo.DocuType.WOUT
FROM         dbo.DocuType INNER JOIN
                      dbo.BufferOUT INNER JOIN
                      dbo.Documents ON dbo.BufferOUT.DocID = dbo.Documents.DocID ON dbo.DocuType.DocuTypeID = dbo.Documents.DocuType
WHERE     (dbo.DocuType.WOUT = - 1)

GO
