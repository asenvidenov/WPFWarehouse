USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_RET_SALDO_BY_DATE]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_RET_SALDO_BY_DATE]
@datefrom datetime,
@GoodsID int,
@NewQuantity float = 0 OUTPUT,
@NewPrice float =0 OUTPUT
AS
select @NewPrice = isnull((select sum(isnull(SaldoDocPrice,0)) from saldo where GoodsID = @GoodsID),0)
select @NewPrice = @NewPrice+isnull((select Sum(isnull(InPrice,0)*isnull(QuantityDoc,0)) from warehousein inner join documents
								on warehousein.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.wout = 0
								and docutype.win = 1
								and (docutype.money = 1 or docutype.excise is not null)
								and docutype.transport = 0
								and documents.docdate <@datefrom
								and goodsid = @goodsid),0)

select @NewPrice = @NewPrice -isnull((select Sum(isnull(OUTPrice,0)*isnull(QuantityPercent,0)) from warehouseout inner join documents
								on warehouseout.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.win = 0
								and docutype.wout = 1
								and (docutype.money = 1 or docutype.excise is not null)
								and docutype.transport = 0
								and documents.docdate <@datefrom
								and goodsid = @goodsid),0)

select @NewQuantity = isnull((select sum(isnull(SaldoDoc,0)) from Saldo where GoodsID = @GoodsID),0)
select @NewQuantity = @NewQuantity+isnull((select Sum(isnull(QuantityDoc,0)) from warehousein inner join documents
								on warehousein.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.wout = 0
								and docutype.win = 1
								and (docutype.money = 1 or docutype.excise is not null)
								and docutype.transport = 0
								and documents.docdate <@datefrom
								and goodsid = @goodsid),0)
select @NewQuantity = @NewQuantity-isnull((select Sum(isnull(QuantityPercent,0)) from warehouseout inner join documents
								on warehouseout.docid = documents.docid inner join docutype
								on documents.docutype = docutype.docutypeid
								where docutype.win = 0
								and docutype.wout = 1
								and (docutype.money = 1 or docutype.excise is not null)
								and docutype.transport = 0
								and documents.docdate <@datefrom
								and goodsid = @goodsid),0)


select @NewQuantity,@NewPrice 


GO
