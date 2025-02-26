USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_RECALC_PERIOD_LOCKDATE]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECALC_PERIOD_LOCKDATE]
@datefrom datetime,
@dateto datetime,
@GoodsID int
AS
declare @tmpGID int
declare @LockDate smalldatetime

BEGIN
SET NOCOUNT ON;

select @LockDate = (select top 1 LockDate from tblLockDate)

if @LockDate > @datefrom
	begin
		return
	end
	
	
	
	declare g cursor for select goodsid from warehouseout where outdate between @datefrom and @dateto group by goodsid 
	open g
	fetch next from g into @tmpGID
	while @@fetch_status=0
		begin
			exec SP_RECALC_PERIOD @datefrom, @dateto, @tmpGID
		fetch next from g into @tmpGID		
		end
	close g
	deallocate g
END
GO
