USE [ambc]
GO
/****** Object:  View [dbo].[VIEWDayLimitEnabled]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEWDayLimitEnabled]
AS
SELECT     dbo.CardHolders.HolderID, dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.CardHolders.HolderLast, dbo.Cards.CardSerial, 
                      dbo.CardDayLimit.LimitEnabled, dbo.CardDayLimit.LimitDate, dbo.CardHolders.CardID, dbo.CardDayLimit.DietID, dbo.CardHolders.ContrID, 
                      dbo.CardDayLimit.LimitUsed, dbo.CardDayLimit.LimitDayID, dbo.CardDayLimit.Limit, dbo.CardDayLimit.LimitUse
FROM         dbo.CardDayLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardDayLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Cards ON dbo.CardHolders.CardID = dbo.Cards.CardID
WHERE     (dbo.CardDayLimit.LimitDate < GETDATE()) AND (dbo.CardDayLimit.LimitUsed = 0) AND (dbo.CardDayLimit.LimitEnabled > 0) AND 
                      (dbo.CardDayLimit.Limit > dbo.CardDayLimit.LimitUse)

GO
