USE [ambc]
GO
/****** Object:  View [dbo].[ViewLimitsUseFromTo]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewLimitsUseFromTo]
AS
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, dbo.CardLimitUse.UseTime, 
                      dbo.CardLimitUse.LimitUse, dbo.CardLimit.LimitAll, dbo.CardLimit.LimitIN, dbo.CardLimit.ValidFrom, dbo.CardLimit.ValidTo
FROM         dbo.CardHolders INNER JOIN
                      dbo.CardLimitUse ON dbo.CardHolders.HolderID = dbo.CardLimitUse.HolderID INNER JOIN
                      dbo.CardLimit ON dbo.CardLimitUse.LimitID = dbo.CardLimit.LimitID INNER JOIN
                      dbo.Period ON dbo.CardLimitUse.UseTime >= dbo.Period.DateFrom AND dbo.CardLimitUse.UseTime < dbo.Period.Dateto
ORDER BY dbo.CardLimitUse.UseTime

GO
