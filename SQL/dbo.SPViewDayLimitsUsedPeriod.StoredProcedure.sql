USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPViewDayLimitsUsedPeriod]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPViewDayLimitsUsedPeriod]
@HolderID int = 0
AS
if @HolderID=0
begin
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum,    	ISNULL(dbo.CardHolders.HolderName,'')+
	ISNULL(dbo.CardHolders.HolderMiddle,'')+
	ISNULL( dbo.CardHolders.HolderLast,'') as HolderName, dbo.CardDayLimitUse.LimitUse, 
                      dbo.CardDayLimitUse.UseTime, dbo.Diets.DietDescription, dbo.CardDayLimit.LimitDate, dbo.Contragents.ContrName
FROM         dbo.CardHolders INNER JOIN
                      dbo.CardDayLimitUse ON dbo.CardHolders.HolderID = dbo.CardDayLimitUse.HolderID INNER JOIN
                      dbo.CardDayLimit ON dbo.CardDayLimitUse.LimitDayID = dbo.CardDayLimit.LimitDayID INNER JOIN
                      dbo.Diets ON dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
                      dbo.Period ON dbo.CardDayLimitUse.UseTime > dbo.Period.DateFrom-1 AND dbo.CardDayLimitUse.UseTime < dbo.Period.Dateto + 1 INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID
ORDER BY CAST(dbo.CardHolders.HolderNum as int) ASC, dbo.CardDayLimitUse.UseTime
end
else
begin
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum,    	ISNULL(dbo.CardHolders.HolderName,'')+
	ISNULL(dbo.CardHolders.HolderMiddle,'')+
	ISNULL( dbo.CardHolders.HolderLast,'') as HolderName, dbo.CardDayLimitUse.LimitUse, 
                      dbo.CardDayLimitUse.UseTime, dbo.Diets.DietDescription, dbo.CardDayLimit.LimitDate, dbo.Contragents.ContrName
FROM         dbo.CardHolders INNER JOIN
                      dbo.CardDayLimitUse ON dbo.CardHolders.HolderID = dbo.CardDayLimitUse.HolderID INNER JOIN
                      dbo.CardDayLimit ON dbo.CardDayLimitUse.LimitDayID = dbo.CardDayLimit.LimitDayID INNER JOIN
                      dbo.Diets ON dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
                      dbo.Period ON dbo.CardDayLimitUse.UseTime > dbo.Period.DateFrom-1 AND dbo.CardDayLimitUse.UseTime < dbo.Period.Dateto + 1 INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID
WHERE dbo.CardHolders.HolderID=@HolderID 
ORDER BY CAST(dbo.CardHolders.HolderNum as int) ASC, dbo.CardDayLimitUse.UseTime
end

GO
