USE [ambc]
GO
/****** Object:  View [dbo].[QueryCashPrice]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryCashPrice]
AS
SELECT dbo.Goods.Code, dbo.Goods.Description, 
    dbo.Goods.CashCode, dbo.Goods.CashName, 
    dbo.tblCashPrice.CashPrice, dbo.tblCashPrice.CashEnabled, 
    dbo.tblCashPrice.CashDynamic, dbo.Contragents.ContrID, 
    dbo.Contragents.ContrName
FROM dbo.Goods INNER JOIN
    dbo.tblCashPrice ON 
    dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID INNER JOIN
    dbo.Contragents ON 
    dbo.tblCashPrice.ContrID = dbo.Contragents.ContrID
GO
