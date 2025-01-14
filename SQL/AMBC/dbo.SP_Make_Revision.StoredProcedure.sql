USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Make_Revision]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Asen,,Videnov>
-- Create date: <13 06 2006,,>
-- Description:	<Warehouse Revision By Period and Contragent,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Make_Revision]
@DateFrom datetime,
@DateTo datetime,
@GoodsID bigint,
@ParentID int,
@ContrID int = 0,
@isActive int,
@OrderBY int = 0
AS
declare @tmpGoodsID int
declare @tmpContrID int
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
								QINBefore real default ((0)),
								PINBefore real default ((0)),
								QOUTBefore real default ((0)),
								POUTBefore real default ((0)),
								QINAfter real default ((0)),
								PINAfter real default ((0)),
								QOUTAfter real default ((0)),
								POUTAfter real default ((0)),
								EndQ real default ((0)),
								EndP real default ((0)),
								ParentID bigint)

create table #tmpRevision (ID bigint IDENTITY(1,1) primary key,
							   Code nvarchar(25),
							   Description nvarchar(50),
								Saldo real,
								SaldoPrice real,
								QIN real,
								PIN real,
								QOUT real,
								POUT real,
								EndQ real,
								EndP real,
								ParentID bigint)
create table #tmpContr(ContrID int)
exec sp_ret_contr @ContrID
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, Saldo, SaldoPrice, ContrID, ParentID) Select saldo.GoodsID, saldo.SaldoDoc, saldo.SaldoDocPrice, saldo.ContrID, goods.Parent from Saldo inner join goods on saldo.goodsid = goods.goodsid where Saldo.ContrID in ( select ContrID from #tmpContr)
	commit
begin
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID, QINBefore, ParentID) SELECT WarehouseIN.GoodsID, WarehouseIN.ContrID, round(isnull(Sum(WarehouseIN.[QuantityDoc]),0),3),goods.Parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											where
											WarehouseIN.InDate < @DateFrom
											group by WarehouseIN.goodsid, WarehouseIN.contrid, goods.Parent
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,PINBefore,ParentID)  SELECT WarehouseIN.GoodsID, WarehouseIN.ContrID,round(isnull(Sum(WarehouseIN.[InPrice]*WarehouseIN.[QuantityDoc]),0),3), goods.parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											where
											WarehouseIN.InDate < @DateFrom
											group by WarehouseIN.goodsid, WarehouseIN.contrid, goods.Parent
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID, QINAfter, ParentID) SELECT WarehouseIN.GoodsID, WarehouseIN.ContrID,round(isnull(Sum(WarehouseIN.[QuantityDoc]),0),3), goods.parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											where
											WarehouseIN.InDate >= @DateFrom AND WarehouseIN.InDate <=@DateTo
											group by WarehouseIN.goodsid, WarehouseIN.contrid, goods.Parent
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,PINAfter, ParentID) SELECT WarehouseIN.GoodsID, WarehouseIN.ContrID,round(isnull(Sum(WarehouseIN.[InPrice]*WarehouseIN.[QuantityDoc]),0),3), goods.parent
											FROM WarehouseIN inner join goods on WarehouseIN.goodsid = goods.goodsid
											where
											WarehouseIN.InDate >= @DateFrom AND WarehouseIN.InDate <=@DateTo
											group by WarehouseIN.goodsid, WarehouseIN.contrid, goods.Parent
											
								
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,QOUTBefore, ParentID) SELECT WarehouseOUT.GoodsID, WarehouseOUT.ContrID,round(isnull(Sum(WarehouseOUT.[QuantityPercent]),0),3), goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											WHERE 
											WarehouseOUT.OUTDate < @DateFrom
											group by WarehouseOUT.goodsid, WarehouseOUT.contrid, goods.parent
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,POUTBefore, ParentID) SELECT WarehouseOUT.GoodsID, WarehouseOUT.ContrID,round(isnull(Sum(WarehouseOUT.[OUTPrice]*WarehouseOUT.[QuantityPercent]),0),3), Goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											WHERE 
											WarehouseOUT.OUTDate < @DateFrom
											group by WarehouseOUT.goodsid, WarehouseOUT.contrid, goods.parent
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID, QOUTAfter, ParentID) SELECT WarehouseOUT.GoodsID, WarehouseOUT.ContrID,round(isnull(Sum(WarehouseOUT.[QuantityPercent]),0),3), Goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											WHERE 
											WarehouseOUT.OUTDate >= @DateFrom AND WarehouseOUT.OUTDate <=@DateTo
											group by WarehouseOUT.goodsid, WarehouseOUT.contrid, goods.parent
	commit
	begin tran
	insert into #tmpWarehouse (GoodsID, ContrID,POUTAfter, ParentID) SELECT WarehouseOUT.GoodsID, WarehouseOUT.ContrID,round(isnull(Sum(WarehouseOUT.[OUTPrice]*WarehouseOUT.[QuantityPercent]),0),3), Goods.Parent
											FROM WarehouseOUT inner join goods on warehouseout.goodsid = goods.goodsid
											WHERE 
											WarehouseOUT.OUTDate >= @DateFrom AND WarehouseOUT.OUTDate <=@DateTo
											group by WarehouseOUT.goodsid, WarehouseOUT.contrid, goods.parent
	commit
--fetch next from rev into @tmpGoodsID, @tmpContrID
end
--close rev
--deallocate rev
exec sp_make_revision_details @GoodsID, @ContrID

if (@isActive = 2)or (@isactive = 1)
begin
	if @OrderBy = 1 select * from #tmpRevision order by code
	if @OrderBy = 2 select * from #tmpRevision order by Description
end
if (@isActive = 3)
begin
if @OrderBY = 1 select * from #tmpRevision where QIN <> 0 or QOUT <>0 order by code
if @OrderBY = 2 select * from #tmpRevision where QIN <> 0 or QOUT <>0 order by description
	--exec sp_make_revision_details @GoodsID, @ContrID
end

if (@isActive = 3)
begin
if @OrderBY = 1 select * from #tmpRevision where QIN = 0 or QOUT =0 order by code
if @OrderBY = 2 select * from #tmpRevision where QIN = 0 or QOUT =0 order by description
	--exec sp_make_revision_details @GoodsID, @ContrID
end

drop table #tmpRevision
drop table #tmpWarehouse
drop table #tmpContr
END





















GO
