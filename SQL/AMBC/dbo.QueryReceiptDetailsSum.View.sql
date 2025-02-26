USE [ambc]
GO
/****** Object:  View [dbo].[QueryReceiptDetailsSum]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QueryReceiptDetailsSum]
AS
SELECT     ReceiptID, SUM(ROUND(InPrice * Quantity * Coeff / [Count], 3)) AS EndPrice
FROM         dbo.QueryReceiptDetails
GROUP BY ReceiptID

GO
