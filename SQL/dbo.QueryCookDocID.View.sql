USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookDocID]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookDocID]
AS
SELECT     DocID
FROM         dbo.Cooking
GROUP BY DocID

GO
