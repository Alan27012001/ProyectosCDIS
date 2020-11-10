USE [Escuela]
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarFacultadPorId]    Script Date: 11/07/2020 05:08:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cargarFacultadPorCodigo]
	@pCodigo		VARCHAR(10)
AS
BEGIN 
	SELECT * FROM Facultad
	WHERE Codigo = @pCodigo
END