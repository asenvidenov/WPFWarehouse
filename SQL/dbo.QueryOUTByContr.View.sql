USE [ambc]
GO
/****** Object:  View [dbo].[QueryOUTByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryOUTByContr]
AS
SELECT     GoodsID, SUM(SumOfReal) AS Real, MAX(ContrID) AS MaxOfContrID, SUM([Percent]) AS RealPercent, SUM(valueOUT) AS SumOfvalueOUT
FROM         dbo.QueryOUTByContrGrouped
GROUP BY GoodsID
GO
