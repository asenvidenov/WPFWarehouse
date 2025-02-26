USE [ambc]
GO
/****** Object:  View [dbo].[VVIEWLimitUse]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VVIEWLimitUse]
AS
SELECT dbo.CardHolders.HolderNum, 
    ISNULL(dbo.CardHolders.HolderName, N'') 
    + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
    + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderName, 
    DATEPART(month, dbo.CardLimit.LimitIN) AS LimitM, 
    DATEPART(year, dbo.CardLimit.LimitIN) AS LimitY, 
    dbo.CardLimitUse.UseTime, dbo.CardLimitUse.LimitUse, 
    dbo.Contragents.ContrName, ISNULL(dbo.Operator.OpName, 
    dbo.Operator.OpLogin) AS opName
FROM dbo.CardLimitUse INNER JOIN
    dbo.CardHolders ON 
    dbo.CardLimitUse.HolderID = dbo.CardHolders.HolderID INNER JOIN
    dbo.CardLimit ON 
    dbo.CardLimitUse.LimitID = dbo.CardLimit.LimitID INNER JOIN
    dbo.Operator ON 
    dbo.CardLimitUse.OperatorID = dbo.Operator.OperatorID INNER JOIN
    dbo.Contragents ON 
    dbo.CardHolders.ContrID = dbo.Contragents.ContrID, 
    dbo.Period
WHERE (dbo.CardLimitUse.UseTime >= dbo.Period.DateFrom AND 
    dbo.CardLimitUse.UseTime <= dbo.Period.Dateto)
GO
