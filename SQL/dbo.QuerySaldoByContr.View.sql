USE [ambc]
GO
/****** Object:  View [dbo].[QuerySaldoByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QuerySaldoByContr]
AS
SELECT     dbo.Saldo.SaldoID, dbo.Saldo.GoodsID, dbo.Saldo.ContrID, dbo.Saldo.Saldo, dbo.Saldo.SaldoPrice, dbo.Saldo.SaldoDoc, 
                      dbo.Saldo.SaldoDocPrice
FROM         dbo.Saldo INNER JOIN
                      dbo.Period ON dbo.Saldo.ContrID = dbo.Period.ContrID
GO
