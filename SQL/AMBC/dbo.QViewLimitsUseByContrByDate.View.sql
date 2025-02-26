USE [ambc]
GO
/****** Object:  View [dbo].[QViewLimitsUseByContrByDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QViewLimitsUseByContrByDate]
AS
SELECT ContrName, SUM(LimitUse) AS LimitUse
FROM dbo.QViewLimitsUseByPeriodDetailByDate
GROUP BY ContrName
GO
