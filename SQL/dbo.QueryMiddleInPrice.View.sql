USE [ambc]
GO
/****** Object:  View [dbo].[QueryMiddleInPrice]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryMiddleInPrice]
AS
SELECT     GoodsID, ISNULL(SUM(InPrice * Quantity), 0) AS realinprice, ISNULL(SUM(InPrice * QuantityDoc), 0) AS docinprice
FROM         dbo.QueryStockIn
GROUP BY GoodsID


GO
