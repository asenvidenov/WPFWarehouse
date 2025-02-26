USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookCountToDateByGoods]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryCookCountToDateByGoods]
AS
SELECT     GoodsID, SUM(SumOfCount) AS AllCount
FROM         dbo.QueryCookCountToDate
GROUP BY GoodsID
GO
