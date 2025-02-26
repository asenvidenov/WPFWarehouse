USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookByFoodPreview]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookByFoodPreview]
AS
SELECT     DocID, DietID, SUM(endprice) AS SumOfendprice
FROM         dbo.QueryCookByDietPreview
GROUP BY DocID, DietID

GO
