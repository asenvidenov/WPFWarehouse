USE [ambc]
GO
/****** Object:  View [dbo].[QueryProductionCookByDoc]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryProductionCookByDoc]
AS
SELECT     DocID
FROM         dbo.Cooking
GROUP BY DocID

GO
