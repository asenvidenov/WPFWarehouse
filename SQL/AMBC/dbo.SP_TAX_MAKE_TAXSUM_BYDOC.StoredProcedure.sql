USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_TAX_MAKE_TAXSUM_BYDOC]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		SENSI
-- =============================================
CREATE PROCEDURE [dbo].[SP_TAX_MAKE_TAXSUM_BYDOC] 
	@DocID int,
	@TaxSum real=0 OUTPUT
AS
BEGIN
	--SET NOCOUNT ON;
--if exists (select GoodsTaxes.TaxID from GoodsTaxes
--inner join DocuTaxes on GoodsTaxes.TaxId = DocuTaxes.TaxID
--where DocuTaxes.DocID = @DocID
--and GoodsTaxes.GoodsID = @GoodsID
--and GoodsTaxes.Active = 1)
if exists(select DocID from Cooking where DocID = @DocID)
	begin
		select @TaxSum = (select isnull(round(sum(isnull(TaxSum,0)),2),0) from Cooking
						where DocID = @DocID)
	end
END


GO
