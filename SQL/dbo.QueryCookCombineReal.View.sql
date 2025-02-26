USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookCombineReal]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookCombineReal]
AS
SELECT     DocID, GoodsID, Code, Description, SUM(SumOfCount) AS SumOfSumOfCount, Measure, RealPrice, SUM(RealQuantity) AS SumOfRealQuantity, 
                      SUM(RealEndPrice) AS SumOfRealEndPrice, ContrName
FROM         dbo.QueryCookCombine
GROUP BY DocID, GoodsID, Code, Description, Measure, RealPrice, ContrName
HAVING      (SUM(RealQuantity) > 0)

GO
