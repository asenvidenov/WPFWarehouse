USE [ambc]
GO
/****** Object:  View [dbo].[QueryCookValue]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryCookValue]
AS
SELECT DocID, SUM(ISNULL(Price * [COUNT] * Quantity, 0)) 
    AS Value
FROM dbo.QueryCook
GROUP BY DocID

GO
