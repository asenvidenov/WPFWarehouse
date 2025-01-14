USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_TAXES_CALC_DENSITY]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_TAXES_CALC_DENSITY]
	@vt float,
	@t real,
	@d15 real,
	@v15 float= 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
declare @dt real
declare @dmin real
declare @dmax real
declare @d15min real
declare @d15max real
IF not exists(select temp from tblDensity where temp = @t)
	begin
		select @t = (select max(temp) from tbldensity where temp < @t)
	end
if exists(select d15 from tblDensity where dt = @d15 and temp=@t)
	begin
		select @dt = (select d15 from tblDensity where dt = @d15 and temp=@t)
	end
else
	begin
		select @d15min  = (select  max(dt) from tblDensity where dt < @d15 and temp = @t)
		select @d15max  = (select min(dt) from tblDensity where dt > @d15 and temp = @t)
		select @dmin  = (select  max(d15) from tblDensity where dt = @d15min and temp = @t)
		select @dmax  = (select min(d15) from tblDensity where dt = @d15max and temp = @t)	
	select @dt = @dmin+((@dmax-@dmin)*(@d15-@d15min))/(@d15max-@d15min)
	end
select @v15 = round(@vt*(@d15/@dt),3)
select @v15
END

GO
