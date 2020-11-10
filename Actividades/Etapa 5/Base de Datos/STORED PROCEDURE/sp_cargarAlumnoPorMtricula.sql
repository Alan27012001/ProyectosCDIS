USE Escuela
GO

CREATE PROCEDURE sp_cargarAlumnoPorMtricula
	@pMatricula		INT
AS
BEGIN 
	SELECT * FROM Alumno
	WHERE Matricula = @pMatricula
END