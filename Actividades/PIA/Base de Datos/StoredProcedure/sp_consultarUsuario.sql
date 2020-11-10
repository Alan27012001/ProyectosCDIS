USE CdisMart
GO


CREATE PROCEDURE sp_consultarUsuario
	@pNombre		VARCHAR(50),
	@pContrasena	VARCHAR(10)
AS
BEGIN
	SELECT * FROM [User]
	WHERE UserName = @pNombre AND [Password] = @pContrasena
END