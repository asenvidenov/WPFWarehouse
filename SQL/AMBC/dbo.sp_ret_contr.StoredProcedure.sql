USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[sp_ret_contr]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ret_contr]
	@contrid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @tmpContrID int
insert into #tmpContr select @contrid
declare contr cursor for select ContrID from Contragents where Parent=@ContrID
	open contr
	fetch next from contr into @tmpContrID
	while @@FETCH_STATUS=0
		begin
			exec sp_ret_contr @tmpContrID
			fetch next from contr into @tmpContrID
		end
	close contr
	deallocate contr
END
GO
