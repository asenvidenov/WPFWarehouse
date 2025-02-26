USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[fixcashprice]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Procedure [dbo].[fixcashprice]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As
	insert into dbo.tblcashprice(goodsid,cashprice,cashenabled,cashdynamic) 
	select goodsid,round(price,2),1,0
	from dbo.goods where byreceipt = 1 and price > 0
	return
GO
