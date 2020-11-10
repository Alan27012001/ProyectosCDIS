USE [Escuela]
GO
/****** Object:  StoredProcedure [dbo].[sp_agregarfacultad]    Script Date: 22/07/2020 09:10:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_agregarfacultad]
	@pCodigo				VARCHAR(10),
	@pNombre				VARCHAR(100),
	@pFechaCreacion			DATE,
	@pUniversidad			INT,
	@pCiudad				INT
AS
BEGIN
	INSERT INTO Facultad VALUES(@pCodigo,@pNombre,@pFechaCreacion,@pUniversidad,@pCiudad)
END