USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_By_Operator]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[SP_Rep_Sell_By_Operator]
@DateFrom  datetime,
@DateTo datetime,
@ContrID int = 0
AS
BEGIN
if @ContrID = 0
begin
SELECT     ROUND(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * dbo.Cooking.InPrice), 3) AS InP, 
                      ROUND(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price)), 2) AS EndP, dbo.Operator.OpName
FROM         dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID INNER JOIN
                      dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo)
GROUP BY dbo.Operator.OpName
end
else
begin
SELECT     SUM(ROUND(dbo.Cooking.Quantity * dbo.Cooking.[Count] * dbo.Cooking.InPrice, 3)) AS InP, dbo.Contragents.ContrName, 
                      ROUND(SUM(dbo.Cooking.Quantity * dbo.Cooking.[Count] * ABS(dbo.Cooking.Price)),2) AS EndP, dbo.Operator.OpName
FROM         dbo.Contragents INNER JOIN
                      dbo.Accounts INNER JOIN
                      dbo.Documents ON dbo.Accounts.DocID = dbo.Documents.DocID INNER JOIN
                      dbo.Cooking ON dbo.Documents.DocID = dbo.Cooking.DocID ON dbo.Contragents.ContrID = dbo.Documents.ContrID INNER JOIN
                      dbo.Operator ON dbo.Accounts.OperatorID = dbo.Operator.OperatorID
WHERE     (dbo.Accounts.AccFinished = 1 AND dbo.Accounts.AccDate >=@DateFrom and dbo.Accounts.AccDate <= @DateTo and dbo.Contragents.ContrID = @ContrID)
GROUP BY dbo.Contragents.ContrName, dbo.Operator.OpName

end
END





GO
