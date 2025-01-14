USE [ambc]
GO
/****** Object:  View [dbo].[QueryBufferMoreGoods]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryBufferMoreGoods]
AS
SELECT     dbo.BufferOUT.DocID, dbo.BufferOUT.GoodsID
FROM         dbo.BufferOUT INNER JOIN
                      dbo.Period ON dbo.BufferOUT.OutDate >= dbo.Period.InDate AND dbo.BufferOUT.OutDate <= dbo.Period.OutDate
GROUP BY dbo.BufferOUT.DocID, dbo.BufferOUT.GoodsID
GO
