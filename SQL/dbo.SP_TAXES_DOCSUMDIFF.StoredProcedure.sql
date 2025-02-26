USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_TAXES_DOCSUMDIFF]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TAXES_DOCSUMDIFF]
	-- Add the parameters for the stored procedure here
	@DocID int
AS
BEGIN
declare @SumDiff real
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists(select docid from Cooking where docid=@docid)
		begin
		--	select round(isnull((select [SUM] from Documents where docid=@DocID),0),2)
		--	select round(isnull((select sum(realquantity*price) from cooking where docid=@docid),0),2)
			SELECT @SumDiff = round(isnull((select [SUM] from Documents where docid=@DocID),0),2) - sum(booksum) from Booking where docid=@docid and BookCredet in (4, 28, 37)
			if abs(@sumdiff)>0 
				begin
					insert into Booking(DocID,BookCredet,BookDebet,BookSum) VALUES(@DocID, 4,9, @SumDiff)
				end
		end
		delete from booking where booksum=0 and docid= @DocID
	--select @SumDiff
END
GO
