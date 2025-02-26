USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Make_Revision_Details_Active]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		<Asen,,Videnov>
-- Create date: <13 06 2006,,>
-- Description:	<Warehouse Revision By Period and Contragent,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Make_Revision_Details_Active]

@ParentID bigint,
@ContrID int
AS
declare @tmpParentID int
SET NOCOUNT ON
BEGIN
	insert into #tmpRevision
	SELECT Goods.Code, Goods.Description, tblWarehouse.Saldo+[QINBefore]-[QOUTBefore] AS tmpSaldo, 
	tblWarehouse.SaldoPrice+[PInBefore]-[POUTBefore] AS tmpSaldoPrice, 
	tblWarehouse.QINAfter, tblWarehouse.PINAfter, tblWarehouse.QOUTAfter, 
	tblWarehouse.POutAfter,round(tblWarehouse.Saldo+[QINBefore]-[QOUTBefore]+tblWarehouse.QINAfter-tblWarehouse.QOUTAfter,3) as EndQ,
	round(tblWarehouse.SaldoPrice+[PInBefore]-[POUTBefore]+tblWarehouse.PINAfter-tblWarehouse.POutAfter,3) as EndP
	FROM tblWarehouse INNER JOIN Goods 
	ON tblWarehouse.GoodsID = Goods.GoodsID
	WHERE
	(
	tblWarehouse.QINAfter <> 0 OR
	tblWarehouse.PINAfter <> 0 OR
	tblWarehouse.QOUTAfter <> 0 OR
	tblWarehouse.POutAfter <>0)
	AND dbo.Goods.Parent = @ParentID
	if exists(select goods.GoodsID from goods where goods.[Group]=1 And goods.Parent = @ParentID)
		begin
			declare checkparent cursor for select GoodsID from Goods Where Parent = @ParentID and [group]=1
			open checkparent
			fetch next from checkparent into @tmpParentID
				WHILE @@FETCH_STATUS = 0
					begin
						exec SP_Make_Revision_Details_Active @tmpParentID, @ContrID
						fetch next from checkparent into @tmpParentID
					end
			close checkparent
			deallocate checkparent
		end

END











GO
