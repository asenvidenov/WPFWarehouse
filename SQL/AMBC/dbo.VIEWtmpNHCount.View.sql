USE [ambc]
GO
/****** Object:  View [dbo].[VIEWtmpNHCount]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWtmpNHCount]
AS
SELECT     TOP 100 PERCENT COUNT(Num) AS numcount, SUM(NH) AS nhsum, forMonth, forYear, Num
FROM         dbo.tmpNH
GROUP BY forMonth, forYear, Num
ORDER BY COUNT(Num) DESC
GO
