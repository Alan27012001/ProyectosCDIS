USE Escuela
GO

IF(OBJECT_ID('sp_consultarUsuario')IS NOT NULL)
	DROP PROCEDURE sp_consultarUsuario
GO

CREATE PROCEDURE sp_consultarUsuario
	@pNombre		VARCHAR(50),
	@pContrasena	VARCHAR(10)
AS
BEGIN
	SELECT * FROM Usuario
	WHERE Nombre = @pNombre AND Contrasena = @pContrasena
END