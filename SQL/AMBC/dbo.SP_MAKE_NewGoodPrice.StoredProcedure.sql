USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_MAKE_NewGoodPrice]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[SP_MAKE_NewGoodPrice]
@GoodsID int
AS
declare @NewPrice real
declare @MidPrice real
declare @NewQuantity real
select @NewPrice = isnull((select sum(isnull(SaldoDocPrice,0)) from saldo where GoodsID = @GoodsID),0)
select @NewPrice = @NewPrice+isnull((select Sum(isnull(InPrice,0)*isnull(QuantityDoc,0)) from warehousein inner join documents
								on warehousein.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.wout = 0
								and docutype.win = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and goodsid = @goodsid),0)
select @NewPrice = @NewPrice -isnull((select Sum(isnull(OUTPrice,0)*isnull(QuantityPercent,0)) from warehouseout inner join documents
								on warehouseout.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.win = 0
								and docutype.wout = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and goodsid = @goodsid),0)
select @NewQuantity = isnull((select sum(isnull(SaldoDoc,0)) from Saldo where GoodsID = @GoodsID),0)
select @NewQuantity = @NewQuantity+isnull((select Sum(isnull(QuantityDoc,0)) from warehousein inner join documents
								on warehousein.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.wout = 0
								and docutype.win = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and goodsid = @goodsid),0)
select @NewQuantity = @NewQuantity-isnull((select Sum(isnull(QuantityPercent,0)) from warehouseout inner join documents
								on warehouseout.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.win = 0
								and docutype.wout = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and goodsid = @goodsid),0)
if @NewQuantity <> 0
begin
select @MidPrice = @NewPrice/@NewQuantity
if @MidPrice <> 0
begin
update goods set price = abs(round(@midprice,5)) where goodsid = @GoodsID
update tblCashPrice set CashPrice = abs(round(@midprice*Discount,5)) where goodsid = @GoodsID and CashDynamic = 1
end
end
return








GO
