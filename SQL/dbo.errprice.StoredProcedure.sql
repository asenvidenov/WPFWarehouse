USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[errprice]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[errprice] 
@Delimo real,
@Delitel real,
@Resultat real =0 OUTPUT
AS
if @Delimo = 0 or @Delitel = 0
	select @Resultat
else
	select @Resultat = @Delimo/@Delitel
return @Resultat
GO
