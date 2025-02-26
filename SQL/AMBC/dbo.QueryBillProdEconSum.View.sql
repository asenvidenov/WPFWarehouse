USE [ambc]
GO
/****** Object:  View [dbo].[QueryBillProdEconSum]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryBillProdEconSum]
AS
SELECT     SUM([Sum]) AS SumOfSum, SUM(VAT) AS SumOfVAT, SUM(SumVAT) AS SumOfSumVAT
FROM         dbo.QueryBillProdEcon

GO
