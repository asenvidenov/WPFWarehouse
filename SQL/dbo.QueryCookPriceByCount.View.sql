USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookPriceByCount]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookPriceByCount]
AS
SELECT     DocID, DietID, SUM(Price) AS SumOfPrice, SUM(Price * [Count] * Quantity) AS priceAll, [Count], SUM(Price * [Count] * Quantity) 
                      / [Count] AS RealPrice
FROM         dbo.Cooking
GROUP BY DocID, DietID, [Count]

GO
