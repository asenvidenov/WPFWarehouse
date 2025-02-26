USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPopenaccounts]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[SPopenaccounts]
@OpID int = 0,
@ContrID int = 0
As
Declare @iter int;
if @OpID > 0 and @ContrID > 0
begin
select accounts.AccID, Documents.typenumber, Documents.DocID, Contragents.ContrID, contragents.contrname from accounts inner join documents on accounts.docid = documents.docid inner join contragents on
documents.contragent = contragents.contrid
  where accounts.operatorid = @OpID and accfinished=0
and
	contragents.contrid = @ContrID
order by accounts.AccID
end
	return 




GO
