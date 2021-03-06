USE [Escuela]
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarFacultades]    Script Date: 22/07/2020 09:44:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_cargarFacultades]	
AS
BEGIN
	SELECT f.Id_Facultad,f.Codigo,f.Nombre,f.FechaCreacion,
	u.Nombre AS NombreUniversidad,
	c.Nombre AS NombreCiudad
	FROM Facultad f 
	INNER JOIN Universidad u ON f.Universidad=u.Id_Universidad
	INNER JOIN Ciudad c ON f.IdCiudad = c.Id 
END