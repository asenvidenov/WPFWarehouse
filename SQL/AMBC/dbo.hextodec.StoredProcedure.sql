USE [ambc]
GO
/****** Object:  StoredProcedure [dbo].[hextodec]    Script Date: 25.7.2024 20:18:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[hextodec] 
@hex0 bigint,
@hex1 bigint,
@hex2 bigint,
@hex3 bigint,
@hex4 bigint,
@hex5 bigint,
@hex6 bigint,
@hex7 bigint,
@hex8 bigint,
@hex9 bigint,
@strvalue bigint=0 output
AS
select @strvalue = 
@hex0 +
(@hex1*16)+
(@hex2*16*16)+
(@hex3*16*16*16)+
(@hex4*16*16*16*16)+
(@hex5*16*16*16*16*16)+
(@hex6*16*16*16*16*16*16)+
(@hex7*16*16*16*16*16*16*16)+
(@hex8*16*16*16*16*16*16*16*16)+
(@hex9*16*16*16*16*16*16*16*16*16)
select @strvalue as strvalue
GO
