USE [ambc]
GO
/****** Object:  View [dbo].[VIEWtmpNHDuplicates]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWtmpNHDuplicates]
AS
SELECT     TOP 100 PERCENT dbo.VIEWtmpNHCount.numcount, dbo.VIEWtmpNHCount.nhsum, dbo.VIEWtmpNHCount.forMonth, dbo.VIEWtmpNHCount.forYear, 
                      dbo.VIEWtmpNHCount.Num, ISNULL(dbo.CardHolders.HolderName, N'') + N'  ' + ISNULL(dbo.CardHolders.HolderMiddle, N'') 
                      + N' ' + ISNULL(dbo.CardHolders.HolderLast, N'') AS HolderNAme
FROM         dbo.CardHolders RIGHT OUTER JOIN
                      dbo.VIEWtmpNHCount ON dbo.CardHolders.HolderNum = dbo.VIEWtmpNHCount.Num
WHERE     (dbo.VIEWtmpNHCount.numcount > 1)
ORDER BY ISNULL(dbo.CardHolders.HolderName, N'') + N'  ' + ISNULL(dbo.CardHolders.HolderMiddle, N'') + N' ' + ISNULL(dbo.CardHolders.HolderLast, N'')
GO
