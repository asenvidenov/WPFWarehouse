USE [ambc]
GO
/****** Object:  View [dbo].[QueryBufferIN]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryBufferIN]
AS
SELECT     dbo.Buffer.BufferID, dbo.Buffer.GoodsID, dbo.Goods.Description, dbo.Buffer.InDate, dbo.Buffer.InPrice, dbo.Buffer.DocID, dbo.Buffer.Quantity, 
                      dbo.Buffer.HiddenPercent, dbo.Buffer.ContrID, ROUND(dbo.Buffer.InPrice * dbo.Buffer.Quantity, 3) AS SumAll, 
                      dbo.Buffer.Quantity - dbo.Buffer.Quantity * dbo.Buffer.HiddenPercent / 100 AS [Real], dbo.Goods.Measure, dbo.Buffer.ExpDate
FROM         dbo.Goods INNER JOIN
                      dbo.Buffer ON dbo.Goods.GoodsID = dbo.Buffer.GoodsID
GO
