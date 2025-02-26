USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookByFood]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookByFood]
AS
SELECT     DocID, DietID, SUM(endprice) AS SumOfendprice
FROM         dbo.QueryCookByDiet
GROUP BY DocID, DietID

GO
