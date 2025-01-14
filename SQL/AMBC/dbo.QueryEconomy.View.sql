USE [ambc]
GO
/****** Object:  View [dbo].[QueryEconomy]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryEconomy]
AS
SELECT     SUM(HiddenPercent * Quantity / 100 * [Count] * InPrice) AS Expr1, SUM(HiddenPercent * Quantity / 100 * [Count] * Price) AS Expr2, AVG(HiddenPercent) 
                      AS AvgOfHiddenPercent
FROM         dbo.Cooking
HAVING      (AVG(HiddenPercent) > 0)

GO
