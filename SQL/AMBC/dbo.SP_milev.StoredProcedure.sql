USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_milev]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[SP_milev] 
	@OperatorID int,
	@datefrom nvarchar(10),
	@dateto nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @sql as nvarchar(max)
	SET NOCOUNT ON;
select  g.Code, g.[Description], 
round((select sum(quantity) from WarehouseIN where goodsid=g.goodsid and docid in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))),5) as inqty,
round((select sum(quantity*InPrice) from WarehouseIN where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))),5) as insum,
round((select sum(quantity*InPrice)/SUM(quantity) from WarehouseIN where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))),5) as inprice,
round((select SUM(quantity) from WarehouseOUT where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))),5) as outqty,
round((select SUM(quantity*outprice) from WarehouseOUT where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))),5) as outsum,
round((select SUM(quantity*[count]*price) from Cooking where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))), 5) as outprice,
round((select SUM(quantity*[count]*price) from Cooking where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))) - (select SUM(quantity*outprice) from WarehouseOUT where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))), 5) as diff,
round(((select SUM(quantity*[count]*price) from Cooking where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))) - (select SUM(quantity*outprice) from WarehouseOUT where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))))/(select SUM(quantity) from WarehouseOUT where goodsid=g.goodsid and DocID in (select docid from documents where DocDate >=@datefrom and DocDate <=@dateto and DocuType in (select DocuTypeid from DocuType where [Money]=1))),5) as diffbylitre
from goods g inner join tblmilev on g.GoodsID=tblMilev.goodsid and OperatorID=@OperatorID
order by tblmilev.ord

END
GO
