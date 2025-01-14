USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_END_PERIOD]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_END_PERIOD]
@DateFrom datetime,
@DateTo datetime
AS
declare @tmpGoodsID int
declare @tmpContrID int
declare @midPrice real
declare @tmpSaldo real
declare @tmpSaldoPrice real

SET NOCOUNT ON

BEGIN
	begin tran
	insert into saldo (GoodsID,ContrID,Saldo,SaldoPrice, SaldoDoc, SaldoDocPrice)
	SELECT WarehouseOUT.GoodsID as WGoodsID, WarehouseOUT.ContrID as WContrID, 0,0,0,0
    FROM WarehouseOUT LEFT JOIN Saldo ON (WarehouseOUT.ContrID = Saldo.ContrID) AND (WarehouseOUT.GoodsID = Saldo.GoodsID)
    GROUP BY WarehouseOUT.GoodsID, WarehouseOUT.ContrID, Saldo.GoodsID
    HAVING (((Saldo.GoodsID) Is Null))
	commit

	begin tran
	insert into saldo (GoodsID,ContrID,Saldo,SaldoPrice, SaldoDoc, SaldoDocPrice)
	SELECT WarehouseIN.GoodsID,WarehouseIN.ContrID, 0,0,0,0
    FROM WarehouseIN LEFT JOIN Saldo ON (WarehouseIN.ContrID = Saldo.ContrID) AND (WarehouseIN.GoodsID = Saldo.GoodsID)
    GROUP BY WarehouseIN.GoodsID, Saldo.GoodsID, WarehouseIN.ContrID
    HAVING (((Saldo.GoodsID) Is Null))
	commit

	begin tran
		create table #tmpWarehouse (ID bigint IDENTITY(1,1) primary key,
							    GoodsID bigint,
							    ContrID int,
								Saldo real default ((0)),
								SaldoPrice real default ((0)),
								QINAfter real default ((0)),
								PINAfter real default ((0)),
								QOUTAfter real default ((0)),
								POUTAfter real default ((0)),
								SaldoDoc real default ((0)),
								SaldoPriceDoc real default ((0)),
								QINAfterDoc real default ((0)),
								PINAfterDoc real default ((0)),
								QOUTAfterDoc real default ((0)),
								POUTAfterDoc real default ((0)),
								ParentID bigint)

	commit

	begin tran
	insert into #tmpWarehouse (GoodsID, SaldoDoc, SaldoPriceDoc, Saldo, SaldoPrice,  ContrID, ParentID) Select saldo.GoodsID, saldo.SaldoDoc, saldo.SaldoDocPrice,  saldo.Saldo, saldo.SaldoPrice, saldo.ContrID, goods.Parent from Saldo inner join goods on saldo.goodsid = goods.goodsid
	commit

begin

	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID, QINAfterDoc, QINAfter,  ParentID) SELECT WarehouseIN.GoodsID, WarehouseIN.ContrID,round(isnull(Sum(WarehouseIN.[QuantityDoc]),0),3),round(isnull(Sum(WarehouseIN.[Quantity]),0),3), goods.parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											where
											WarehouseIN.InDate <=@DateTo
											group by WarehouseIN.goodsid, WarehouseIN.contrid, goods.Parent
	commit

	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,PINAfterDoc ,PINAfter, ParentID) SELECT WarehouseIN.GoodsID, WarehouseIN.ContrID,round(isnull(Sum(WarehouseIN.[InPrice]*WarehouseIN.[QuantityDoc]),0),3), round(isnull(Sum(WarehouseIN.[InPrice]*WarehouseIN.[Quantity]),0),3),  goods.parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											where
											WarehouseIN.InDate <=@DateTo
											group by WarehouseIN.goodsid, WarehouseIN.contrid, goods.Parent
											
								
	commit


	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID, QOUTAfterDoc,QOUTAfter, ParentID) SELECT WarehouseOUT.GoodsID, WarehouseOUT.ContrID,round(isnull(Sum(WarehouseOUT.[QuantityPercent]),0),3),round(isnull(Sum(WarehouseOUT.[Quantity]),0),3), Goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											WHERE 
											WarehouseOUT.OUTDate <=@DateTo
											group by WarehouseOUT.goodsid, WarehouseOUT.contrid, goods.parent
	commit

	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,POUTAfterDoc, POUTAfter, ParentID) SELECT WarehouseOUT.GoodsID, WarehouseOUT.ContrID,round(isnull(Sum(WarehouseOUT.[OUTPrice]*WarehouseOUT.[QuantityPercent]),0),3),round(isnull(Sum(WarehouseOUT.[OUTPrice]*WarehouseOUT.[Quantity]),0),3),  Goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											WHERE 
											WarehouseOUT.OUTDate <=@DateTo
											group by WarehouseOUT.goodsid, WarehouseOUT.contrid, goods.parent
	commit

