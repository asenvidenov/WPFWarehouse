-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AV
-- Create date: 20240725
-- Description:	Add operator and hash password
-- =============================================
CREATE PROCEDURE amb_CreateLogin 
	-- Add the parameters for the stored procedure here
	@opLogin nvarchar(20),
	@opPass nvarchar(10),
	@opName nvarchar(20),
	@opLevel int,
	@opID int=0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @UID UNIQUEIDENTIFIER = NewID()
	INSERT INTO Operator(OpLogin, OpPass, OpName, OpLevel, OpHash, UID) VALUES(@opLogin, @opPass, @opName, @opLevel, HASHBYTES('SHA_512', @opLogin+@opPass+CAST(@UID as nvarchar(36))), @UID)
	SET @opID=SCOPE_IDENTITY()
END
GO
