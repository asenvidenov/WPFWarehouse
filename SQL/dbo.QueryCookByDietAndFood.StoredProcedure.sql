USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[QueryCookByDietAndFood]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[QueryCookByDietAndFood]  
@ContrID int,
@DocID int

AS
SELECT dbo.QueryCookByFood.SumOfendprice AS Value, 
        dbo.QueryCookByFood.DocID AS FDoc
FROM dbo.QueryCookByFood 
GROUP BY     dbo.QueryCookByFood.SumOfendprice, 
    		dbo.QueryCookByFood.DocID
HAVING 
    (dbo.QueryCookByFood.DocID = @DocID)
GO
