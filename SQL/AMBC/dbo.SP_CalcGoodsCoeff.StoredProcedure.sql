USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_CalcGoodsCoeff]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<SENSI>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CalcGoodsCoeff] 
	-- Add the parameters for the stored procedure here
@GoodsID int,
@Temperature real,
@Quantity float,
@NewQ float OUTPUT
AS
declare @Coeff real
declare @CoeffMin real
declare @CoeffMax real
BEGIN
	SET NOCOUNT ON;
if exists(select ID from GoodsCoeff where GoodsID = @GoodsID and Temperature = @Temperature)
	begin
		select @Coeff = (select Coeff from GoodsCoeff where GoodsID = @GoodsID and Temperature = @Temperature)
	end
else
	begin
		if exists(select ID from GoodsCoeff where GoodsID = @GoodsID and Temperature < @Temperature)
			begin
				select @CoeffMin = (select max(Coeff) from GoodsCoeff
				where GoodsID = @GoodsID and Temperature < @Temperature)
			end
		else
			begin
				select @CoeffMin = 0
			end
		if exists(select ID from GoodsCoeff where GoodsID = @GoodsID and Temperature > @Temperature)
			begin
				select @CoeffMax = (select min(Coeff) from GoodsCoeff
				where GoodsID = @GoodsID and Temperature > @Temperature)
			end
		else
			begin
				select @CoeffMax = 0
			end
		if @CoeffMin = 0
			begin
				select @CoeffMin = @CoeffMax
			end
		if @CoeffMax = 0
			begin
				select @CoeffMax = @CoeffMin
			end
		if @CoeffMin = 0 and @CoeffMax = 0
			begin
				select @CoeffMin = 1
				select @CoeffMax = 1
			end
		select @Coeff = round((@CoeffMin+@CoeffMax)/2,5)
	end
	select @NewQ = round(@Quantity * @Coeff,5)
	return @NewQ
END

GO
