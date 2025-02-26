USE [ambc]
GO
/****** Object:  View [dbo].[QueryOkladDiff]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryOkladDiff]
AS
SELECT     dbo.QueryOkladDetails.DietNum, dbo.QueryOkladDetails.ContrName, dbo.QueryOkladDetails.Price AS PR, AVG(dbo.QueryOkladDetails.CookPrice) 
                      AS AvgOfCookPrice, SUM(dbo.QueryOkladDetails.MaxOfCount) AS SumOfMaxOfCount, 
                      (dbo.QueryOkladDetails.Price - AVG(dbo.QueryOkladDetails.CookPrice)) * SUM(dbo.QueryOkladDetails.MaxOfCount) AS Diff, 
                      dbo.QueryOkladAdd.CookPrice
FROM         dbo.QueryOkladDetails LEFT OUTER JOIN
                      dbo.QueryOkladAdd ON dbo.QueryOkladDetails.DietNum = dbo.QueryOkladAdd.DietNum AND 
                      dbo.QueryOkladDetails.ContrName = dbo.QueryOkladAdd.ContrName
GROUP BY dbo.QueryOkladDetails.DietNum, dbo.QueryOkladDetails.ContrName, dbo.QueryOkladDetails.Price, dbo.QueryOkladAdd.CookPrice

GO