end

--exec('DISABLE TRIGGER dbo.SaldoTrigger ON dbo.Saldo')

truncate table Saldo

insert into saldo(GoodsID, ContrID, Saldo, SaldoPrice, SaldoDoc, SaldoDocPrice)
select GoodsID, ContrID, sum(isnull(Saldo,0))+sum(isnull(QInAfter,0))- sum(isnull(QOUTAfter,0)), sum(isnull(SaldoPrice,0))+ sum(isnull(PInAfter,0))-sum(isnull(PoutAfter,0)),
sum(isnull(SaldoDoc,0))+sum(isnull(QInAfterDoc,0))- sum(isnull(QOUTAfterDoc,0)), sum(isnull(SaldoPriceDoc,0))+ sum(isnull(PInAfterDoc,0))-sum(isnull(PoutAfterDoc,0))
from #tmpWarehouse
group by GoodsID, ContrID

truncate table #tmpWarehouse
begin
	
	begin tran
	insert into #tmpWarehouse (GoodsID, SaldoDoc, SaldoPriceDoc, Saldo, SaldoPrice,  ContrID, ParentID) 
	Select Goods.GoodsID, Goods.SaldoPercent, Goods.SaldoPercentPrice,  Goods.Saldo, Goods.SaldoPrice, 0, goods.Parent from Goods
	commit
	
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID, QINAfterDoc, QINAfter,  ParentID) SELECT WarehouseIN.GoodsID, 0,round(isnull(Sum(WarehouseIN.[QuantityDoc]),0),3),round(isnull(Sum(WarehouseIN.[Quantity]),0),3), goods.parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											inner join documents on Warehousein.DocID=Documents.DocID
											inner join docutype on documents.docutype=docutype.docutypeid
											and docutype.win=1 and docutype.wout=0 and docutype.[money]=1
											where
											WarehouseIN.InDate <=@DateTo
											group by WarehouseIN.goodsid, goods.Parent
	commit

	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,PINAfterDoc ,PINAfter, ParentID) SELECT WarehouseIN.GoodsID, 0,round(isnull(Sum(WarehouseIN.[InPrice]*WarehouseIN.[QuantityDoc]),0),3), round(isnull(Sum(WarehouseIN.[InPrice]*WarehouseIN.[Quantity]),0),3),  goods.parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											inner join documents on Warehousein.DocID=Documents.DocID
											inner join docutype on documents.docutype=docutype.docutypeid
											and docutype.win=1 and docutype.wout=0 and docutype.[money]=1
											where
											WarehouseIN.InDate <=@DateTo
											group by WarehouseIN.goodsid, goods.Parent
											
								
	commit


	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID, QOUTAfterDoc,QOUTAfter, ParentID) SELECT WarehouseOUT.GoodsID, 0,round(isnull(Sum(WarehouseOUT.[QuantityPercent]),0),3),round(isnull(Sum(WarehouseOUT.[Quantity]),0),3), Goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											inner join documents on WarehouseOUT.DocID=Documents.DocID
											inner join docutype on documents.docutype=docutype.docutypeid
											and docutype.win=0 and docutype.wout=1 and docutype.[money]=1
											WHERE 
											WarehouseOUT.OUTDate <=@DateTo
											group by WarehouseOUT.goodsid, goods.parent
	commit

	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,POUTAfterDoc, POUTAfter, ParentID) SELECT WarehouseOUT.GoodsID, 0,round(isnull(Sum(WarehouseOUT.[OUTPrice]*WarehouseOUT.[QuantityPercent]),0),3),round(isnull(Sum(WarehouseOUT.[OUTPrice]*WarehouseOUT.[Quantity]),0),3),  Goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											inner join documents on WarehouseOUT.DocID=Documents.DocID
											inner join docutype on documents.docutype=docutype.docutypeid
											and docutype.win=0 and docutype.wout=1 and docutype.[money]=1
											WHERE 
											WarehouseOUT.OUTDate <=@DateTo
											group by WarehouseOUT.goodsid, goods.parent
	commit

