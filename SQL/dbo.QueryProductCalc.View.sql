USE [ambc]
GO
/****** Object:  View [dbo].[QueryProductCalc]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryProductCalc]
AS
SELECT     TOP 100 PERCENT FoodID, FoodDesc, DocID, Code, Description, SUM([Real]) AS SumOfReal, SUM(RealQuantity) AS SumOfRealQuantity, Measure, 
                      ContrID
FROM         dbo.QueryCalculationReal
GROUP BY FoodID, FoodDesc, DocID, Code, Description, Measure, ContrID
ORDER BY FoodID, Description

GO
