USE [ambc]
GO
/****** Object:  View [dbo].[QueryINByContr]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryINByContr]
AS
SELECT     GoodsID, SUM(SumOfReal) AS [Real], SUM(SumOfQuantityDoc) AS QuantityDoc, MAX(ContrID) AS MaxOfContrID, SUM(inValue) AS ValueIN
FROM         dbo.QueryINByContrGrouped
GROUP BY GoodsID
GO
