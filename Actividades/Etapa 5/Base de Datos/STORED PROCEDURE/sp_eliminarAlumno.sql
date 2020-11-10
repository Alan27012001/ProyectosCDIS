USE Escuela
GO

CREATE PROCEDURE sp_eliminarAlumno
	@pMatricula		INT
AS
BEGIN
	DELETE FROM Alumno
	WHERE Matricula = @pMatricula
END