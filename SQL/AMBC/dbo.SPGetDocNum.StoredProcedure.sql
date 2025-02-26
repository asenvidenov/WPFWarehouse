USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPGetDocNum]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPGetDocNum]
@Object int,
@DocuType int,
@ContrID int,
@NewID int =0 OUTPUT
 AS
if @ContrID = 0 select ContrID=@Object
begin tran
INSERT INTO DOCUMENTS(ContrID, DocDate, DocuType, Contragent) VALUES (@Object, GETDATE(), @DocuType, @ContrID)
Select @NewID = @@IDENTITY
commit

GO
