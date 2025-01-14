USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_RET_MIN_COUNT]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<ASENSI,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RET_MIN_COUNT]
AS
BEGIN
	SET NOCOUNT ON;
select Goods.Code, Goods.Description, Goods.CashNAme, 
	warehouse.Saldo+warehouse.QIN - Warehouse.QOUT as Quant,
	tblMinCount.MinCount
from Goods inner join warehouse on goods.goodsid =
	warehouse.goodsid inner join tblmincount on goods.goodsid = tblmincount.goodsid
where
	warehouse.Saldo+warehouse.QIN - Warehouse.QOUT <=tblMinCount.MinCount
END

GO
