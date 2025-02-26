USE [ambc]
GO
/****** Object:  View [dbo].[VVIEWLimitByPeriod]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VVIEWLimitByPeriod]
AS
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum, ISNULL(dbo.CardHolders.HolderNum, N'') + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
                      + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, DATEPART(month, dbo.CardLimit.LimitIN) AS LimitM, DATEPART(year, 
                      dbo.CardLimit.LimitIN) AS LimitY, dbo.CardLimit.LimitAll, dbo.CardLimit.LimitUse, dbo.CardLimit.LimitUsed, dbo.CardLimit.ValidFrom, 
                      dbo.CardLimit.ValidTo, dbo.CardLimit.LimitEnabled, dbo.Contragents.ContrName
FROM         dbo.CardLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID
ORDER BY ISNULL(dbo.CardHolders.HolderNum, N'') + ISNULL(dbo.CardHolders.HolderMiddle, N'') + ISNULL(dbo.CardHolders.HolderLast, N'')
GO
