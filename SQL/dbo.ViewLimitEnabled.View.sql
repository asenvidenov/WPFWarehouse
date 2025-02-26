USE [ambc]
GO
/****** Object:  View [dbo].[ViewLimitEnabled]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewLimitEnabled]
AS
SELECT     dbo.CardHolders.HolderID, dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, dbo.CardHolders.ContrID, 
                      dbo.CardHolders.CardID, SUM(dbo.VIEWLimitEnabledDetails.LimitAll) AS LimitAll, SUM(dbo.VIEWLimitEnabledDetails.LimitUse) AS LimitUse
FROM         dbo.CardHolders INNER JOIN
                      dbo.VIEWLimitEnabledDetails ON dbo.CardHolders.HolderID = dbo.VIEWLimitEnabledDetails.HolderID
GROUP BY dbo.CardHolders.HolderID, dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, dbo.CardHolders.ContrID, 
                      dbo.CardHolders.CardID
GO