end
declare @GoodsID bigint
declare Gid cursor for select GoodsID from Goods
open GID
fetch next from gid into @GoodsID
while @@fetch_status=0
	begin
		if exists (select goodsid from #tmpWarehouse where goodsid=@goodsid)
			begin
				update goods set saldo=
				(select sum(isnull(Saldo,0))+sum(isnull(QInAfter,0))- sum(isnull(QOUTAfter,0))
				from #tmpWarehouse where goodsid=@GoodsID),
				SaldoPrice=
				(select sum(isnull(SaldoPrice,0))+ sum(isnull(PInAfter,0))-sum(isnull(PoutAfter,0))
				from #tmpWarehouse where goodsid=@GoodsID),
				SaldoPercent=(select sum(isnull(SaldoDoc,0))+sum(isnull(QInAfterDoc,0))- sum(isnull(QOUTAfterDoc,0))
				from #tmpWarehouse where goodsid=@GoodsID),
				SaldoPercentPrice=(select sum(isnull(SaldoPriceDoc,0))+ sum(isnull(PInAfterDoc,0))-sum(isnull(PoutAfterDoc,0))
				from #tmpWarehouse where goodsid=@GoodsID)
				where goodsid=@Goodsid
			end
		fetch next from gid into @GoodsID
	end
close GID
deallocate GID
--exec('ENABLE TRIGGER dbo.SaldoTrigger ON dbo.Saldo')

exec('DISABLE TRIGGER dbo.WOUT_TAX_TRIGGER ON dbo.Warehouseout')
exec('DISABLE TRIGGER dbo.WIN_TAX_TRIGGER ON dbo.Warehousein')

delete from warehousein where indate <=@DateTo
delete from warehouseout where outDate <=@DateTo
--delete from sapiwarehousein where docid in (select docid from documents where docdate >=@DateFrom and DocDate <=@DateTo)
--delete from sapiwarehouseout where docid in (select docid from documents where docdate >=@DateFrom and DocDate <=@DateTo)
exec('ENABLE TRIGGER dbo.WOUT_TAX_TRIGGER ON dbo.Warehouseout')
exec('ENABLE TRIGGER dbo.WIN_TAX_TRIGGER ON dbo.Warehousein')

drop table #tmpWarehouse

DELETE FROM ACCOUNTS WHERE ACCDATE < @DATEFROM
DELETE FROM COOKING WHERE docid in (select docid from documents where docDATE < @DATEFROM)
DELETE FROM DOCUMENTS WHERE DOCDATE < @DATEFROM
Delete from tblSale where SellDate < @DATEFROM

declare @tmpQtyNew as real
declare @tmpPriceNew as real
select @tmpQtyNew=0

DECLARE saldo cursor for select goodsid, SaldoPrice, Saldo from goods
open saldo
fetch next from saldo into @tmpGoodsID, @tmpSaldoPrice, @tmpSaldo
while @@fetch_status=0
begin
	select @tmpQtyNew=isnull((select sum(quantity) from warehousein
	inner join documents on Warehousein.DocID=Documents.DocID
	inner join docutype on documents.docutype=docutype.docutypeid
	and docutype.win=1 and docutype.wout=0 and docutype.[money]=1
	where goodsid=@tmpgoodsid and inDate > @DateTo
	and warehousein.hiddenpercent=0),0)
	
	select @tmpQtyNew = @tmpQtyNew - ISNULL((select sum(quantity) from WarehouseOUT
	inner join goods on warehouseout.goodsid = goods.goodsid
	inner join documents on WarehouseOUT.DocID=Documents.DocID
	inner join docutype on documents.docutype=docutype.docutypeid
	and docutype.win=0 and docutype.wout=1 and docutype.[money]=1
	where goods.GoodsID=@tmpGoodsID and OutDate > @DateTo
	and warehouseout.hiddenpercent=0
	),0)
	
	select @tmpPriceNew = ISNULL((select sum(quantity*inprice)from warehousein 
	inner join documents on Warehousein.DocID=Documents.DocID
	inner join docutype on documents.docutype=docutype.docutypeid
	and docutype.win=1 and docutype.wout=0 and docutype.[money]=1
	where goodsid=@tmpgoodsid and inDate > @DateTo
	and warehousein.hiddenpercent=0),0 )
	
	select @tmpPriceNew = @tmpPriceNew-ISNULL((select sum(quantity*outprice) from WarehouseOUT 
	inner join goods on warehouseout.goodsid = goods.goodsid
	inner join documents on WarehouseOUT.DocID=Documents.DocID
	inner join docutype on documents.docutype=docutype.docutypeid
	and docutype.win=0 and docutype.wout=1 and docutype.[money]=1
	where goods.GoodsID=@tmpGoodsID and OutDate > @DateTo
	and warehouseout.hiddenpercent=0),0)
	
	if @tmpSaldo+@tmpQtyNew >0
	begin
		select @midprice = abs(round((@tmpSaldoPrice+@tmpPriceNew)/(@tmpSaldo+@tmpQtyNew),3))
		update goods set price = abs(round(@midprice,3)) where goodsid = @tmpGoodsID
		update tblCashPrice set CashPrice = abs(round(@midprice*Discount,2)) where goodsid = @tmpGoodsID and CashDynamic = 1
	end
	fetch next from saldo into @tmpGoodsID, @tmpSaldoPrice, @tmpSaldo
end
close saldo
deallocate saldo

END































GO
