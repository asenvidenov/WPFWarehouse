USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[FIXCASHCODE]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE Procedure [dbo].[FIXCASHCODE]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
As 
	UPDATE DBO.GOODS SET CASHCODE = CODE, cashname = left(description,12)
	return
GO
