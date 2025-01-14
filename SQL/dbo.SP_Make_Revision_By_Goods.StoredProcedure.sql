USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Make_Revision_By_Goods]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Asen,,Videnov>
-- Create date: <13 06 2006,,>
-- Description:	<Warehouse Revision By Period and Contragent,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Make_Revision_By_Goods]
@GoodsID nvarchar(50)
AS
declare @tmpGoodsID int
declare @tmpContrID int
declare @Description nvarchar(50)
declare @currGoodsID int
SET NOCOUNT ON

BEGIN
	insert into saldo (GoodsID,ContrID,Saldo,SaldoPrice, SaldoDoc, SaldoDocPrice)
	SELECT WarehouseOUT.GoodsID as WGoodsID, WarehouseOUT.ContrID as WContrID, 0,0,0,0
    FROM WarehouseOUT left JOIN Saldo ON (WarehouseOUT.ContrID = Saldo.ContrID) AND (WarehouseOUT.GoodsID = Saldo.GoodsID)
    GROUP BY WarehouseOUT.GoodsID, WarehouseOUT.ContrID, Saldo.GoodsID
	HAVING (((Saldo.GoodsID) Is Null))

	insert into saldo (GoodsID,ContrID,Saldo,SaldoPrice, SaldoDoc, SaldoDocPrice)
	SELECT WarehouseIN.GoodsID,WarehouseIN.ContrID, 0,0,0,0
    FROM WarehouseIN left JOIN Saldo ON (WarehouseIN.ContrID = Saldo.ContrID) AND (WarehouseIN.GoodsID = Saldo.GoodsID)
    GROUP BY WarehouseIN.GoodsID, Saldo.GoodsID, WarehouseIN.ContrID
    HAVING (((Saldo.GoodsID) Is Null))
	
delete from tblWarehouse

	set @Description = (select Description from Goods Where GoodsID = @GoodsID)
	declare tmpCursor cursor for select GoodsID from goods where description = @Description
	open tmpCursor
	fetch next from tmpCursor into @currGoodsID
	while @@fetch_status = 0
begin
	insert into tblWarehouse (GoodsID, Saldo, SaldoPrice, ContrID) Select GoodsID, SaldoDoc, SaldoDocPrice, ContrID from Saldo where GoodsID = @currGoodsID
	declare rev cursor for select GoodsID, ContrID from Saldo where goodsID = @currGoodsID
	open rev
	fetch next from rev into @tmpGoodsID, @tmpContrID
	while @@fetch_status = 0
begin

	update tblWarehouse SET QINAfter = (SELECT round(isnull(Sum([QuantityDoc]),0),3)
											FROM WarehouseIN 
											WHERE WarehouseIN.ContrID = @tmpContrID AND WarehouseIN.GoodsID = @tmpGoodsID
											)
						WHERE tblWarehouse.GoodsID = @tmpGoodsID and tblWarehouse.ContrID = @tmpContrID
	update tblWarehouse SET PINAfter = (SELECT round(isnull(Sum([InPrice]*[QuantityDoc]),0),3)
											FROM WarehouseIN
											WHERE WarehouseIN.ContrID = @tmpContrID AND WarehouseIN.GoodsID = @tmpGoodsID
											)
						WHERE tblWarehouse.GoodsID = @tmpGoodsID and tblWarehouse.ContrID = @tmpContrID
	update tblWarehouse SET QOUTAfter = (SELECT round(isnull(Sum([QuantityPercent]),0),3)
											FROM WarehouseOUT
											WHERE WarehouseOUT.ContrID = @tmpContrID AND WarehouseOUT.GoodsID = @tmpGoodsID
											)
						WHERE tblWarehouse.GoodsID = @tmpGoodsID and tblWarehouse.ContrID = @tmpContrID
	update tblWarehouse SET POUTAfter = (SELECT round(isnull(Sum([OUTPrice]*[QuantityPercent]),0),3)
											FROM WarehouseOUT
											WHERE WarehouseOUT.ContrID = @tmpContrID AND WarehouseOUT.GoodsID = @tmpGoodsID
											)
						WHERE tblWarehouse.GoodsID = @tmpGoodsID and tblWarehouse.ContrID = @tmpContrID

fetch next from rev into @tmpGoodsID, @tmpContrID
end
close rev
deallocate rev

fetch next from tmpCursor into @currGoodsID
end

close tmpCursor
deallocate tmpCursor

	SELECT Goods.Code, Goods.Description + ' ' + Goods.CashName as Description, tblWarehouse.Saldo AS tmpSaldo, 
	tblWarehouse.SaldoPrice AS tmpSaldoPrice, 
	tblWarehouse.QINAfter, tblWarehouse.PINAfter, tblWarehouse.QOUTAfter, 
	tblWarehouse.POutAfter,round(isnull(tblWarehouse.Saldo,0)+isnull(tblWarehouse.QINAfter,0)-isnull(tblWarehouse.QOUTAfter,0),3) as EndQ,
	round(tblWarehouse.SaldoPrice+tblWarehouse.PINAfter-tblWarehouse.POutAfter,3) as EndP, tblWarehouse.ContrID, tblWarehouse.GoodsID
	FROM tblWarehouse INNER JOIN Goods 
	ON tblWarehouse.GoodsID = Goods.GoodsID
	INNER JOIN Goods AS Goods_1 
	ON Goods.Parent = Goods_1.GoodsID
	INNER JOIN Goods AS Goods_2 
	ON Goods_1.Parent = Goods_2.GoodsID 
	INNER JOIN Goods AS Goods_3 ON Goods_2.Parent = Goods_3.GoodsID
	/*WHERE(
	tblWarehouse.QINAfter <> 0 OR
	tblWarehouse.PINAfter <> 0 OR
	tblWarehouse.QOUTAfter <> 0 OR
	tblWarehouse.POutAfter <>0)*/

END















GO
