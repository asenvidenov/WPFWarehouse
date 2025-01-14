USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookCombineAll]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryCookCombineAll]
AS
SELECT     DocID, GoodsID, Code, Description, SUM(SumOfCount) AS SumOfSumOfCount, Price, Measure, Quantity, endprice, ContrName, 
                      SUM(endprice * SumOfCount) AS SumEndPrice
FROM         dbo.QueryCookCombine
GROUP BY DocID, GoodsID, Code, Description, Price, Measure, Quantity, endprice, ContrName
GO
