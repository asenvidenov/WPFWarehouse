USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPLimitsUsed]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPLimitsUsed]
@HolderID int=0,
@ContrID int=0
 AS
if @HolderID = 0
begin
SELECT dbo.CardHolders.HolderNum, 
    ISNULL(dbo.CardHolders.HolderName, N'') 
    + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
    + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, 
    DATEPART(month, dbo.CardLimit.LimitIN) AS LimitM, 
    DATEPART(year, dbo.CardLimit.LimitIN) AS LimitY, 
    dbo.CardLimitUse.UseTime, dbo.CardLimitUse.LimitUse, 
    dbo.Contragents.ContrName, ISNULL(dbo.Operator.OpName, 
    dbo.Operator.OpLogin) AS opName,
    Contragents.ContrID,
    Contragents_1.ContrID AS ContrID2, 
    Contragents_2.ContrID AS ContrID3, 
    Contragents_3.ContrID AS ContrID4, 
    Contragents_4.ContrID AS ContrID5
FROM dbo.CardLimitUse INNER JOIN
    dbo.CardHolders ON 
    dbo.CardLimitUse.HolderID = dbo.CardHolders.HolderID INNER JOIN
    dbo.CardLimit ON 
    dbo.CardLimitUse.LimitID = dbo.CardLimit.LimitID INNER JOIN
    dbo.Operator ON 
    dbo.CardLimitUse.OperatorID = dbo.Operator.OperatorID INNER JOIN
    dbo.Period ON 
    dbo.CardLimitUse.UseTime >= dbo.Period.DateFrom AND 
    dbo.CardLimitUse.UseTime < dbo.Period.Dateto+1
LEFT OUTER JOIN
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
WHERE(
    Contragents.ContrID = @ContrID OR
    Contragents_1.ContrID = @ContrID OR 
    Contragents_2.ContrID = @ContrID OR 
    Contragents_3.ContrID = @ContrID OR 
    Contragents_4.ContrID = @ContrID)
end

if @HolderID > 0
begin
SELECT dbo.CardHolders.HolderNum, 
    ISNULL(dbo.CardHolders.HolderName, N'') 
    + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
    + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, 
    DATEPART(month, dbo.CardLimit.LimitIN) AS LimitM, 
    DATEPART(year, dbo.CardLimit.LimitIN) AS LimitY, 
    dbo.CardLimitUse.UseTime, dbo.CardLimitUse.LimitUse, 
    dbo.Contragents.ContrName, ISNULL(dbo.Operator.OpName, 
    dbo.Operator.OpLogin) AS opName,
    Contragents.ContrID,
    Contragents_1.ContrID AS ContrID2, 
    Contragents_2.ContrID AS ContrID3, 
    Contragents_3.ContrID AS ContrID4, 
    Contragents_4.ContrID AS ContrID5
FROM dbo.CardLimitUse INNER JOIN
    dbo.CardHolders ON 
    dbo.CardLimitUse.HolderID = dbo.CardHolders.HolderID INNER JOIN
    dbo.CardLimit ON 
    dbo.CardLimitUse.LimitID = dbo.CardLimit.LimitID INNER JOIN
    dbo.Operator ON 
    dbo.CardLimitUse.OperatorID = dbo.Operator.OperatorID INNER JOIN
    dbo.Period ON 
    dbo.CardLimitUse.UseTime >= dbo.Period.DateFrom AND 
    dbo.CardLimitUse.UseTime < dbo.Period.Dateto+1
LEFT OUTER JOIN
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
WHERE dbo.CardHolders.HolderID = @HolderID
AND(
    Contragents.ContrID = @ContrID OR
    Contragents_1.ContrID = @ContrID OR 
    Contragents_2.ContrID = @ContrID OR 
    Contragents_3.ContrID = @ContrID OR 
    Contragents_4.ContrID = @ContrID)
end

GO
