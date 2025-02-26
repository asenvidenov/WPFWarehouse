USE [ambc]
GO
/****** Object:  View [dbo].[QuerySellCountToDAteByGoods]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QuerySellCountToDAteByGoods]
AS
SELECT     GoodsID, SUM(SumOfCount) AS AllCount
FROM         dbo.QuerySellCountToDate
GROUP BY GoodsID
GO
