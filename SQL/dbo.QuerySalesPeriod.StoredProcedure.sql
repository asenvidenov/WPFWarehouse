USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[QuerySalesPeriod]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QuerySalesPeriod] AS
SELECT Period.InDate, Period.Dateto
FROM Period
GO
