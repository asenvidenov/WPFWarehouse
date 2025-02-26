USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_Rep_Sell_Open_Account]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Rep_Sell_Open_Account]
@OpID int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @OpID = 0
	begin
		SELECT     Accounts.AccDate, Operator.OpName, Contragents.ContrName, ViewtmpCookingClientPrice.Code, ViewtmpCookingClientPrice.Description, 
        ViewtmpCookingClientPrice.Quantity, ViewtmpCookingClientPrice.Price, ViewtmpCookingClientPrice.CashPrice
		FROM         ViewtmpCookingClientPrice INNER JOIN
        Accounts INNER JOIN
        Operator ON Accounts.OperatorID = Operator.OperatorID ON ViewtmpCookingClientPrice.DocID = Accounts.DocID INNER JOIN
        WarehouseIN INNER JOIN
        Contragents ON WarehouseIN.ContrID = Contragents.ContrID ON ViewtmpCookingClientPrice.DocID = WarehouseIN.INID
		WHERE (Accounts.AccFinished = 0)  and (accounts.accdate > DATEADD(DAY, -1, DATEDIFF(DAY, -1, GETDATE())) and accounts.accdate < DATEADD(DAY, -1, DATEDIFF(DAY, -2, GETDATE())))
	end
else
	begin
		SELECT     Accounts.AccDate, Operator.OpName, Contragents.ContrName, ViewtmpCookingClientPrice.Code, ViewtmpCookingClientPrice.Description, 
        ViewtmpCookingClientPrice.Quantity, ViewtmpCookingClientPrice.Price, ViewtmpCookingClientPrice.CashPrice
		FROM         ViewtmpCookingClientPrice INNER JOIN
        Accounts INNER JOIN
        Operator ON Accounts.OperatorID = Operator.OperatorID ON ViewtmpCookingClientPrice.DocID = Accounts.DocID INNER JOIN
        WarehouseIN INNER JOIN
        Contragents ON WarehouseIN.ContrID = Contragents.ContrID ON ViewtmpCookingClientPrice.DocID = WarehouseIN.INID
		WHERE     (Accounts.OperatorID = @OpID) AND (Accounts.AccFinished = 0)  and (accounts.accdate > DATEADD(DAY, -1, DATEDIFF(DAY, -1, GETDATE())) and accounts.accdate < DATEADD(DAY, -1, DATEDIFF(DAY, -2, GETDATE())))
	end

END
GO
