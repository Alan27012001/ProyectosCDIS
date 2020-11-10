USE Escuela
GO

IF(OBJECT_ID('sp_cargarFacultades')IS NOT NULL)
	DROP PROCEDURE sp_cargarFacultades
GO

CREATE PROCEDURE sp_cargarFacultades
AS
BEGIN
	SELECT * FROM Facultad
END