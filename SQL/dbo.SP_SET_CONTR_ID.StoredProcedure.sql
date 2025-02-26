USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_SET_CONTR_ID]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<ASENSI,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SET_CONTR_ID]
@ContrID bigint,
@ParentID bigint
AS
BEGIN
begin tran
SET IDENTITY_INSERT dbo.Contragents ON
delete from dbo.Contragents WHERE ContrID = @ContrID
INSERT INTO dbo.Contragents(ContrID, Parent) Values(@ContrID,@ParentID)
SET IDENTITY_INSERT dbo.Contragents OFF
commit
END


GO
