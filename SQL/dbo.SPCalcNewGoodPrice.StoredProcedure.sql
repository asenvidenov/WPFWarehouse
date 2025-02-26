USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPCalcNewGoodPrice]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPCalcNewGoodPrice]
@GoodsID int,
@MidPrice real =0 OUTPUT
AS
declare @NewPrice real
declare @NewQuantity real
select @NewPrice = (select Price from QueryMiddleINOUT where GoodsID = @GoodsID)
select @NewQuantity = (select [Real] from QueryMiddleINOUT where GoodsID = @GoodsID)
if @NewPrice <> 0 or @NewQuantity <> 0
begin
select @MidPrice = @NewPrice/@NewQuantity
if @MidPrice <> 0
begin
update goods set price = abs(round(@midprice,5)) where goodsid = @GoodsID
update tblCashPrice set CashPrice = abs(round(@midprice*Discount,2)) where goodsid = @GoodsID and CashDynamic = 1
end
end
return


GO
