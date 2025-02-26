USE [ambc]
GO
/****** Object:  View [dbo].[QViewLimitsUseByPeriodDetailByDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QViewLimitsUseByPeriodDetailByDate]
AS
SELECT dbo.Contragents.ContrName, dbo.CardHolders.HolderNum, 
    dbo.CardHolders.HolderName, dbo.CardHolders.HolderMiddle, 
    dbo.CardHolders.HolderLast, DATEPART(month, 
    dbo.CardLimit.LimitIN) AS MONTH, dbo.CardLimitUse.UseTime, 
    dbo.CardLimitUse.LimitUse
FROM dbo.CardLimitUse INNER JOIN
    dbo.CardLimit ON 
    dbo.CardLimitUse.LimitID = dbo.CardLimit.LimitID INNER JOIN
    dbo.Contragents INNER JOIN
    dbo.CardHolders ON 
    dbo.Contragents.ContrID = dbo.CardHolders.ContrID ON 
    dbo.CardLimitUse.HolderID = dbo.CardHolders.HolderID, 
    dbo.Period
WHERE (dbo.CardLimitUse.UseTime >= dbo.Period.Dateto AND 
    dbo.CardLimitUse.UseTime <= dbo.Period.Dateto + 1)
GO
