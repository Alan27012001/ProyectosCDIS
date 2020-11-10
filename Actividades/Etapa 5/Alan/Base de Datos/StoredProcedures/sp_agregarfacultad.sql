USE Escuela
GO

IF(OBJECT_ID('sp_agregarfacultad')IS NOT NULL)
	DROP PROCEDURE sp_agregarfacultad
GO

CREATE PROCEDURE sp_agregarfacultad
	@pCodigo				VARCHAR(10),
	@pNombre				VARCHAR(100),
	@pFechaCreacion			DATE,
	@pUniversidad			INT
AS
BEGIN
	INSERT INTO Facultad VALUES(@pCodigo,@pNombre,@pFechaCreacion,@pUniversidad)
END