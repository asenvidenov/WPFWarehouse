USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPUpdateCashName]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SPUpdateCashName]
As
declare @GoodsID int;
Declare NewName cursor for
select goodsid from goods where [group] = 0 and byreceipt = 1

open newname
fetch next from newname into @Goodsid
while @@fetch_status = 0
begin
update goods set cashname = left(description,12) where goodsid = @goodsid
fetch next from newname into @goodsid
end

deallocate newname
close newname


GO
