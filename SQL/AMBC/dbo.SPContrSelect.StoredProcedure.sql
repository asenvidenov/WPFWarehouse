USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPContrSelect]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SPContrSelect]
@ContrID int=0
As
if @contrid > 0
begin
select Parent, Object from Object where Parent=@ContrID 
end
return

GO
