USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_By_Article]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[SP_Rep_Sell_By_Article]
	@DateFrom datetime,
	@DateTo datetime,
	@ContrID int =0,
	@GoodsID bigint = 0
AS
BEGIN
if @GoodsID = 0 
begin
if @contrID = 0
begin

SELECT  dbo.Goods.Description, dbo.tblCashPrice.CashCode, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count]),3) AS Cooked, 
                      round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.InPrice)),3) AS InP, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)),2) 
                      AS EndPrice, 
					  round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price))-(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)* dbo.Accounts.Correction/100)),2)
                      as PercentPrice
FROM         dbo.Goods INNER JOIN
                      dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
                      dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo)
GROUP BY  dbo.Goods.Description, dbo.tblCashPrice.CashCode

end
else
begin
SELECT     dbo.Contragents.ContrName, dbo.Goods.Description, dbo.tblCashPrice.CashCode, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count]),3) AS Cooked, 
                      round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.InPrice)),3) AS InP, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)),2) 
                      AS EndPrice,
					  round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price))-(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)* dbo.Accounts.Correction/100)),2)
					  as PercentPrice
FROM         dbo.Goods INNER JOIN
                      dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
                      dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
GROUP BY dbo.Contragents.ContrName, dbo.Goods.Description, dbo.tblCashPrice.CashCode

end
end
else
begin
if @contrID = 0
begin

SELECT  dbo.Goods.Description, dbo.tblCashPrice.CashCode, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count]),3) AS Cooked, 
                      round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.InPrice)),3) AS InP, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)),2) 
                      AS EndPrice, 
					  round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price))-(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)* dbo.Accounts.Correction/100)),2)
                      as PercentPrice
FROM         dbo.Goods INNER JOIN
                      dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
                      dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Goods.GoodsID = @GoodsID
GROUP BY  dbo.Goods.Description, dbo.tblCashPrice.CashCode

end
else
begin
SELECT     dbo.Contragents.ContrName, dbo.Goods.Description, dbo.tblCashPrice.CashCode, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count]),3) AS Cooked, 
                      round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.InPrice)),3) AS InP, round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)),2) 
                      AS EndPrice,
					  round(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price))-(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * abs(dbo.Cooking.Price)* dbo.Accounts.Correction/100)),2)
					  as PercentPrice
FROM         dbo.Goods INNER JOIN
                      dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
                      dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
                      dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
and dbo.Goods.GoodsID = @GoodsID
GROUP BY dbo.Contragents.ContrName, dbo.Goods.Description, dbo.tblCashPrice.CashCode

end
end
END






GO
