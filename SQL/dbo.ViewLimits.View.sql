USE [ambc]
GO
/****** Object:  View [dbo].[ViewLimits]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewLimits]
AS
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, dbo.CardLimit.LimitAll, 
                      dbo.CardLimit.LimitUse, dbo.CardLimit.LimitIN, dbo.CardLimit.ValidFrom, dbo.CardLimit.ValidTo, dbo.Contragents.ContrID, 
                      Contragents_1.ContrID AS ContrID2, Contragents_2.ContrID AS ContrID3, Contragents_3.ContrID AS ContrID4, Contragents_4.ContrID AS ContrID5
FROM         dbo.CardHolders INNER JOIN
                      dbo.CardLimit ON dbo.CardHolders.HolderID = dbo.CardLimit.HolderID INNER JOIN
                      dbo.Period ON dbo.CardLimit.ValidTo > dbo.Period.DateFrom - 1 AND dbo.CardLimit.ValidFrom < dbo.Period.Dateto + 1 LEFT OUTER JOIN
                      dbo.Contragents Contragents_1 LEFT OUTER JOIN
                      dbo.Contragents Contragents_3 LEFT OUTER JOIN
                      dbo.Contragents Contragents_4 ON Contragents_3.Parent = Contragents_4.ContrID RIGHT OUTER JOIN
                      dbo.Contragents Contragents_2 ON Contragents_3.ContrID = Contragents_2.Parent ON 
                      Contragents_1.Parent = Contragents_2.ContrID RIGHT OUTER JOIN
                      dbo.Contragents ON Contragents_1.ContrID = dbo.Contragents.Parent ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID
ORDER BY dbo.CardLimit.LimitIN
GO
