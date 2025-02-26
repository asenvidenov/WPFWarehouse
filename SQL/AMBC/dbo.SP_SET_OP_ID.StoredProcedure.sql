USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_SET_OP_ID]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<ASENSI,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SET_OP_ID]
@OpID bigint
AS
BEGIN
begin tran
SET IDENTITY_INSERT dbo.Operator ON
delete from dbo.Operator WHERE OperatorID = @OpID
INSERT INTO dbo.Operator(OperatorID) Values(@OpID)
SET IDENTITY_INSERT dbo.Operator OFF
commit
END


GO
