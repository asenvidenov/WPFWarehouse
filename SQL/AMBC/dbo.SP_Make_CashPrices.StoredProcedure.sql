USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Make_CashPrices]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Make_CashPrices] 
AS
	declare @GoodsID int
	declare @Price real
	declare @Barcode nvarchar(50)
	DECLARE @CashName nvarchar(12)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	declare make_cash cursor for select GoodsID, SaldoPercentPrice, CashCode,Left(Description,12) as tmpdesc from goods where [group]=0
open make_cash
fetch next from make_cash into @GoodsID, @Price, @Barcode, @CashName
while @@Fetch_status=0
begin
	insert into tblCashPrice(GoodsID, CashPrice,Discount,CashEnabled,CashDynamic,Coeff,CashCode,CashName)
	values (@GoodsID, @Price,0,1,0,1,@Barcode,@Cashname)
	fetch next from make_cash into @GoodsID, @Price, @Barcode, @CashName
end

close make_cash
deallocate make_cash
END

GO
