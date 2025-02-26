USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_By_Destination]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[SP_Rep_Sell_By_Destination]
@DateFrom  datetime,
@DateTo datetime,
@ContrID int = 0
AS
BEGIN
if @ContrID = 0
begin
SELECT     round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * dbo.Cooking.InPrice),3) AS InP, dbo.CashPrinter.PrintPath, 
                      ROUND(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price)), 2) AS EndP
FROM                  dbo.CashPrinter INNER JOIN
                      dbo.tblCashPrice ON dbo.CashPrinter.ID = dbo.tblCashPrice.CashPrint INNER JOIN
                      dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID ON dbo.tblCashPrice.GoodsID = dbo.Cooking.GoodsID INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID AND dbo.tblCashPrice.ContrID = dbo.Contragents.Parent
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo)
GROUP BY dbo.CashPrinter.PrintPath
end
else
begin
SELECT     round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * dbo.Cooking.InPrice),3) AS InP, dbo.CashPrinter.PrintPath, 
                      ROUND(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price)), 2) AS EndP, dbo.Contragents.ContrName
FROM                  dbo.CashPrinter INNER JOIN
                      dbo.tblCashPrice ON dbo.CashPrinter.ID = dbo.tblCashPrice.CashPrint INNER JOIN
                      dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID ON dbo.tblCashPrice.GoodsID = dbo.Cooking.GoodsID INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID AND dbo.tblCashPrice.ContrID = dbo.Contragents.Parent
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
GROUP BY dbo.CashPrinter.PrintPath, dbo.Contragents.ContrName
end
END






GO
