USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_TAX_MAKE_GOODSTAX]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		SENSI
-- =============================================
CREATE PROCEDURE [dbo].[SP_TAX_MAKE_GOODSTAX] 
	@DocID int,
	@GoodsID int,
	@QuantityDoc real,
	@InPrice real,
	@TaxSum real=0 OUTPUT
AS
BEGIN
	declare @TaxID int
	declare @QorP bit
	declare @Coeff real
	declare @About real

--select @TaxID = (select TaxID from DocuTaxes where DocID = @DocID)

if exists (select GoodsTaxes.TaxID from GoodsTaxes
where GoodsTaxes.GoodsID = @GoodsID
and GoodsTaxes.Active = 1
--and GoodsTaxes.TaxID = @TaxID
)

begin
	declare tax cursor for select GoodsTaxes.TaxID from GoodsTaxes
							where GoodsTaxes.GoodsID = @GoodsID
							and GoodsTaxes.Active = 1
							--and GoodsTaxes.TaxID = @TaxID
	open tax
	fetch next from tax into @TaxID
	while @@Fetch_status=0
		begin
			
			select @QorP = (select isnull(QorP,0) from Taxes where TaxID = @TaxID)
			select @Coeff = (select isnull(Coeff,0) from Taxes where TaxID = @TaxID)
			select @About = (select isnull(About,0) from Taxes where TaxID = @TaxID)
			
			if @QorP=0
				begin
					select @TaxSum = isnull(@TaxSum,0) + isnull(round(@QuantityDoc*@Coeff/@About,2),0)
				end
			else
				begin
					select @TaxSum = isnull(@TaxSum,0) + isnull(round(@QuantityDoc*@InPrice*@Coeff/@About,2),0)
				end
			fetch next from tax into @TaxID
		end
	close tax
	deallocate tax
end
else
begin
--print 'do not exist'
	select @TaxSum = 0
end	
END



GO
