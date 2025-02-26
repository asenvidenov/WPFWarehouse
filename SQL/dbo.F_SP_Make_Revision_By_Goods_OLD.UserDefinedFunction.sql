USE [ambc]
GO
/****** Object:  UserDefinedFunction [dbo].[F_SP_Make_Revision_By_Goods_OLD]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<ASENSI>
-- Create date: <2006 07 14>
-- Description:	<NALICHNOSTI NA WSI4KI RAZMERI OT DADEN ARTIKUL PO VSI4KI OBEKTI>
-- =============================================
CREATE FUNCTION [dbo].[F_SP_Make_Revision_By_Goods_OLD]
(@GoodsID bigint)
RETURNS @tmpRevByGoods TABLE(ID bigint IDENTITY(1,1) primary key,GoodsID bigint,ContrID bigint, Saldo real, QIN real, QOUT real) 
AS
BEGIN
declare @tmpGoodsID bigint;
declare @Description nvarchar(50);

	set @Description = (select Description from goods where goodsid =  @GoodsID)
    declare W_cursor cursor for select GoodsID from goods where Description =  @Description
	open W_cursor
	fetch next from W_cursor into @tmpGoodsID
	while @@FETCH_STATUS =0
		begin
			insert @tmpRevByGoods
			select GoodsID, ContrID, Saldo, QIN, QOUT
			from Warehouse
			where GoodsID = @tmpGoodsID
			fetch next from W_cursor into @tmpGoodsID
		end
	close W_cursor
	deallocate W_cursor
RETURN 
end


GO
