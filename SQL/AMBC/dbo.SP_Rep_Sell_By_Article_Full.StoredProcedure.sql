USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_By_Article_Full]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SP_Rep_Sell_By_Article_Full] 
@DateFrom datetime,
@Dateto datetime,
@ContrID int =0,
@GoodsID int =0,
@OpID int = 0,
@Table int =0
AS
BEGIN
	if @contrid = 0
		begin
			if @GoodsID = 0
				begin
					if @OpID = 0
						begin
							if @table = 0
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo)
									ORDER BY dbo.Accounts.AccID
								end
							else
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Documents.Contragent = @Table
									ORDER BY dbo.Accounts.AccID
								end
						end
					else
						begin
							if @table=0
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.accounts.operatorID = @opid
									ORDER BY dbo.Accounts.AccID
								end
							else
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.accounts.operatorID = @opid and dbo.Documents.Contragent = @Table
									ORDER BY dbo.Accounts.AccID
								end
						end
				end
			else
				begin
					if @OpID = 0
						begin
							if @Table = 0
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID
									ORDER BY dbo.Accounts.AccID
								end
							else
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID and dbo.Documents.Contragent = @table
									ORDER BY dbo.Accounts.AccID
								end
						end
					else
						begin
							if @table = 0
								begin	
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID and dbo.Accounts.OperatorID = @OpID
									ORDER BY dbo.Accounts.AccID
								end
							else
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID and dbo.Accounts.OperatorID = @OpID and dbo.Documents.Contragent = @Table
									ORDER BY dbo.Accounts.AccID
								end
						end
				end
		end
	else
		begin
			if @GoodsID = 0
				begin
					if @OpID = 0
						begin
							if @table = 0
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
									ORDER BY dbo.Accounts.AccID
								end
							else
								begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
									WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID) and dbo.Documents.Contragent = @Table
									ORDER BY dbo.Accounts.AccID
								end
				end
			else
				begin
					if @table = 0
						begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
							WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID) and dbo.Accounts.OperatorID = @OpID
							ORDER BY dbo.Accounts.AccID
						end
					else
						begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
							WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID) and dbo.Accounts.OperatorID = @OpID and dbo.Documents.Contragent = @Table
							ORDER BY dbo.Accounts.AccID
						end
				end
			end
		else
			begin
				if @OpID = 0 
					begin
						if @table = 0
							begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
								WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID
								ORDER BY dbo.Accounts.AccID
							end
						else
							begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
								WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID and dbo.Documents.Contragent = @table
								ORDER BY dbo.Accounts.AccID
							end
					end
				else
					begin
						if @table = 0
							begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
								WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID and dbo.Accounts.OperatorID = @OpID
								ORDER BY dbo.Accounts.AccID
							end
						else
							begin
									SELECT     TOP (100) PERCENT dbo.Accounts.AccDate,dbo.Operator.OpName, Contragents_1.ContrName AS _Table, dbo.Documents.TypeNumber, 
										  ISNULL(dbo.tblPayType.PayType, N'UNKNOWN') AS PayType, dbo.tblCashPrice.CashCode, dbo.Goods.Description, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count],3) AS Cooked, round(dbo.Cooking.Quantity * dbo.Cooking.Count * dbo.Cooking.InPrice,3) AS InP, 
										  round(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price),2) AS EndPrice, dbo.Accounts.AccCash, 
										  dbo.Accounts.CardSum, dbo.Accounts.InCash, dbo.Accounts.Correction
									FROM         dbo.Goods INNER JOIN
										  dbo.Cooking ON dbo.Goods.GoodsID = dbo.Cooking.GoodsID INNER JOIN
										  dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID INNER JOIN
										  dbo.Accounts ON dbo.Documents.DocID = dbo.Accounts.DocID INNER JOIN
										  dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID INNER JOIN
										  dbo.tblCashPrice ON dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID AND dbo.Contragents.Parent = dbo.tblCashPrice.ContrID Left Outer JOIN
										  dbo.Contragents AS Contragents_1 ON dbo.Documents.Contragent = Contragents_1.ContrID INNER JOIN
										  dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID LEFT OUTER JOIN
										  dbo.AccPay on dbo.Accounts.DocId = dbo.Accpay.DocID LEFT OUTER JOIN
										  dbo.tblPayType on dbo.AccPay.PayType = dbo.tblPayType.PayTypeID
								WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo) and dbo.Cooking.GoodsID = @GoodsID and dbo.Accounts.OperatorID = @OpID and dbo.documents.Contragent = @table
								ORDER BY dbo.Accounts.AccID
							end
					end
			end
	end
END





GO
