USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_Accounts_Full]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_Rep_Sell_Accounts_Full] 
@DateFrom datetime,
@Dateto datetime,
@ContrID int =0
AS
BEGIN
if @contrid = 0
begin
SELECT     dbo.Operator.OpName, dbo.Accounts.AccSum, dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.AccCash, dbo.DocuType.Type, 
                      dbo.Documents.DocDate, dbo.Documents.ContrID, dbo.Contragents.ContrName, dbo.Documents.ExtraInfo, dbo.tblCashPrice.CashCode, 
                      dbo.tblCashPrice.CashName, dbo.tblCashPrice.CashPrice - dbo.Cooking.Price AS Discount, dbo.tblDiscount.Description, dbo.Cooking.InPrice, 
                      dbo.Cooking.Price, dbo.Cooking.Quantity, dbo.Cooking.[count]
FROM         dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID INNER JOIN
                      dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID INNER JOIN
                      dbo.Contragents ON dbo.Documents.Contragent = dbo.Contragents.ContrID INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID Left Outer JOIN
                      dbo.Contragents AS Contragents_1 ON dbo.Documents.ContrID = Contragents_1.ContrID INNER JOIN
                      dbo.tblCashPrice ON Contragents_1.Parent = dbo.tblCashPrice.ContrID AND dbo.Cooking.GoodsID = dbo.tblCashPrice.GoodsID LEFT OUTER JOIN
                      dbo.tblDiscount ON dbo.Documents.ContrID = dbo.tblDiscount.ContrID AND dbo.Accounts.Correction = dbo.tblDiscount.ID
end
else
begin
SELECT     dbo.Operator.OpName, dbo.Accounts.AccSum, dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.AccCash, dbo.DocuType.Type, 
                      dbo.Documents.DocDate, dbo.Documents.ContrID, dbo.Contragents.ContrName, dbo.Documents.ExtraInfo, dbo.tblCashPrice.CashCode, 
                      dbo.tblCashPrice.CashName, dbo.tblCashPrice.CashPrice - dbo.Cooking.Price AS Discount, dbo.tblDiscount.Description, dbo.Cooking.InPrice, 
                      dbo.Cooking.Price, dbo.Cooking.Quantity, dbo.Cooking.[count]
FROM         dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID INNER JOIN
                      dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID INNER JOIN
                      dbo.Contragents ON dbo.Documents.Contragent = dbo.Contragents.ContrID INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID Left Outer JOIN
                      dbo.Contragents AS Contragents_1 ON dbo.Documents.ContrID = Contragents_1.ContrID INNER JOIN
                      dbo.tblCashPrice ON Contragents_1.Parent = dbo.tblCashPrice.ContrID AND dbo.Cooking.GoodsID = dbo.tblCashPrice.GoodsID LEFT OUTER JOIN
                      dbo.tblDiscount ON dbo.Documents.ContrID = dbo.tblDiscount.ContrID AND dbo.Accounts.Correction = dbo.tblDiscount.ID
end
END



GO
