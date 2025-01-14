USE [ambc]
GO
/****** Object:  View [dbo].[VIEWtmpNHError]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWtmpNHError]
AS
SELECT     TOP 100 PERCENT dbo.tmpNH.Num, dbo.CardHolders.HolderName AS name, dbo.tmpNH.ID, dbo.tmpNH.forMonth, dbo.tmpNH.NH, 
                      dbo.tmpNH.forYear
FROM         dbo.CardHolders RIGHT OUTER JOIN
                      dbo.tmpNH ON dbo.CardHolders.HolderNum = dbo.tmpNH.Num
ORDER BY dbo.CardHolders.HolderName
GO
