USE [ambc]
GO
/****** Object:  View [dbo].[VIEWCooking]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEWCooking]
AS
SELECT     dbo.Cooking.DocID, dbo.Documents.DocDate, dbo.Goods.GoodsID, dbo.Goods.CashCode AS Code, dbo.Goods.CashName AS Description, 
                      dbo.measure.Measure, dbo.Diets.DietNum, dbo.Diets.DietDescription, dbo.Food.FoodDesc, SUM(dbo.Cooking.Quantity) AS Quantity, 
                      ABS(dbo.Cooking.Price) AS Price, dbo.Goods.ByReceipt, dbo.Documents.ContrID, dbo.Food.FoodID, dbo.Cooking.InPrice, dbo.Cooking.HiddenPercent, 
                      dbo.Cooking.Count, dbo.Diets.DietID
FROM         dbo.Documents INNER JOIN
                      dbo.Diets INNER JOIN
                      dbo.Food INNER JOIN
                      dbo.Cooking ON dbo.Food.FoodID = dbo.Cooking.FoodID INNER JOIN
                      dbo.measure INNER JOIN
                      dbo.Goods ON dbo.measure.MeasureID = dbo.Goods.Measure ON dbo.Cooking.GoodsID = dbo.Goods.GoodsID ON 
                      dbo.Diets.DietID = dbo.Cooking.DietID ON dbo.Documents.DocID = dbo.Cooking.DocID
GROUP BY dbo.Cooking.DocID, dbo.Documents.DocDate, dbo.Goods.GoodsID, dbo.Goods.CashCode, dbo.Goods.CashName, dbo.measure.Measure, 
                      dbo.Diets.DietNum, dbo.Diets.DietDescription, dbo.Food.FoodDesc, ABS(dbo.Cooking.Price), dbo.Goods.ByReceipt, dbo.Documents.ContrID, 
                      dbo.Food.FoodID, dbo.Cooking.InPrice, dbo.Cooking.HiddenPercent, dbo.Cooking.Count, dbo.Diets.DietID
HAVING      (SUM(dbo.Cooking.Quantity) > 0)
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
         Configuration = "(H (1[41] 4) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -8
      End
      Begin Tables = 
         Begin Table = "Documents"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Diets"
            Begin Extent = 
               Top = 0
               Left = 514
               Bottom = 115
               Right = 683
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Food"
            Begin Extent = 
               Top = 193
               Left = 35
               Bottom = 293
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cooking"
            Begin Extent = 
               Top = 220
               Left = 369
               Bottom = 534
               Right = 537
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "measure"
            Begin Extent = 
               Top = 21
               Left = 319
               Bottom = 106
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Goods"
            Begin Extent = 
               Top = 499
               Left = 516
               Bottom = 614
               Right = 699
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
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWCooking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
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
         Column = 2235
         Alias = 2295
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWCooking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWCooking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VIEWCooking'
GO
