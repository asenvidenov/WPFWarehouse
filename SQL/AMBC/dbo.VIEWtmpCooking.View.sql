USE [ambc]
GO
/****** Object:  View [dbo].[VIEWtmpCooking]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWtmpCooking]
AS
SELECT     TOP (100) PERCENT dbo.tmpCooking.DocID, dbo.tblCashPrice.CashCode AS Code, dbo.tblCashPrice.CashName AS Description, 
                      SUM(dbo.tmpCooking.Quantity) AS Quantity, ABS(dbo.tmpCooking.Price) AS Price, dbo.tmpCooking.Count, dbo.tmpCooking.CookingID, 
                      dbo.tmpCooking.GoodsID
FROM         dbo.tblCashPrice INNER JOIN
                      dbo.tmpCooking ON dbo.tblCashPrice.GoodsID = dbo.tmpCooking.GoodsID INNER JOIN
                      dbo.Contragents ON dbo.tmpCooking.ContrID = dbo.Contragents.ContrID AND dbo.tblCashPrice.ContrID = dbo.Contragents.Parent
GROUP BY dbo.tmpCooking.DocID, dbo.tblCashPrice.CashCode, dbo.tblCashPrice.CashName, ABS(dbo.tmpCooking.Price), dbo.tmpCooking.Count, 
                      dbo.tmpCooking.CookingID, dbo.tmpCooking.GoodsID
ORDER BY dbo.tmpCooking.CookingID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[28] 2[6] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
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
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
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
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCashPrice"
            Begin Extent = 
               Top = 4
               Left = 617
               Bottom = 286
               Right = 785
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tmpCooking"
            Begin Extent = 
               Top = 11
               Left = 106
               Bottom = 280
               Right = 274
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Contragents"
            Begin Extent = 
               Top = 75
               Left = 376
               Bottom = 357
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2475
         Alias = 900
         Table = 1095
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWtmpCooking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWtmpCooking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWtmpCooking'
GO
