USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[amb_Login]    Script Date: 29.7.2024 17:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AV
-- Create date: 20240725
-- Description:	Add operator and hash password
-- =============================================
ALTER PROCEDURE [dbo].[amb_Login] 
	-- Add the parameters for the stored procedure here
	@opLogin nvarchar(20),
	@opPass nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT OperatorID, OpName, OpLevel, OpHash FROM Operator where OpLogin = @opLogin and OpHash= HASHBYTES('SHA2_512', @opLogin+@opPass+CAST(UID as nvarchar(36)))
END
