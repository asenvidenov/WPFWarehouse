USE [ambc]
GO
/****** Object:  View [dbo].[QuerySaldoInDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QuerySaldoInDate]
AS
SELECT     GoodsID, Saldo + realin - realout AS realsaldo, SaldoPrice + Inprice - Outprice AS realprice, Saldo + QuantityDoc - QuantityPercent AS docsaldo, 
                      SaldoPrice + InDocprice - OutDocprice AS docprice
FROM         dbo.QuerySaldoInDateDetail
GO
