USE [ambc]
GO
/****** Object:  View [dbo].[QViewLimitsUseByPeriodByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QViewLimitsUseByPeriodByContr]
AS
SELECT ContrName, MONTH, SUM(LimitUse) AS LimitUse
FROM dbo.QViewLimitsUseByPeriodDetail
GROUP BY ContrName, MONTH
GO
