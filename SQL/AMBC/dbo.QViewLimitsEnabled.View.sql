USE [ambc]
GO
/****** Object:  View [dbo].[QViewLimitsEnabled]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QViewLimitsEnabled]
AS
SELECT dbo.CardLimit.LimitIN, dbo.CardLimit.LimitOUT, 
    dbo.CardLimit.LimitAll, dbo.CardLimit.ValidFrom, 
    dbo.CardLimit.ValidTo, dbo.CardHolders.HolderNum, 
    dbo.CardHolders.HolderName, dbo.CardHolders.HolderMiddle, 
    dbo.CardHolders.HolderLast, 
    dbo.Contragents.ContrName
FROM dbo.CardHolders INNER JOIN
    dbo.CardLimit ON 
    dbo.CardHolders.HolderID = dbo.CardLimit.HolderID INNER JOIN
    dbo.Contragents ON 
    dbo.CardHolders.ContrID = dbo.Contragents.ContrID INNER JOIN
    dbo.Period ON 
    dbo.CardLimit.LimitIN >= dbo.Period.DateFrom AND 
    dbo.CardLimit.LimitOUT <= dbo.Period.Dateto
GO
