USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPViewAllDayLimits]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPViewAllDayLimits]
@HolderID int = 0
AS
if @HolderID=0 
	begin
SELECT top 100 percent dbo.CardHolders.HolderNum, 
   	ISNULL(dbo.CardHolders.HolderName,'')+
	ISNULL(dbo.CardHolders.HolderMiddle,'')+
	ISNULL( dbo.CardHolders.HolderLast,'') as HolderName, 
    dbo.CardDayLimit.LimitDate, 
    dbo.CardDayLimit.LimitDateToUse, dbo.Diets.DietDescription, 
    dbo.CardDayLimit.Limit, dbo.CardDayLimit.LimitUse, 
    dbo.CardDayLimit.LimitUsed, dbo.CardDayLimit.LimitEnabled, 
    dbo.CardDayLimitUse.LimitUse AS LimitDayUse, 
    dbo.CardDayLimitUse.UseTime
FROM dbo.CardDayLimit INNER JOIN
    dbo.CardHolders ON 
    dbo.CardDayLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
    dbo.Diets ON 
    dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
    dbo.Period ON 
    dbo.CardDayLimit.LimitDateToUse >= dbo.Period.DateFrom AND
     dbo.CardDayLimit.LimitDateToUse < dbo.Period.Dateto+1 LEFT OUTER
     JOIN
    dbo.CardDayLimitUse ON 
    dbo.CardDayLimit.LimitDayID = dbo.CardDayLimitUse.LimitDayID
order by     dbo.CardDayLimit.LimitDate
end
else
begin
SELECT dbo.CardHolders.HolderNum, 
       	ISNULL(dbo.CardHolders.HolderName,'')+
	ISNULL(dbo.CardHolders.HolderMiddle,'')+
	ISNULL( dbo.CardHolders.HolderLast,'') as HolderNUM, 
    dbo.CardDayLimit.LimitDate, 
    dbo.CardDayLimit.LimitDateToUse, dbo.Diets.DietDescription, 
    dbo.CardDayLimit.Limit, dbo.CardDayLimit.LimitUse, 
    dbo.CardDayLimit.LimitUsed, dbo.CardDayLimit.LimitEnabled, 
    dbo.CardDayLimitUse.LimitUse AS LimitDayUse, 
    dbo.CardDayLimitUse.UseTime
FROM dbo.CardDayLimit INNER JOIN
    dbo.CardHolders ON 
    dbo.CardDayLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
    dbo.Diets ON 
    dbo.CardDayLimit.DietID = dbo.Diets.DietID INNER JOIN
    dbo.Period ON 
    dbo.CardDayLimit.LimitDateToUse >= dbo.Period.DateFrom AND
     dbo.CardDayLimit.LimitDateToUse < dbo.Period.Dateto+1 LEFT OUTER
     JOIN
    dbo.CardDayLimitUse ON 
    dbo.CardDayLimit.LimitDayID = dbo.CardDayLimitUse.LimitDayID
where
dbo.CardDayLimit.HolderID = @HolderID
order by     dbo.CardDayLimit.LimitDate
end

GO
