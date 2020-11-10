USE CdisMart
GO

CREATE PROCEDURE sp_Usuario
	@pName			VARCHAR(50),
	@pPassword		VARCHAR(10)
AS
BEGIN
	SELECT * FROM [User]
	WHERE [Name] =  @pName AND [Password] = @pPassword
END