USE Escuela
GO

IF(OBJECT_ID('sp_agregarAlumno')IS NOT NULL)
	DROP PROCEDURE sp_agregarAlumno
GO

CREATE PROCEDURE sp_agregarAlumno
	@pMatricula			INT,
	@pNombre			VARCHAR(100),
	@pFecha				DATE,
	@pSemestre			INT,
	@pFacultad			INT
AS
BEGIN
	INSERT INTO Alumno VALUES(@pMatricula,@pNombre,@pFecha,@pSemestre,@pFacultad)
END