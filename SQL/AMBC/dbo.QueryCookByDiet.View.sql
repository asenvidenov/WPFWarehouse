USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookByDiet]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookByDiet]
AS
SELECT DocID, DietID, FoodID, SUM(Quantity * Price * [Count]) 
    AS endprice
FROM dbo.Cooking
GROUP BY DocID, DietID, FoodID

GO
