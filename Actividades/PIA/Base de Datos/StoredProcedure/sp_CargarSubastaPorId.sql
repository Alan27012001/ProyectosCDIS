USE CdisMart
GO
CREATE PROCEDURE sp_CargarSubastaPorId
	@pSubastaId		INT
AS
BEGIN
	SELECT * FROM Auction
	WHERE AuctionId = @pSubastaId
END