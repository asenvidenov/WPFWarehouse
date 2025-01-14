USE [ambc]
GO
/****** Object:  View [dbo].[VViewLimitsNotUsed]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VViewLimitsNotUsed]
AS
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum, ISNULL(dbo.CardHolders.HolderNum, N'') + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
                      + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, DATEPART(month, dbo.CardLimit.LimitIN) AS LimitM, DATEPART(year, 
                      dbo.CardLimit.LimitIN) AS LimitY, dbo.CardLimit.LimitAll, dbo.CardLimit.LimitUse, dbo.CardLimit.LimitUsed, dbo.CardLimit.ValidFrom, 
                      dbo.CardLimit.ValidTo, dbo.CardLimit.LimitEnabled, dbo.Contragents.ContrName
FROM         dbo.CardLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.Period ON dbo.CardLimit.ValidTo <= dbo.Period.Dateto
WHERE     (dbo.CardLimit.LimitUse < dbo.CardLimit.LimitAll) AND (dbo.CardLimit.LimitUsed = 0)
ORDER BY ISNULL(dbo.CardHolders.HolderNum, N'') + ISNULL(dbo.CardHolders.HolderMiddle, N'') + ISNULL(dbo.CardHolders.HolderLast, N'')
GO
