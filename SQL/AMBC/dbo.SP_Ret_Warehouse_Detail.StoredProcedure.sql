USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Ret_Warehouse_Detail]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SP_Ret_Warehouse_Detail] 
	@ParentID bigint = 0,
	@ContrID int = 0
AS
declare @tmpParentID bigint
BEGIN
	SET NOCOUNT ON;
		begin		
		insert into #Warehouse 
		SELECT 
				Contragents.ContrName, Goods.Code, Goods.Description, 
				Warehouse.Saldo + Warehouse.QIN - Warehouse.QOUT as Quantity
		from
				Warehouse inner join Goods on warehouse.GoodsId = Goods.GoodsID inner join
				Contragents on warehouse.ContrID = Contragents.ContrID
		WHERE
				Goods.Parent = @ParentID and
				warehouse.ContrID = @ContrID 
		end
	if exists(select goods.GoodsID from goods where goods.[Group]=1 And goods.Parent = @ParentID)
		begin
			declare checkparent cursor for select GoodsID from Goods Where Parent = @ParentID and [group]=1
			open checkparent
			fetch next from checkparent into @tmpParentID
				WHILE @@FETCH_STATUS = 0
					begin
						print @tmpParentID
						exec sp_ret_warehouse_Detail @tmpParentID, @ContrID
						fetch next from checkparent into @tmpParentID
					end
			close checkparent
			deallocate checkparent
		end
END



GO
