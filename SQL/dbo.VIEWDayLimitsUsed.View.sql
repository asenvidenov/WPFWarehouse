USE [ambc]
GO
/****** Object:  View [dbo].[VIEWDayLimitsUsed]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEWDayLimitsUsed]
AS
SELECT TOP 100 PERCENT dbo.CardHolders.HolderNum, 
    dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, 
    dbo.CardDayLimitUse.LimitUse, 
    dbo.CardDayLimitUse.UseTime, dbo.Diets.DietDescription, 
    dbo.CardDayLimit.LimitDate
FROM dbo.CardHolders INNER JOIN
    dbo.CardDayLimitUse ON 
    dbo.CardHolders.HolderID = dbo.CardDayLimitUse.HolderID INNER
     JOIN
    dbo.CardDayLimit ON 
    dbo.CardDayLimitUse.LimitDayID = dbo.CardDayLimit.LimitDayID
     INNER JOIN
    dbo.Diets ON 
    dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
    dbo.Period ON 
    dbo.CardDayLimitUse.UseTime >= dbo.Period.DateFrom AND 
    dbo.CardDayLimitUse.UseTime <= dbo.Period.Dateto
ORDER BY dbo.CardDayLimitUse.UseTime

GO
