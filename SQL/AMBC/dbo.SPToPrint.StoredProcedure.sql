USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPToPrint]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[SPToPrint]
AS SELECT     dbo.CashPrinter.PrintPort, dbo.Goods.CashCode, dbo.Goods.CashName, dbo.Cooking.[Count], dbo.tblPrinted.Printed
FROM         dbo.tblCashPrice INNER JOIN
                      dbo.Cooking INNER JOIN
                      dbo.Accounts INNER JOIN
                      dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID ON dbo.Cooking.DocID = dbo.Accounts.DocID INNER JOIN
                      dbo.tblPrinted ON dbo.Cooking.CookingID = dbo.tblPrinted.CookID ON dbo.tblCashPrice.GoodsID = dbo.Cooking.GoodsID INNER JOIN
                      dbo.Goods ON dbo.Cooking.GoodsID = dbo.Goods.GoodsID INNER JOIN
                      dbo.CashPrinter ON dbo.tblCashPrice.CashPrint = dbo.CashPrinter.ID
WHERE     (dbo.tblPrinted.Printed = 0)
GO
