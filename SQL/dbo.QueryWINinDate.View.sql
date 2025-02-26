USE [ambc]
GO
/****** Object:  View [dbo].[QueryWINinDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryWINinDate]
AS
SELECT dbo.Goods.GoodsID, dbo.WarehouseIN.InDate, 
    dbo.WarehouseIN.InPrice, 
    dbo.WarehouseIN.Quantity AS Real, 
    dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.ContrID, 
    dbo.WarehouseIN.DocID, dbo.Period.DateFrom
FROM dbo.Period INNER JOIN
    dbo.Goods INNER JOIN
    dbo.WarehouseIN ON 
    dbo.Goods.GoodsID = dbo.WarehouseIN.GoodsID ON 
    dbo.Period.DateFrom > dbo.WarehouseIN.InDate

GO
