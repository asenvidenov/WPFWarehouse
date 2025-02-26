USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPLimitsEnabled]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPLimitsEnabled]
@HolderID int=0,
@ContrID int=0
 AS
if @HolderID = 0 
begin
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum, ISNULL(dbo.CardHolders.HolderName, '') + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
                      + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, DATEPART(month, dbo.CardLimit.LimitIN) AS LimitM, DATEPART(year, 
                      dbo.CardLimit.LimitIN) AS LimitY, dbo.CardLimit.LimitAll, dbo.CardLimit.LimitUse, dbo.CardLimit.LimitUsed, dbo.CardLimit.ValidFrom, 
                      dbo.CardLimit.ValidTo, dbo.CardLimit.LimitEnabled, dbo.Contragents.ContrName,
    Contragents.ContrID,
    Contragents_1.ContrID AS ContrID2, 
    Contragents_2.ContrID AS ContrID3, 
    Contragents_3.ContrID AS ContrID4, 
    Contragents_4.ContrID AS ContrID5
FROM         dbo.CardLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Period ON dbo.CardLimit.ValidFrom < dbo.Period.Dateto AND dbo.CardLimit.ValidTo > dbo.Period.DateFrom LEFT OUTER JOIN
    dbo.Contragents Contragents_1 LEFT OUTER JOIN
    dbo.Contragents Contragents_3 LEFT OUTER JOIN
    dbo.Contragents Contragents_4 ON 
    Contragents_3.Parent = Contragents_4.ContrID RIGHT OUTER JOIN
    dbo.Contragents Contragents_2 ON 
    Contragents_3.ContrID = Contragents_2.Parent ON 
    Contragents_1.Parent = Contragents_2.ContrID RIGHT OUTER JOIN
    dbo.Contragents ON 
    Contragents_1.ContrID = dbo.Contragents.Parent ON 
    dbo.CardHolders.ContrID = dbo.Contragents.ContrID


WHERE     (dbo.CardLimit.LimitEnabled = 1)
AND(
    Contragents.ContrID = @ContrID OR
    Contragents_1.ContrID = @ContrID OR 
    Contragents_2.ContrID = @ContrID OR 
    Contragents_3.ContrID = @ContrID OR 
    Contragents_4.ContrID = @ContrID)
ORDER BY ISNULL(dbo.CardHolders.HolderNum, N'') + ISNULL(dbo.CardHolders.HolderMiddle, N'') + ISNULL(dbo.CardHolders.HolderLast, N'')
end
if @HolderID > 0 
begin
SELECT     TOP 100 PERCENT dbo.CardHolders.HolderNum, ISNULL(dbo.CardHolders.HolderName, '') + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
                      + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, DATEPART(month, dbo.CardLimit.LimitIN) AS LimitM, DATEPART(year, 
                      dbo.CardLimit.LimitIN) AS LimitY, dbo.CardLimit.LimitAll, dbo.CardLimit.LimitUse, dbo.CardLimit.LimitUsed, dbo.CardLimit.ValidFrom, 
                      dbo.CardLimit.ValidTo, dbo.CardLimit.LimitEnabled, dbo.Contragents.ContrName,
    Contragents.ContrID,
    Contragents_1.ContrID AS ContrID2, 
    Contragents_2.ContrID AS ContrID3, 
    Contragents_3.ContrID AS ContrID4, 
    Contragents_4.ContrID AS ContrID5
FROM         dbo.CardLimit INNER JOIN
                      dbo.CardHolders ON dbo.CardLimit.HolderID = dbo.CardHolders.HolderID INNER JOIN
                      dbo.Period ON dbo.CardLimit.ValidFrom < dbo.Period.Dateto AND dbo.CardLimit.ValidTo > dbo.Period.DateFrom LEFT OUTER JOIN
    dbo.Contragents Contragents_1 LEFT OUTER JOIN
    dbo.Contragents Contragents_3 LEFT OUTER JOIN
    dbo.Contragents Contragents_4 ON 
    Contragents_3.Parent = Contragents_4.ContrID RIGHT OUTER JOIN
    dbo.Contragents Contragents_2 ON 
    Contragents_3.ContrID = Contragents_2.Parent ON 
    Contragents_1.Parent = Contragents_2.ContrID RIGHT OUTER JOIN
    dbo.Contragents ON 
    Contragents_1.ContrID = dbo.Contragents.Parent ON 
    dbo.CardHolders.ContrID = dbo.Contragents.ContrID

WHERE     (dbo.CardLimit.LimitEnabled = 1) and dbo.CardHolders.HolderID=@HolderID
AND(
    Contragents.ContrID = @ContrID OR
    Contragents_1.ContrID = @ContrID OR 
    Contragents_2.ContrID = @ContrID OR 
    Contragents_3.ContrID = @ContrID OR 
    Contragents_4.ContrID = @ContrID)
ORDER BY ISNULL(dbo.CardHolders.HolderNum, N'') + ISNULL(dbo.CardHolders.HolderMiddle, N'') + ISNULL(dbo.CardHolders.HolderLast, N'')
end

GO
