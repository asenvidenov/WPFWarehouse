USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_goods]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_add_goods]
	@parentid int,
	@goodsid int output,
	@code nvarchar(50) output
AS
BEGIN
	SET NOCOUNT ON;

	select @code=isnull((select top 1 code from goods where parent=@parentid),0)
	if @code=0
		begin
			select @code=(select code from goods where goodsid=@parentid)+'01' 
		end
	else
		begin
			select @code=(select max(cast(code as bigint)) from goods where goodsid=@parentid)+1
		end
	begin tran
		insert into goods (byreceipt,[group], parent,code) 
		values(0, 0, @parentID, 
		@code)
		select @goodsid=SCOPE_IDENTITY()
	commit tran
END
GO
