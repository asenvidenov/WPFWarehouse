USE [ambc]
GO
/****** Object:  View [dbo].[QueryOUT]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryOUT]
AS
SELECT     GoodsID, SUM([Real]) AS SumOfReal, SUM(QuantityPercent) AS RealPercent
FROM         dbo.QueryWarehouseOUT
GROUP BY GoodsID


GO
