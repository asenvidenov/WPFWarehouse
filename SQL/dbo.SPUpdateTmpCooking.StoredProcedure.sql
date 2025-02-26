USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPUpdateTmpCooking]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SPUpdateTmpCooking]
	@DocID int, 
	@GoodsID int,
	@Quantity real,
	@ContrID int
AS
BEGIN
	SET NOCOUNT ON;
begin tran
update tmpCooking set tmpCooking.Quantity = tmpCooking.Quantity + @Quantity
where tmpCooking.DocID = @DocID and tmpCooking.GoodsID = @GoodsID
if @@rowcount = 0
begin
	insert into tmpCooking(DocID, GoodsID,Quantity, [Count], Price,ContrID)
SELECT     DocID, GoodsID, Quantity, [Count], Price, @ContrID
FROM dbo.Cooking
where  
cooking.goodsid = @GoodsID and cooking.DocID = @DocID
end
commit tran
END



GO
