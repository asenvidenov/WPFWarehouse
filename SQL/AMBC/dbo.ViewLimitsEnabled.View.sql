USE [ambc]
GO
/****** Object:  View [dbo].[ViewLimitsEnabled]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewLimitsEnabled]
AS
SELECT dbo.CardHolders.HolderID, dbo.CardHolders.HolderNum, 
    dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, 
    dbo.CardHolders.CardID, 
    SUM(dbo.VIEWLimitEnabledDetails.LimitAll) AS LimitAll, 
    SUM(dbo.VIEWLimitEnabledDetails.LimitUse) AS LimitUse, 
    dbo.Contragents.ContrName
FROM dbo.CardHolders INNER JOIN
    dbo.VIEWLimitEnabledDetails ON 
    dbo.CardHolders.HolderID = dbo.VIEWLimitEnabledDetails.HolderID
     INNER JOIN
    dbo.Contragents ON 
    dbo.CardHolders.ContrID = dbo.Contragents.ContrID
GROUP BY dbo.CardHolders.HolderID, 
    dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, 
    dbo.CardHolders.HolderLast, dbo.CardHolders.CardID, 
    dbo.Contragents.ContrName
GO
