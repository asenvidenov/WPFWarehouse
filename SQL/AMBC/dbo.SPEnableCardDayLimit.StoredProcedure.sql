USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPEnableCardDayLimit]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[SPEnableCardDayLimit] AS
Declare @HolderID int
Declare @LimitDateToUse smalldatetime
Declare tmp CURSOR FOR
select HolderID, LimitDateToUse from tmpCardDayLimit

OPEN tmp

FETCH NEXT FROM tmp into @HolderID, @LimitDateToUse

WHILE @@FETCH_STATUS = 0
BEGIN
	
	delete from CardDayLimit where HolderID = @HolderID and LimitDateToUse = @LimitDateToUse
and LimitEnabled = 1
	update CardDayLimit set LimitEnabled = 0 where HolderID = @HolderID
   FETCH NEXT FROM tmp into @HolderID, @LimitDateToUse
END

CLOSE tmp
DEALLOCATE tmp
GO
