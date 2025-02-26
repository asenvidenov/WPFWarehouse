USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_By_Discount]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[SP_Rep_Sell_By_Discount]
@DateFrom  datetime,
@DateTo datetime,
@ContrID int = 0
AS
BEGIN
if @ContrID = 0
begin
SELECT     Sum(dbo.Accounts.AccSum) as EndP,
					dbo.Accounts.Correction as Correction, Sum(dbo.Accounts.AccCash) as AccCash,
					Sum(dbo.AccOunts.CArdSum) as CardSum, Sum(dbo.AccOunts.InCash) as InCash
FROM                  dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) 
group by dbo.Accounts.Correction
end
else
begin
SELECT     Sum(dbo.Accounts.AccSum) as EndP, dbo.Contragents.ContrName,
						dbo.Accounts.Correction as Correction, Sum(dbo.Accounts.AccCash) as AccCash,
					Sum(dbo.AccOunts.CArdSum) as CardSum, Sum(dbo.AccOunts.InCash) as InCash
FROM         dbo.Contragents INNER JOIN
                      dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID
						ON dbo.Contragents.ContrID = dbo.Documents.ContrID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
GROUP BY dbo.Contragents.ContrName, dbo.Accounts.Correction
end
END







GO
