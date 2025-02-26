USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_TAXES_RECAPITULATION]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<SENSI>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_TAXES_RECAPITULATION]
	@DocuTypeID int,
	@DateFrom smalldatetime,
	@DateTo smalldatetime
AS
BEGIN
	SET NOCOUNT ON;
select goods.code, goods.description, sum(cooking.quantity*cooking.[count]) as qty, sum(cooking.quantity*cooking.[count]* case when cooking.price=0 then cooking.inprice else cooking.price end) as qtyprice
from
cooking inner join documents
on documents.docid = cooking.docid
inner join goods
on goods.goodsid = cooking.goodsid
where
documents.docdate >=@DateFrom
and documents.docdate <=@DateTo
and documents.docutype = @docutypeid
and 
(documents.docid in (select distinct docid from warehouseout) or documents.docid in (select distinct docid from warehousein))
group by goods.code, goods.description
END

GO
