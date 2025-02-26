USE [ambc]
GO
/****** Object:  View [dbo].[VIEWLimitEnabledDetails]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWLimitEnabledDetails]
AS
SELECT     TOP 100 PERCENT dbo.CardLimit.LimitID, dbo.CardLimit.HolderID, dbo.CardLimit.LimitIN, dbo.CardLimit.LimitOUT, dbo.CardLimit.LimitAll, 
                      dbo.CardLimit.LimitUse, dbo.CardLimit.LimitUsed, dbo.CardLimit.ValidFrom, dbo.CardLimit.ValidTo, dbo.CardLimit.LimitEnabled
FROM         dbo.CardLimit INNER JOIN
                      dbo.Period ON dbo.CardLimit.ValidTo > dbo.Period.InDate AND dbo.CardLimit.ValidFrom < dbo.Period.OutDate
WHERE     (dbo.CardLimit.LimitEnabled = 1) AND (dbo.CardLimit.LimitAll > ISNULL(dbo.CardLimit.LimitUse, 0)) AND (dbo.CardLimit.LimitUsed = 0)
ORDER BY dbo.CardLimit.ValidFrom
GO
