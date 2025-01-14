USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_RECALC_PERIOD_LOCKDATE_2016_12_27]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[SP_RECALC_PERIOD_LOCKDATE_2016_12_27]
@datefrom datetime,
@dateto datetime,
@GoodsID int
AS
declare @NewPrice real
declare @MidPrice real
declare @NewQuantity real
declare @LockDate smalldatetime

select @LockDate = (select top 1 LockDate from tblLockDate)

if @LockDate > @datefrom
	begin
		return
	end
	else
	begin
select @NewPrice = isnull((select sum(isnull(SaldoDocPrice,0)) from saldo where GoodsID = @GoodsID),0)
--print @NewPrice
select @NewPrice = @NewPrice+isnull((select Sum(isnull(InPrice,0)*isnull(QuantityDoc,0)) from warehousein inner join documents
								on warehousein.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.wout = 0
								and docutype.win = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and documents.docdate <=@dateto
								and goodsid = @goodsid),0)
--print @NEWPRICE
select @NewPrice = @NewPrice -isnull((select Sum(isnull(OUTPrice,0)*isnull(QuantityPercent,0)) from warehouseout inner join documents
								on warehouseout.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.win = 0
								and docutype.wout = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and documents.docdate <@datefrom
								and goodsid = @goodsid),0)
--print @NEWPRICE
select @NewQuantity = isnull((select sum(isnull(SaldoDoc,0)) from Saldo where GoodsID = @GoodsID),0)
--print @NEWquantity
select @NewQuantity = @NewQuantity+isnull((select Sum(isnull(QuantityDoc,0)) from warehousein inner join documents
								on warehousein.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.wout = 0
								and docutype.win = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and documents.docdate <=@dateto
								and goodsid = @goodsid),0)
--print @NEWquantity
select @NewQuantity = @NewQuantity-isnull((select Sum(isnull(QuantityPercent,0)) from warehouseout inner join documents
								on warehouseout.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.win = 0
								and docutype.wout = 1
								and docutype.priceformer = 1
								and docutype.transport = 0
								and documents.docdate <@datefrom
								and goodsid = @goodsid),0)
--print @NEWquantity
if @NewQuantity <> 0
begin
select @MidPrice = @NewPrice/@NewQuantity

if @MidPrice <> 0
begin
update goods set price = abs(round(@midprice,5)) where goodsid = @GoodsID
update tblCashPrice set CashPrice = abs(round(@midprice*Discount,5)) where goodsid = @GoodsID and CashDynamic = 1
--declare @outid int
--declare tmp cursor for select OUTID from documents
--inner join warehouseout
--on documents.docid = warehouseout.docid
--where
--documents.docdate >=@datefrom
--and documents.docdate <=@dateto
--and goodsid = @goodsid
--open tmp
--fetch next from tmp into @outid
--while @@fetch_status=0
--begin
--update warehouseout set outprice = abs(round(@midprice,5)) where outid = @outid
--fetch next from tmp into @outid
--end
--close tmp
--deallocate tmp
set xact_abort on
begin transaction
alter table Warehouseout disable trigger WOUT_TAX_TRIGGER
update warehouseout set outprice = abs(round(@midprice,5)) where docid in 
(select docid from documents
where
documents.docdate >=@datefrom
and documents.docdate <=@dateto)
and goodsid=@goodsid
alter table Warehouseout enable trigger WOUT_TAX_TRIGGER
commit


--declare @cookid int
--declare cook cursor for select CookingID from documents
--inner join Cooking
--on documents.docid = Cooking.docid
--inner join docutype
--on documents.docutype=docutype.docutypeid
--where
--documents.docdate >=@datefrom
--and documents.docdate <=@dateto
--and goodsid = @goodsid
--and docutype.WIN=0
--and docutype.WOUT=1
--open cook
--fetch next from cook into @cookid
--while @@fetch_status=0
--begin
--update cooking set inprice = abs(round(@midprice,5)) where cookingid = @cookid
--fetch next from cook into @cookid
--end
--close cook
--deallocate cook
--update goods set price = abs(round(@midprice,5)) where goodsid = @goodsid
update cooking set inprice = abs(round(@midprice,5)) where docid in(
select docid from documents inner join docutype
on documents.docutype=docutype.docutypeid
where
documents.docdate >=@datefrom
and documents.docdate <=@dateto
and docutype.WIN=0
and docutype.WOUT=1)
and goodsid = @goodsid
end
end
--select @midprice
end
GO
