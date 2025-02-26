USE [ambc]
GO
/****** Object:  View [dbo].[QueryGroup]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryGroup]
AS
SELECT     dbo.Goods.GoodsID, dbo.Goods.Code, dbo.Goods.Description, dbo.Goods.[Group], dbo.Goods.Parent, Goods_1.Code AS Expr1, 
                      Goods_1.Description AS Expr2
FROM         dbo.Goods INNER JOIN
                      dbo.Goods Goods_1 ON dbo.Goods.Parent = Goods_1.GoodsID
WHERE     (dbo.Goods.[Group] = - 1)

GO
