USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPMiddlePrice]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPMiddlePrice]
@GoodsID int=0,
@MidPrice real =0 OUTPUT
AS
declare @tmpPrice real
Declare @tmpQuantity real
select @tmpPrice=(SELECT 
    ROUND(dbo.QueryINOUT.SaldoPrice, 3) 
    + ISNULL(ROUND(dbo.QueryMiddleInPrice.realinprice, 3), 0) 
    - ISNULL(ROUND(dbo.QueryMiddleOUTPrice.realoutprice, 3), 0) 
    AS Price
FROM dbo.QueryMiddleInPrice RIGHT OUTER JOIN
    dbo.QueryINOUT ON 
    dbo.QueryMiddleInPrice.GoodsID = dbo.QueryINOUT.GoodsID LEFT
     OUTER JOIN
    dbo.QueryMiddleOUTPrice ON 
    dbo.QueryINOUT.GoodsID = dbo.QueryMiddleOUTPrice.GoodsID
WHERE QueryINOUT.GoodsID = @GoodsID
)
select @tmpQuantity=(
SELECT ISNULL(dbo.QueryINOUT.[real], 0) AS [real]
FROM     dbo.QueryINOUT
WHERE QueryINOUT.GoodsID = @GoodsID
)

if @tmpPrice <> 0 and @tmpQuantity <> 0 
begin
select @MidPrice=@tmpPrice/@tmpQuantity
end
return @MidPrice

GO
