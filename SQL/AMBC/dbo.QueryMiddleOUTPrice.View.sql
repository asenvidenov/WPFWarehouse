USE [ambc]
GO
/****** Object:  View [dbo].[QueryMiddleOUTPrice]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryMiddleOUTPrice]
AS
SELECT     GoodsID, ISNULL(SUM(OutPrice * [Real]), 0) AS realoutprice, ISNULL(SUM(OutPrice * QuantityPercent), 0) AS docoutprice, ISNULL(SUM([Real]), 0) 
                      AS SumOfQuantity, ISNULL(SUM(QuantityPercent), 0) AS SumOfQuantityPercent
FROM         dbo.QueryWarehouseOUT
GROUP BY GoodsID


GO
