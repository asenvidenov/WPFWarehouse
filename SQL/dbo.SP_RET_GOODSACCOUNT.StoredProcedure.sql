USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_RET_GOODSACCOUNT]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_RET_GOODSACCOUNT]
	@GoodsID int=0,
	@BookAcc int =0 OUTPUT,
	@AccNum nvarchar(50)='' OUTPUT,
	@BookAccOUT int=0 OUTPUT,
	@AccNUMOUT nvarchar(50)='' OUTPUT
AS
BEGIN
declare @Parent int
create table #GA(ID int IDENTITY(1,1) PRIMARY KEY, BookAcc int null, BookAccOUT int null)
SET NOCOUNT ON;
if @GoodsID not in(select GoodsID from GoodsAccounts)
	begin
		select @Parent = (select Parent from Goods where GoodsID = @GoodsID)
		if @Parent <>0
			begin
				exec SP_RET_GOODSACCOUNT_DETAILS @Parent,0
			end
	end
else
	begin
	print @GoodsID
		insert into #GA Select BookAcc, BookAccOUT from GoodsAccounts where GoodsID = @GoodsID
	end
select @BookAcc=(select BookAcc from #GA)
select @BookAccOUT=(select BookAccOUT from #GA)
select @AccNum = (select AccNum from BookAccounts where BookID = @BookAcc)
select @AccNumOUT = (select AccNum from BookAccounts where BookID = @BookAccOUT)
drop table #GA
END


GO
