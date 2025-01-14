USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_SET_REPLICA_ID]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<ASENSI,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SET_REPLICA_ID]
@GoodsID bigint,
@PArentID bigint
AS
BEGIN
begin tran
SET IDENTITY_INSERT dbo.Goods ON
delete from Goods WHERE GoodsID = @GoodsID
INSERT INTO Goods(GoodsID, ByReceipt,[Group], Parent) Values(@GoodsID,0,0,@ParentID)
SET IDENTITY_INSERT dbo.Goods OFF
commit
END

GO
