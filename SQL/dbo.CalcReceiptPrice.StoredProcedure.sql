USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[CalcReceiptPrice]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CalcReceiptPrice] 
@ReceiptID int
AS
Declare @NewPrice real
Declare @GoodsID int
select @NewPrice = (select Sum(Price) from ReceiptDetails where ReceiptID = @ReceiptID)
select @GoodsID = (select GoodsID from Receipt where ReceiptID = @ReceiptID)
update receipt set price = @NewPrice where ReceiptID = @ReceiptID
update goods set price = @NewPrice where GoodsID = @GoodsID
update tblCashPrice set CashPrice = Round(@NewPrice *Discount,2) 
where goodsid = @GoodsID and CashDynamic = 1
GO
