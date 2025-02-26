USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Make_Revision_Details]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
















-- =============================================
-- Author:		<Asen,,Videnov>
-- Create date: <13 06 2006,,>
-- Description:	<Warehouse Revision By Period and Contragent,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Make_Revision_Details]

@ParentID bigint,
@ContrID int
AS
declare @tmpParentID int
SET NOCOUNT ON
BEGIN
		insert into #tmpRevision
		SELECT Goods.Code, Goods.Description, sum(#tmpWarehouse.Saldo)+sum([QINBefore])-sum([QOUTBefore]) AS tmpSaldo, 
		sum(#tmpWarehouse.SaldoPrice)+sum([PInBefore])-sum([POUTBefore]) AS tmpSaldoPrice, 
		sum(#tmpWarehouse.QINAfter), sum(#tmpWarehouse.PINAfter), sum(#tmpWarehouse.QOUTAfter), 
		sum(#tmpWarehouse.POutAfter),round(sum(#tmpWarehouse.Saldo)+sum([QINBefore])-sum([QOUTBefore])+sum(#tmpWarehouse.QINAfter)-sum(#tmpWarehouse.QOUTAfter),3) as EndQ,
		round(sum(#tmpWarehouse.SaldoPrice)+sum([PInBefore])-sum([POUTBefore])+sum(#tmpWarehouse.PINAfter)-sum(#tmpWarehouse.POutAfter),3) as EndP,
		max(#tmpWarehouse.ParentID)
		FROM #tmpWarehouse INNER JOIN Goods 
		ON #tmpWarehouse.GoodsID = Goods.GoodsID
		WHERE
		dbo.Goods.Parent = @ParentID
		and dbo.#tmpWarehouse.ContrID in (select ContrID from #tmpContr)
		GROUP BY Goods.Code, Goods.Description

	if exists(select goods.GoodsID from goods where goods.[Group]=1 And goods.Parent = @ParentID)
		begin
			declare checkparent cursor for select GoodsID from Goods Where Parent = @ParentID and [group]=1
			open checkparent
			fetch next from checkparent into @tmpParentID
				WHILE @@FETCH_STATUS = 0
					begin
	--PRINT @TMPPARENTID
						exec SP_Make_Revision_Details @tmpParentID, @ContrID
						fetch next from checkparent into @tmpParentID
					end
			close checkparent
			deallocate checkparent
		end

END
















GO
