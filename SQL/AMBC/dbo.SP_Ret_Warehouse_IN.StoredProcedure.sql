USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Ret_Warehouse_IN]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Asensi,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Ret_Warehouse_IN]
@DateFrom smalldatetime,
@DateTo smalldatetime,
@ContrID int = 0,
@Contrag int = 0,
@GoodsID bigint = 0,
@Size nvarchar(10)=Null,
@GoodsName nvarchar(50) = Null,
@DocuType int = 0
AS
BEGIN
	SET NOCOUNT ON;
		create table #tmpWarehouseIN (ID bigint IDENTITY(1,1) primary key,
							    GoodsID bigint,
								DocID int,
								Quantity real,
								Price real)
-- Wsi4ki dostaw4ici
if @ContrID = 0
	begin --@ContrID = 0
		if @Contrag = 0
			begin --@Contrag = 0
				if @DocuType = 0
					begin --@DocuType = 0
						if @Size is null
							begin --size is null
								insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
							end --size is null
						else
							begin --size not null
								insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Goods.CashName like N'%@Size%'
							end --size not null
					end --@DocuType = 0
				else
					begin --@DocuType not 0
							if @Size is null
								begin --size is null
									insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
									inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
									where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
									and dbo.Documents.Docutype = @DocuType
								end
							else
								begin --size not null
									insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
									inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
									inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
									where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
									and dbo.Documents.Docutype = @DocuType
									and dbo.Goods.CashName like N'%@Size%'
								end --size not null
					end --@DocuType not 0
			end --@Contrag = 0
		else
			begin --Contrag not 0
					if @DocuType = 0
						begin --@DocuType = 0
								if @Size is null
									begin --seze is null
										insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
										inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
										where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
										and dbo.Documents.Contragent = @Contrag
									end --size is null
								else
									begin --size not null
										insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
										inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
										inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
										where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
										and dbo.Documents.Contragent = @Contrag
										and dbo.Goods.CashName like N'%@Size%'
									end --size not null
						end --@DocuType = 0
					else
						begin --@DocuType not 0
								if @Size is null
									begin --size isnull
										insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
										inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
										where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
										and dbo.Documents.Contragent = @Contrag
										and dbo.Documents.DocuType = @DocuType
									end --size is null
								else
									begin --size not null
										insert into #tmpWarehouseIN select dbo.Warehousein.GoodsID, dbo.Warehousein.DocID, dbo.Warehousein.QuantityDoc, dbo.Warehousein.InPrice from dbo.Warehousein
										inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
										inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
										where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
										and dbo.Documents.Contragent = @Contrag
										and dbo.Documents.DocuType = @DocuType
										and dbo.Goods.CashName like N'%@Size%'
									end --сизе нот нулл
						end --@DocuType not 0
			end --Contrag not 0	
end --contrID = 0	
else
	begin --contrid not 0
		if @Contrag = 0
			begin --contrag = 0
				if @DocuType = 0
					begin --dt=0
						if @Size is null
							begin --size is null
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
							end --size is null
						else
							begin --size not null
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
								and dbo.Goods.CashName like N'%@Size%'
							end --size not null
					end --dt=0
				else
					begin --dt not 0
						if @Size is null
							begin --size is null
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
								and dbo.Documents.DocuType = @DocuType
							end --size isnull
						else
							begin --size not null
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
								and dbo.Documents.DocuType = @DocuType
								and dbo.Goods.CashName like N'%@Size%'
							end --size not null
					end --dt not 0
			end --Contrag =0
		else
			begin --Contrag not 0
				if @DocuType = 0
					begin --dt =0
						if @Size is null
							begin --size ios null
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
								and dbo.Documents.Contragent = @Contrag
							end --size is null
						else
							begin --size not null
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
								and dbo.Documents.Contragent = @Contrag
								and dbo.Goods.CashName like N'%@Size%'
							end --size not null
					end --dt =0
				else
					begin --dt  нот 0
						if @Size is null
							begin
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
								and dbo.Documents.Contragent = @Contrag
								and dbo.Documents.DocuType = @DocuType
							end --size is null
						else
							begin
								insert into #tmpWarehouseIN select dbo.WarehouseIN.GoodsID, dbo.WarehouseIN.DocID, dbo.WarehouseIN.QuantityDoc, dbo.WarehouseIN.InPrice from dbo.Warehousein
								inner join dbo.Documents on dbo.WarehouseIN.DocID = dbo.Documents.DocID
								inner join dbo.Goods on dbo.WarehouseIN.GoodsID = dbo.Goods.GoodsID
								where dbo.WarehouseIN.InDate >=@DateFrom and dbo.WarehouseIN.InDate <=@DateTo
								and dbo.Documents.ContrID = @ContrID
								and dbo.Documents.Contragent = @Contrag
								and dbo.Documents.DocuType = @DocuType
								and dbo.Goods.CashName like N'%@Size%'
							end --size not null
					end --dt <> 0
			end --Contrag not 0
	end --contrid		not 0
select * from #tmpWarehouseIN 
drop table #tmpWarehouseIN
END
GO
