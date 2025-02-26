USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPInCash]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPInCash] 
AS
SELECT     TOP 100 PERCENT dbo.Accounts.AccDate, dbo.Accounts.AccSum, dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction, 
                      dbo.Accounts.VAT, dbo.Accounts.AccCash, ROUND(dbo.Accounts.InCash / (100 + dbo.Accounts.Correction) * 100, 2) AS NoPercent, 
                      ROUND(dbo.Accounts.InCash - ROUND(dbo.Accounts.InCash / (100 + dbo.Accounts.Correction) * 100, 2), 2) AS [Percent]
FROM         dbo.Accounts INNER JOIN
                      dbo.Period ON dbo.Accounts.AccDate >= dbo.Period.DateFrom AND dbo.Accounts.AccDate < dbo.Period.Dateto+1
ORDER BY dbo.Accounts.AccDate

GO
