USE [ambc]
GO
/****** Object:  View [dbo].[viewdaylimitsusedbyperiod]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewdaylimitsusedbyperiod]
AS
SELECT     dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, dbo.CardDayLimit.LimitDate, 
                      dbo.CardDayLimit.LimitDateToUse, dbo.Diets.DietDescription, dbo.CardDayLimit.Limit, dbo.CardDayLimit.LimitUse, dbo.CardDayLimit.LimitUsed, 
                      dbo.CardDayLimit.LimitEnabled, dbo.CardDayLimitUse.LimitUse AS LimitDayUse, dbo.CardDayLimitUse.UseTime
FROM         dbo.CardDayLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardDayLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Diets ON dbo.CardDayLimit.DietID = dbo.Diets.DietID LEFT OUTER JOIN
                      dbo.CardDayLimitUse ON dbo.CardDayLimit.LimitDayID = dbo.CardDayLimitUse.LimitDayID CROSS JOIN
                      dbo.Period
WHERE     (dbo.CardDayLimitUse.UseTime > dbo.Period.DateFrom AND dbo.CardDayLimitUse.UseTime <= dbo.Period.Dateto)

GO
