USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[sp_taxes_getdocnum]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_taxes_getdocnum]
@newnum as nvarchar(50) output 
AS
BEGIN
select @newnum=(select right('0000000000'+convert(nvarchar(50),isnull((select max(cast(number as bigint)) from documents where docutype not in (13,14,15,16)),0)+1),10))
	SET NOCOUNT ON;
END
GO
