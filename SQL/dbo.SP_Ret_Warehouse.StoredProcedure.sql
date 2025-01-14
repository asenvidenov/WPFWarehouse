USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Ret_Warehouse]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SP_Ret_Warehouse] 
	@ParentID bigint,
	@ContrID int = 0
AS
BEGIN
	create table #Warehouse(ID int IDENTITY(1,1) PRIMARY KEY, ContrName nvarchar(25), 
							Code nvarchar(50), Description nvarchar(50), Quantity real)
	exec sp_ret_warehouse_Detail @ParentID, @ContrID
	select ContrName, Code, Description, Quantity from #Warehouse	
END





GO
