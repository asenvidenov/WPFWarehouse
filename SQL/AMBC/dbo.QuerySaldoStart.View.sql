USE [ambc]
GO
/****** Object:  View [dbo].[QuerySaldoStart]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QuerySaldoStart]
AS
SELECT     SUM(Saldo * SaldoPrice) AS SaldoStart
FROM         dbo.Goods

GO
