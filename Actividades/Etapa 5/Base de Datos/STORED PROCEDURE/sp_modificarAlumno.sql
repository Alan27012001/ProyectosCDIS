USE Escuela
GO

CREATE PROCEDURE sp_modificarAlumno
	@pMatricula			INT,
	@pNombre			VARCHAR(100),
	@pFecha				DATE,
	@pSemestre			INT,
	@pFacultad			INT
AS
BEGIN
	UPDATE Alumno SET Nombre=@pNombre,FechaNacimiento=@pFecha,Semestre=@pSemestre,Facultad=@pFacultad
	WHERE Matricula = @pMatricula
END
