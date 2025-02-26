USE [ambc]
GO
/****** Object:  View [dbo].[VIEWtmpNHNotFound]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWtmpNHNotFound]
AS
SELECT     TOP 100 PERCENT name, Num, ID, forMonth, NH, forYear
FROM         dbo.VIEWtmpNHError
WHERE     (name IS NULL)
ORDER BY name
GO
