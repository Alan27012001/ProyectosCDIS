USE Escuela
GO

IF(OBJECT_ID('sp_cargarCiudadesPorEstado')IS NOT NULL)
	DROP PROCEDURE sp_cargarCiudadesPorEstado
GO

CREATE PROCEDURE sp_cargarCiudadesPorEstado
	@pEstado		INT
AS
BEGIN
	SELECT * FROM Ciudad
	Where IdEstado = @pEstado
END