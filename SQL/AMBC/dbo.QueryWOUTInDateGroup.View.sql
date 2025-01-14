USE [ambc]
GO
/****** Object:  View [dbo].[QueryWOUTInDateGroup]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryWOUTInDateGroup]
AS
SELECT     ISNULL(SUM([Real]), 0) AS realout, ISNULL(SUM([Real] * OutPrice), 0) AS Outprice, ISNULL(SUM(QuantityPercent), 0) AS QuantityPercent, 
                      ISNULL(SUM(QuantityPercent * OutPrice), 0) AS OutDocprice, GoodsID
FROM         dbo.QueryWOUTInDate
GROUP BY GoodsID

GO
