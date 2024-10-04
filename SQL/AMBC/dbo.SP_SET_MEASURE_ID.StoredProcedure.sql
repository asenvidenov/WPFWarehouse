USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[SP_SET_MEASURE_ID]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<ASENSI,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SET_MEASURE_ID]
@MeID bigint
AS
BEGIN
begin tran
SET IDENTITY_INSERT dbo.Measure ON
delete from dbo.Measure WHERE MeasureID = @MeID
INSERT INTO dbo.Measure(MeasureID) Values(@MeID)
SET IDENTITY_INSERT dbo.Measure OFF
commit
END



GO
