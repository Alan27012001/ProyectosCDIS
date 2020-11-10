USE Escuela
GO

IF(OBJECT_ID('sp_cargarUniversidades')IS NOT NULL)
	DROP PROCEDURE sp_cargarUniversidades
GO

CREATE PROCEDURE sp_cargarUniversidades
AS
BEGIN
	SELECT * FROM Universidad
END