USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPCooking]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
Create Procedure [dbo].[SPCooking]
@lngdocid as int
As
	select * from dbo.Cooking where DocID = @lngdocid
	return
GO
