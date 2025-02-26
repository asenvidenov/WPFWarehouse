USE [ambc]
GO
/****** Object:  View [dbo].[VIEWDayLimitsFromTo]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEWDayLimitsFromTo]
AS
SELECT TOP 100 PERCENT dbo.CardHolders.HolderNum, 
    dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, 
    dbo.CardDayLimit.LimitDate, dbo.CardDayLimit.Limit, 
    dbo.Diets.DietDescription, dbo.CardDayLimit.LimitUse, 
    dbo.CardDayLimit.LimitUsed, 
    dbo.CardDayLimit.LimitEnabled
FROM dbo.CardHolders INNER JOIN
    dbo.CardDayLimit ON 
    dbo.CardHolders.HolderID = dbo.CardDayLimit.HolderID INNER JOIN
    dbo.Diets ON 
    dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
    dbo.Period ON 
    dbo.CardDayLimit.LimitDate >= dbo.Period.DateFrom AND 
    dbo.CardDayLimit.LimitDate <= dbo.Period.Dateto
ORDER BY dbo.CardDayLimit.LimitDate

GO
