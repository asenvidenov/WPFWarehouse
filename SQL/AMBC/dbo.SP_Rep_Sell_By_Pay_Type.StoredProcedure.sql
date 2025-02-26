USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_By_Pay_Type]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[SP_Rep_Sell_By_Pay_Type]
@DateFrom  datetime,
@DateTo datetime,
@ContrID int = 0
AS
BEGIN
if @ContrID = 0
begin
SELECT     ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, SUM(dbo.Accounts.AccSum) as AccSum, Sum(dbo.Accounts.CardSum) as CardSum,
			SUM(dbo.Accounts.InCash) as InCash, Sum(dbo.Accounts.AccCash)  As AccCash
FROM
                      dbo.Accounts LEFT OUTER JOIN
                      dbo.AccPay ON dbo.Accounts.DocID = dbo.AccPay.DocID LEFT OUTER JOIN
					  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo)
GROUP BY ISNULL(dbo.tblPayType.PayType, N'UNKNOWN')
UNION
SELECT     ' TOTAL' AS PayType, SUM(dbo.Accounts.AccSum) as AccSum, Sum(dbo.Accounts.CardSum) as CardSum,
			SUM(dbo.Accounts.InCash) as InCash, Sum(dbo.Accounts.AccCash)  As AccCash
FROM
                      dbo.Accounts LEFT OUTER JOIN
                      dbo.AccPay ON dbo.Accounts.DocID = dbo.AccPay.DocID LEFT OUTER JOIN
					  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo)
end
else
begin
SELECT     ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, SUM(dbo.Accounts.AccSum) as AccSum, Sum(dbo.Accounts.CardSum) as CardSum,
			SUM(dbo.Accounts.InCash) as InCash, Sum(dbo.Accounts.AccCash)  As AccCash
FROM
					dbo.Documents INNER JOIN dbo.Contragents ON
					dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID LEFT OUTER JOIN
                      dbo.AccPay ON dbo.Accounts.DocID = dbo.AccPay.DocID LEFT OUTER JOIN
					  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
GROUP BY ISNULL(dbo.tblPayType.PayType, N'UNKNOWN')
UNION
SELECT     ' TOTAL' AS PayType, SUM(dbo.Accounts.AccSum) as AccSum, Sum(dbo.Accounts.CardSum) as CardSum,
			SUM(dbo.Accounts.InCash) as InCash, Sum(dbo.Accounts.AccCash)  As AccCash
FROM
				dbo.Documents INNER JOIN dbo.Contragents ON
					dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID LEFT OUTER JOIN
                      dbo.AccPay ON dbo.Accounts.DocID = dbo.AccPay.DocID LEFT OUTER JOIN
					  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
end
END







GO
