USE [ambc]
GO
/****** Object:  View [dbo].[VIEWEditDayLimits]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWEditDayLimits]
AS
SELECT     dbo.CardHolders.HolderNum, dbo.CardDayLimit.LimitDate, dbo.CardDayLimit.LimitDateToUse, dbo.CardDayLimit.LimitUsed, 
                      dbo.CardDayLimit.LimitEnabled, dbo.CardDayLimit.Night
FROM         dbo.CardDayLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardDayLimit.HolderID = dbo.CardHolders.HolderID
GO
