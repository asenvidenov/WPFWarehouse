USE [ambc]
GO
/****** Object:  View [dbo].[View_DocCookSumDiffWIN]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_DocCookSumDiffWIN]
AS
SELECT     TOP (100) PERCENT dbo.Documents.TypeNumber, dbo.Contragents.ContrName, dbo.Documents.DocDate, dbo.DocuType.Type, 
                      dbo.Documents.ExtraInfo, ROUND(dbo.Documents.Sum, 2) AS DocSum, 
                      ROUND(SUM(dbo.Cooking.Quantity * dbo.Cooking.Count * ROUND(dbo.Cooking.InPrice, 3)), 2) AS CookSum
FROM         dbo.Documents INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID INNER JOIN
                      dbo.Contragents ON dbo.Documents.ContrID = dbo.Contragents.ContrID
WHERE     (dbo.DocuType.WIN <> 0)
GROUP BY dbo.Documents.TypeNumber, dbo.Documents.DocDate, dbo.DocuType.Type, dbo.Documents.ExtraInfo, ROUND(dbo.Documents.Sum, 2), 
                      dbo.Contragents.ContrName
HAVING      (ROUND(SUM(dbo.Cooking.Quantity * dbo.Cooking.Count * ROUND(dbo.Cooking.InPrice, 3)), 2) <> ROUND(dbo.Documents.Sum, 2))
ORDER BY dbo.Documents.TypeNumber

GO
