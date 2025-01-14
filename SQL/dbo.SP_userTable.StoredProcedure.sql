USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_userTable]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SP_userTable] 
	@username nvarchar(128)
AS
BEGIN
declare @sqlstr as nvarchar(255)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF object_id(@username, 'U') is null
	begin
		select @sqlstr='create table '+@username+'(ID int IDENTITY(1,1) PRIMARY KEY, ord smallint, goodsid bigint)'
		exec sp_executesql @sqlstr
	end
END
GO
