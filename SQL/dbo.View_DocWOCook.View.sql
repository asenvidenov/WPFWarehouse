USE [ambc]
GO
/****** Object:  View [dbo].[View_DocWOCook]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_DocWOCook]
AS
SELECT     TOP (100) PERCENT dbo.Documents.TypeNumber, dbo.Contragents.ContrName, dbo.Documents.DocDate, dbo.DocuType.Type, 
                      dbo.Documents.ExtraInfo, ROUND(dbo.Documents.Sum, 2) AS Expr2
FROM         dbo.Documents INNER JOIN
                      dbo.DocuType ON dbo.Documents.DocuType = dbo.DocuType.DocuTypeID INNER JOIN
                      dbo.Contragents ON dbo.Documents.Contragent = dbo.Contragents.ContrID LEFT OUTER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID
WHERE     (dbo.Cooking.CookingID IS NULL) AND (NOT (dbo.Documents.DocID IN
                          (SELECT DISTINCT DocID
                            FROM          dbo.BookCooking)))
GROUP BY dbo.Documents.TypeNumber, dbo.Documents.DocDate, dbo.DocuType.Type, dbo.Documents.ExtraInfo, ROUND(dbo.Documents.Sum, 2), 
                      dbo.Contragents.ContrName
ORDER BY dbo.Documents.TypeNumber

GO
