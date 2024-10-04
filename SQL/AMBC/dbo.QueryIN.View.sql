USE [ambc]
GO
/****** Object:  View [dbo].[QueryIN]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryIN]
AS
SELECT     GoodsID, SUM([Real]) AS SumOfReal, SUM(QuantityDoc) AS SumOfQuantityDoc
FROM         dbo.QueryWarehouseIN
GROUP BY GoodsID


GO
