USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SPLetsPrintSerial]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SPLetsPrintSerial]
@DocID int,
@Op nvarchar(12),
@Ob int,
@ObParent int,
@PrintAll nvarchar(4000)
AS 
Declare @ComPort nvarchar(4);
Declare @PrintLine nvarchar(50);
Declare @PrintQuantity int;

INSERT INTO dbo.tblPrinted
                      (DocID, CookID, Printed)
SELECT     dbo.tmpCooking.DocID, dbo.tmpCooking.CookingID, ISNULL(dbo.tblPrinted.Printed, 0) AS Printed
FROM         dbo.tmpCooking LEFT OUTER JOIN
                      dbo.tblPrinted ON dbo.tmpCooking.CookingID = dbo.tblPrinted.CookID
WHERE     (ISNULL(dbo.tblPrinted.Printed, 0) = 0 AND dbo.tmpCooking.DocID = @DocID )

Select @PrintAll = (select UPPER(ContrName) from dbo.Contragents WHERE ContrID = @Ob)
Select @PrintAll = @PrintAll + '|' +UPPER(@Op)
Declare ToPort CURSOR FOR
SELECT dbo.CashPrinter.PrintPort
FROM dbo.Goods INNER JOIN
    dbo.tblCashPrice ON 
    dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID INNER JOIN
    dbo.tmpCooking ON 
    dbo.Goods.GoodsID = dbo.tmpCooking.GoodsID INNER JOIN
    dbo.CashPrinter ON 
    dbo.tblCashPrice.CashPrint = dbo.CashPrinter.ID INNER JOIN
    dbo.tblPrinted ON 
    dbo.tmpCooking.CookingID = dbo.tblPrinted.CookID
GROUP BY dbo.CashPrinter.PrintPort, dbo.tblPrinted.Printed, 
    dbo.tmpCooking.DocID, dbo.tblCashPrice.ContrID
HAVING (dbo.tblPrinted.Printed = 0) AND 
    (dbo.tmpCooking.DocID = @DocID) AND (dbo.tblCashPrice.ContrID = @ObParent)

Open ToPort
FETCH NEXT FROM ToPort INTO @ComPort
WHILE @@FETCH_STATUS = 0
BEGIN
Declare ToPrint CURSOR FOR
SELECT    cast(isnull(dbo.tblCashPrice.CashCode,' ') + ' ' + isnull(UPPER(dbo.tblCashPrice.CashName),' ') + ' * '  as nvarchar(32)) AS PrintLine, SUM(dbo.tmpCooking.Quantity)  as PrintQuantity
FROM dbo.Goods INNER JOIN
    dbo.tblCashPrice ON 
    dbo.Goods.GoodsID = dbo.tblCashPrice.GoodsID INNER JOIN
    dbo.tmpCooking ON 
    dbo.Goods.GoodsID = dbo.tmpCooking.GoodsID INNER JOIN
    dbo.CashPrinter ON 
    dbo.tblCashPrice.CashPrint = dbo.CashPrinter.ID INNER JOIN
    dbo.tblPrinted ON 
    dbo.tmpCooking.CookingID = dbo.tblPrinted.CookID 
GROUP BY dbo.tblCashPrice.CashCode, dbo.tblCashPrice.CashName, 
    dbo.CashPrinter.PrintPort, dbo.tblPrinted.Printed, 
    dbo.tmpCooking.DocID, dbo.tblCashPrice.ContrID
HAVING (dbo.tblPrinted.Printed = 0) AND 
    (dbo.tmpCooking.DocID = @DocID) AND (dbo.tblCashPrice.ContrID = @ObParent)
 AND (dbo.CashPrinter.PrintPort = @ComPort)
OPEN ToPrint
FETCH NEXT FROM ToPrint INTO @PrintLine, @PrintQuantity
WHILE @@FETCH_STATUS = 0

BEGIN
if (@PrintQuantity <=0)
Select @PrintAll = @PRintAll  + '|' +   @PrintLine + ' СТОРНО ' + CAST(@PrintQuantity as nvarchar)
else
Select @PrintAll = @PRintAll  + '|' +  @PrintLine  + CAST(@PrintQuantity as nvarchar)
FETCH NEXT FROM ToPrint INTO @PrintLine, @PrintQuantity
END
CLOSE ToPrint
DEALLOCATE ToPrint
select @PrintAll = @PrintAll + '|'
execute master..xp_serialprint @Comport, @PrintAll
dbcc xp_serialprint (free)
FETCH NEXT FROM ToPort INTO @ComPort
END
Close ToPort
Deallocate ToPort
update dbo.tblPrinted set Printed = 1 where DocID = @DocID










GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -8
      End
      Begin Tables = 
         Begin Table = "Goods"
            Begin Extent = 
               Top = 8
               Left = 423
               Bottom = 234
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCashPrice"
            Begin Extent = 
               Top = 37
               Left = 636
               Bottom = 285
               Right = 788
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tmpCooking"
            Begin Extent = 
               Top = 15
               Left = 239
               Bottom = 275
               Right = 391
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CashPrinter"
            Begin Extent = 
               Top = 253
               Left = 438
               Bottom = 400
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPrinted"
            Begin Extent = 
               Top = 65
               Left = 29
               Bottom = 347
               Right = 181
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1170
         Alias = 780
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'SPLetsPrintSerial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'SPLetsPrintSerial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'SPLetsPrintSerial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'SPLetsPrintSerial'
GO
