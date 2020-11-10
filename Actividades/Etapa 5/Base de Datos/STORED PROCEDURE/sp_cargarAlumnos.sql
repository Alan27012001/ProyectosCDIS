USE [Escuela]
GO
/****** Object:  StoredProcedure [dbo].[sp_cargarAlumnos]    Script Date: 08/07/2020 04:07:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_cargarAlumnos]	
AS
BEGIN
	SELECT a.Matricula,a.Nombre,a.FechaNacimiento,a.Semestre,f.Nombre AS NombreFacultad
	FROM Alumno a INNER JOIN Facultad f ON a.Facultad=f.Id_Facultad
END