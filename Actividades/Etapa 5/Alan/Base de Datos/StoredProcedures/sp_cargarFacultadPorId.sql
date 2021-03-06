USE [Escuela]
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarFacultadPorId]    Script Date: 22/07/2020 09:28:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_cargarFacultadPorId]
	@pIdFacultad		INT
AS
BEGIN 
	SELECT f.Id_Facultad, f.Codigo, F.Nombre,F.FechaCreacion, f.Universidad, f.IdCiudad, c.IdEstado, e.IdPais
	FROM Facultad f 
	JOIN Ciudad c ON f.IdCiudad = c.Id JOIN Estado e ON e.Id = c.IdEstado
	WHERE Id_Facultad = @pIdFacultad
END