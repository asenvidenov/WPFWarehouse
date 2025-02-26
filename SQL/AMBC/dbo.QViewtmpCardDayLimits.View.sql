USE [ambc]
GO
/****** Object:  View [dbo].[QViewtmpCardDayLimits]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QViewtmpCardDayLimits]
AS
SELECT     dbo.Contragents.ContrName, dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.Diets.DietDescription, 
                      dbo.tmpCardDayLimit.LimitDateToUse, dbo.tmpCardDayLimit.LimitDate, dbo.tmpCardDayLimit.Night, dbo.Diets.DietValue, dbo.Contragents.ContrID, 
                      dbo.tmpCardDayLimit.HolderID, dbo.tmpCardDayLimit.DietID
FROM         dbo.Diets INNER JOIN
                      dbo.tmpCardDayLimit ON dbo.Diets.DietID = dbo.tmpCardDayLimit.DietID INNER JOIN
                      dbo.Contragents INNER JOIN
                      dbo.CardHolders ON dbo.Contragents.ContrID = dbo.CardHolders.ContrID ON dbo.tmpCardDayLimit.HolderID = dbo.CardHolders.HolderID

GO
