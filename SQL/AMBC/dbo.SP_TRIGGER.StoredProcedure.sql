USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_TRIGGER]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TRIGGER] 
@enable bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if @enable=0
	begin
		disable trigger wout_tax_trigger on warehouseout
	end
else
	begin
		enable trigger wout_tax_trigger on warehouseout
	end
END
GO
