USE [ambc]
GO
/****** Object:  View [dbo].[QueryBillINSum]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryBillINSum]
AS
SELECT     SUM([Sum]) AS SumOfSum, SUM(VAT) AS SumOfVAT, SUM(SumVAT) AS SumOfSumVAT, SUM([Real]) AS SumOfReal, SUM(Doc) AS SumOfDoc
FROM         dbo.QueryBillIN

GO
