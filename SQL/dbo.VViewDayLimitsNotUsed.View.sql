USE [ambc]
GO
/****** Object:  View [dbo].[VViewDayLimitsNotUsed]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VViewDayLimitsNotUsed]
AS
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum, ISNULL(dbo.CardHolders.HolderName, N'') + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
                      + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, dbo.CardDayLimit.LimitDate, dbo.CardDayLimit.Limit, dbo.Diets.DietDescription, 
                      dbo.CardDayLimit.LimitUse, dbo.CardDayLimit.LimitUsed, dbo.CardDayLimit.LimitEnabled, dbo.Contragents.ContrName, 
                      dbo.CardDayLimit.LimitDateToUse
FROM         dbo.CardHolders INNER JOIN
                      dbo.CardDayLimit ON dbo.CardHolders.HolderID = dbo.CardDayLimit.HolderID INNER JOIN
                      dbo.Diets ON dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.Period ON dbo.CardDayLimit.LimitDateToUse <= dbo.Period.Dateto AND dbo.CardDayLimit.LimitDateToUse >= dbo.Period.DateFrom
WHERE     (dbo.CardDayLimit.LimitUse = 0) AND (dbo.CardDayLimit.LimitUsed = 0)
ORDER BY dbo.CardDayLimit.LimitDate
GO
