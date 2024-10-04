USE [ambc]
GO
/****** Object:  View [dbo].[VIEWmonthlimitenabled]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEWmonthlimitenabled]
AS
SELECT     LimitID, HolderID, LimitIN, LimitOUT, LimitAll, LimitUse, LimitUsed, ValidFrom, ValidTo, LimitEnabled
FROM         dbo.CardLimit
WHERE     (LimitEnabled = 1) AND (LimitUsed = 0)

GO
