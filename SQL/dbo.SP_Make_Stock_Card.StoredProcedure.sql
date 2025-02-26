USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Make_Stock_Card]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Asen,,Videnov>
-- Create date: <10 11 2006,,>
-- Description:	<Warehouse Revision By Period and Contragent,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Make_Stock_Card]
@DateFrom datetime,
@DateTo datetime,
@GoodsID bigint,
@ContrID int
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
		create table #tmpStockCard (ID bigint IDENTITY(1,1) primary key,
							    GoodsID bigint null,
							    ContrID int null,
								DocID int null,
								Quantity float null,
								Price real null)

		create table #tmpStockSaldo (ID bigint IDENTITY(1,1) primary key,
								Saldo real default((null)) null,
								SaldoPrice real default((null)) null,
								QIN real default((null)) null,
								PIN real default((null)) null,
								QOUT real default((null)) null,
								POUT real default((null)) null,
								EndQ real default((null)) null,
								EndP real default((null)) null)
	commit

	begin tran
	insert into #tmpStockSaldo (Saldo, SaldoPrice) Select saldo.SaldoDoc, saldo.SaldoDocPrice from Saldo where Saldo.ContrID = @ContrID and saldo.GoodsID = @GoodsID
	commit
	
	begin tran
	update #tmpStockSaldo set QIN = (select sum(warehousein.QuantityDoc) from WarehouseIN 
	where InDate < @DateFrom and ContrID = @ContrID 
	and GoodsID = @GoodsID)
	commit
	
	begin tran
	update #tmpStockSaldo set PIN = (select sum(warehousein.QuantityDoc*InPrice) from WarehouseIN 
	where InDate < @DateFrom and ContrID = @ContrID 
	and GoodsID = @GoodsID)
	commit
	
	begin tran
	update #tmpStockSaldo set QOUT = (select sum(warehouseOUT.QuantityPercent) from WarehouseOUT
	where OutDate < @DateFrom and ContrID = @ContrID 
	and GoodsID = @GoodsID)
	commit
	
	begin tran
	update #tmpStockSaldo set POUT = (select sum(warehouseOUT.QuantityPercent*OutPrice) from WarehouseOUT
	where OutDate < @DateFrom and ContrID = @ContrID 
	and GoodsID = @GoodsID)
	commit
	
	declare @tmpDocID int
	declare @tmpQ float
	declare @tmpP float
	declare @tmpG int
	declare @tmpC int

	declare tmp cursor for select Documents.DocID,WarehouseIN.GoodsID,
					    Documents.ContrID,
						WarehouseIN.QuantityDoc,
						WarehouseIN.InPrice
			from WarehouseIN inner join documents on WarehouseIN.DocID = Documents.DocID
			where WarehouseIN.GoodsID = @GoodsID and WarehouseIn.ContrID = @ContrID
			and documents.docdate >=@DateFrom and Documents.DocDate <=@Dateto
	open tmp
	fetch next from tmp into @tmpDocID, @tmpG, @tmpC, @tmpQ, @tmpP
	while @@fetch_status = 0
		begin
			insert into #tmpStockCard select  @tmpG, @tmpC, @tmpDocID, @tmpQ, @tmpP
		fetch next from tmp into @tmpDocID, @tmpG, @tmpC, @tmpQ, @tmpP
		end
	close tmp
	deallocate tmp


	declare tmp cursor for select Documents.DocID,WarehouseOUT.GoodsID,
					    Documents.Contragent,
						0-WarehouseOUT.QuantityPercent,
						WarehouseOUT.OUTPrice
			from WarehouseOUT inner join documents on WarehouseOUT.DocID = Documents.DocID
			where WarehouseOUT.GoodsID = @GoodsID and WarehouseOUT.ContrID = @ContrID
			and documents.docdate >=@DateFrom and Documents.DocDate <=@Dateto
	open tmp
	fetch next from tmp into @tmpDocID, @tmpG, @tmpC, @tmpQ, @tmpP
	while @@fetch_status = 0
		begin
			insert into #tmpStockCard select  @tmpG, @tmpC, @tmpDocID, @tmpQ, @tmpP
		fetch next from tmp into @tmpDocID, @tmpG, @tmpC, @tmpQ, @tmpP
		end
	close tmp
	deallocate tmp



	update #tmpStockSaldo set EndQ = Saldo+isnull(QIN,0)-isnull(QOUT,0)+isnull((select sum(Quantity) from #tmpStockCard),0)
	update #tmpStockSaldo set EndP = SaldoPrice+isnull(PIN,0)-isnull(POUT,0)+isnull((select sum(Quantity*Price) from #tmpStockCard),0)

	
	insert into #tmpStockCard select @GoodsID,@ContrID,2,isnull((select sum(Quantity) from #tmpStockCard where Quantity > 0),0),isnull((select sum(Quantity*Price) from #tmpStockCard where Quantity > 0),0)
	insert into #tmpStockCard select @GoodsID,@ContrID,3,isnull((select sum(Quantity) from #tmpStockCard where Quantity < 0),0),isnull((select sum(Quantity*Price) from #tmpStockCard where Quantity < 0),0)
	insert into #tmpStockCard select @GoodsID,@ContrID,1,Saldo+isnull(QIN,0)-isnull(QOUT,0),SaldoPrice+isnull(PIN,0)-isnull(POUT,0) from #tmpStockSaldo	
	insert into #tmpStockCard select @GoodsID,@ContrID,4,EndQ, EndP from #tmpStockSaldo
	
	delete from documents where DocID = 1
	or DocID = 2 or DocID = 3 or DocID = 4
	SET IDENTITY_INSERT dbo.Documents ON
	INSERT INTO Documents(DocID,DocDate,ContrID, Contragent, Docutype, number, TypeNumber)
	VALUES(1,@DateTo, @ContrID, @ContrID,13,1000000,1)
	INSERT INTO Documents(DocID,DocDate,ContrID, Contragent, Docutype, number,TypeNumber)
	VALUES(2,@DateTo, @ContrID, @ContrID,14,2000000,1)
	INSERT INTO Documents(DocID,DocDate,ContrID, Contragent, Docutype, number,TypeNumber)
	VALUES(3,@DateTo, @ContrID, @ContrID,15,3000000,1)
	INSERT INTO Documents(DocID,DocDate,ContrID, Contragent, Docutype,number,TypeNumber)
	VALUES(4,@DateTo, @ContrID, @ContrID,16,4000000,1)
	SET IDENTITY_INSERT dbo.Documents OFF
	

select Documents.DocDate as DocDate, Documents.TypeNumber as TypeNumber, DocuType.[Type] as DocuType, Contragents.ContrName as Contragent,
round(#tmpStockCard.Quantity,3) as Quantity,
#tmpStockCard.Price as Price from #tmpStockCard left outer join documents 
on #tmpStockCard.DocID = documents.DocID left outer join Contragents
on #tmpStockCard.ContrId = Contragents.ContrID left outer join DocuType
on Documents.Docutype = DocuType.DocuTypeID
order by Documents.DocDate,Documents.Number

drop table  #tmpStockCard
drop table #tmpStockSaldo
end

GO
