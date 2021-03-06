USE [Escuela]
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarfacultad]    Script Date: 22/07/2020 09:36:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_modificarfacultad]
	@pIdFacultad			INT,
	@pCodigo				VARCHAR(10),
	@pNombre				VARCHAR(100),
	@pFechaCreacion			DATE,
	@pUniversidad			INT,
	@pCiudad				INT
AS
BEGIN
	UPDATE Facultad SET Codigo = @pCodigo, Nombre = @pNombre, FechaCreacion = @pFechaCreacion, Universidad =  @pUniversidad, IdCiudad = @pCiudad
	WHERE Id_Facultad = @pIdFacultad
END