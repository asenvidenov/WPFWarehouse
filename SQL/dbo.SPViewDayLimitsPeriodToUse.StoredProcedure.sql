USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPViewDayLimitsPeriodToUse]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPViewDayLimitsPeriodToUse]
@HolderID int=0
AS
if @HolderID=0
begin
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderID, dbo.CardHolders.HolderNum,    	ISNULL(dbo.CardHolders.HolderName,'')+
	ISNULL(dbo.CardHolders.HolderMiddle,'')+
	ISNULL( dbo.CardHolders.HolderLast,'') as HolderName, 
                      dbo.Cards.CardSerial, dbo.CardDayLimit.LimitEnabled, dbo.CardDayLimit.LimitDate, dbo.CardDayLimit.LimitDateToUse, dbo.CardHolders.CardID, 
                      dbo.CardDayLimit.DietID, dbo.CardHolders.ContrID, dbo.CardDayLimit.LimitUsed, dbo.CardDayLimit.LimitDayID, dbo.CardDayLimit.Limit, 
                      dbo.CardDayLimit.LimitUse, dbo.Contragents.ContrName, dbo.Diets.DietDescription
FROM         dbo.CardDayLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardDayLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Cards ON dbo.CardHolders.CardID = dbo.Cards.CardID INNER JOIN
                      dbo.Period ON dbo.CardDayLimit.LimitDateToUse > dbo.Period.DateFrom-1 AND dbo.CardDayLimit.LimitDateToUse < dbo.Period.Dateto+1 INNER JOIN
                      dbo.Diets ON dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID
ORDER BY dbo.CardDayLimit.LimitDateToUse DESC, CAST(dbo.CardHolders.HolderNum as int) ASC
end
else
begin
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderID,    	ISNULL(dbo.CardHolders.HolderName,'')+
	ISNULL(dbo.CardHolders.HolderMiddle,'')+
	ISNULL( dbo.CardHolders.HolderLast,'') as HolderName, 
                      dbo.Cards.CardSerial, dbo.CardDayLimit.LimitEnabled, dbo.CardDayLimit.LimitDate, dbo.CardDayLimit.LimitDateToUse, dbo.CardHolders.CardID, 
                      dbo.CardDayLimit.DietID, dbo.CardHolders.ContrID, dbo.CardDayLimit.LimitUsed, dbo.CardDayLimit.LimitDayID, dbo.CardDayLimit.Limit, 
                      dbo.CardDayLimit.LimitUse, dbo.Contragents.ContrName, dbo.Diets.DietDescription
FROM         dbo.CardDayLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardDayLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Cards ON dbo.CardHolders.CardID = dbo.Cards.CardID INNER JOIN
                      dbo.Period ON dbo.CardDayLimit.LimitDateToUse > dbo.Period.DateFrom-1 AND dbo.CardDayLimit.LimitDateToUse < dbo.Period.Dateto+1 INNER JOIN
                      dbo.Diets ON dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID
WHERE dbo.CardDayLimit.HolderID = @HolderID 
ORDER BY dbo.CardDayLimit.LimitDateToUse DESC, CAST(dbo.CardHolders.HolderNum as int) ASC
end

GO
