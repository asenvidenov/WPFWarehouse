USE [ambc]
GO
/****** Object:  View [dbo].[ViewCardHolders]    Script Date: 25.7.2024 20:18:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewCardHolders]
AS
SELECT     dbo.CardHolders.HolderNum, dbo.CardHolders.HolderName, dbo.CardHolders.HolderMiddle, dbo.CardHolders.HolderLast, 
                      dbo.CardHolders.HolderEgn, dbo.CardHolders.CardID, dbo.CardHolders.ContrID, dbo.Cards.CardNum
FROM         dbo.CardHolders INNER JOIN
                      dbo.Cards ON dbo.CardHolders.CardID = dbo.Cards.CardID INNER JOIN
                      dbo.Contragents ON dbo.CardHolders.ContrID = dbo.Contragents.ContrID

GO
