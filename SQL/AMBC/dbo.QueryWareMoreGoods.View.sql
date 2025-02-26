USE [ambc]
GO
/****** Object:  View [dbo].[QueryWareMoreGoods]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryWareMoreGoods]
AS
SELECT     GoodsID, OutDate, DocID, SUM(Quantity) AS Q, SUM(QuantityPercent) AS QP, ContrID
FROM         dbo.WarehouseOUT
GROUP BY GoodsID, OutDate, DocID, ContrID

GO
