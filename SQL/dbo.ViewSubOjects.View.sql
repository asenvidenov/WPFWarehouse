USE [ambc]
GO
/****** Object:  View [dbo].[ViewSubOjects]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewSubOjects]
AS
SELECT     dbo.Contragents.ContrID
FROM         dbo.Contragents INNER JOIN
                      dbo.Object ON dbo.Contragents.ContrID = dbo.Object.Parent

GO
