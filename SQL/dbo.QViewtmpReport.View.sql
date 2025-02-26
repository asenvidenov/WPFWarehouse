USE [ambc]
GO
/****** Object:  View [dbo].[QViewtmpReport]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QViewtmpReport]
AS
SELECT     dbo.tmpCardDayLimit.DietID, dbo.tmpCardDayLimit.LimitDateToUse, dbo.tmpCardDayLimit.Night AS Expr2, 
                      COUNT(dbo.tmpCardDayLimit.LimitDateToUse) AS Expr1, dbo.Diets.DietDescription
FROM         dbo.tmpCardDayLimit INNER JOIN
                      dbo.Diets ON dbo.tmpCardDayLimit.DietID = dbo.Diets.DietID
GROUP BY dbo.tmpCardDayLimit.DietID, dbo.tmpCardDayLimit.LimitDateToUse, dbo.Diets.DietDescription, dbo.tmpCardDayLimit.Night

GO
