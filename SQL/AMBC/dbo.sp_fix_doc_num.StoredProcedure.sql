USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[sp_fix_doc_num]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_fix_doc_num]
	@docid bigint,
	@number nvarchar(50) output,
	@typenumber nvarchar(50) output
AS
BEGIN
	SET NOCOUNT ON;
	select @number = (select number from documents where docid=@docid)
	select @typenumber = (select typenumber from documents where docid=@docid)
	if exists(select count(docid) from documents group by number having number=@number and count(docid)>1)
		begin
			update documents set number=right('0000000000'+
			convert(nvarchar(50),isnull((select max(cast(number as bigint)) from documents where docutype not in (13,14,15,16)),0)+1),10)
			where docid=@docid and docutype not in (13,14,15,16)
		end
	if exists(select count(docid) from documents where docutype in (select docutype from documents where docid=@docid) group by typenumber having typenumber=@typenumber and count(docid)>1)
		begin
			update documents set typenumber=right('0000000000'+
			convert(nvarchar(50),isnull((select max(cast(typenumber as bigint)) from documents where docutype in (select docutype from documents where docid=@docid) and typenumber <1000000000),0)+1),10)
			where docid=@docid 
		end
	select @number = (select number from documents where docid=@docid)
	select @typenumber = (select typenumber from documents where docid=@docid)
END

GO
