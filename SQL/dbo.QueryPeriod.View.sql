USE [ambc]
GO
/****** Object:  View [dbo].[QueryPeriod]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QueryPeriod]
AS
SELECT dbo.Period.InDate, dbo.Period.OutDate, dbo.Period.Active, 
    dbo.Contragents.Code, dbo.Contragents.ContrName, 
    Contragents_1.ContrName AS Expr1, 
    Contragents_2.ContrName AS Expr2, dbo.Period.DateFrom, 
    dbo.Period.Dateto
FROM dbo.Contragents INNER JOIN
    dbo.Period ON 
    dbo.Contragents.ContrID = dbo.Period.ContrID LEFT OUTER JOIN
    dbo.Contragents Contragents_1 ON 
    dbo.Contragents.Parent = Contragents_1.ContrID LEFT OUTER JOIN
    dbo.Contragents Contragents_2 ON 
    Contragents_1.Parent = Contragents_2.ContrID
WHERE (dbo.Period.Active = 1)
GO
