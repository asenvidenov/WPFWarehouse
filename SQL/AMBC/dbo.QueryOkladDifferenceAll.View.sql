USE [ambc]
GO
/****** Object:  View [dbo].[QueryOkladDifferenceAll]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryOkladDifferenceAll]
AS
SELECT     DietNum, ContrName, PR AS price, AvgOfCookPrice, SumOfMaxOfCount, Diff, CookPrice
FROM         dbo.QueryOkladDiff

GO
