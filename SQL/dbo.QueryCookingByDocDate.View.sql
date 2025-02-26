USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookingByDocDate]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookingByDocDate]
AS
SELECT     dbo.Documents.DocID, dbo.Cooking.CookingID, dbo.Documents.DocDate
FROM         dbo.Cooking INNER JOIN
                      dbo.Documents ON dbo.Cooking.DocID = dbo.Documents.DocID

GO
