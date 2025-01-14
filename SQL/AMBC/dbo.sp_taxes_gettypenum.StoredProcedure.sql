USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[sp_taxes_gettypenum]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_taxes_gettypenum]
@docid int,
@newnum nvarchar(50) output
AS
BEGIN
update Documents set TypeNumber=
right('0000000000'+
			convert(nvarchar(50),isnull((select max(cast(typenumber as bigint)) 
from documents where docutype in (select docutype from documents where docid=@docid) and typenumber <1000000000),0)+1) 
,10)
			where docid=@docid 
	SET NOCOUNT ON;
select @newnum=(select typenumber from Documents where DocID=@docid)
END

GO
