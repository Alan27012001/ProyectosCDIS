CREATE DATABASE CdisMart
USE CdisMart

DROP TABLE AuctionRecord
DROP TABLE Auction
DROP TABLE [User]


CREATE TABLE [User]
(	
	UserId				INT IDENTITY(1,1),
	UserName			VARCHAR(10)NOT NULL,
	[Password]			VARCHAR(10)NOT NULL,
	[Name]				VARCHAR(50)NOT NULL,
	Email				VARCHAR(50)NOT NULL,
	[Type]				VARCHAR(50),
	CONSTRAINT PK_User_UserId PRIMARY KEY(UserId)
)

CREATE TABLE Auction
(
	AuctionId			INT IDENTITY(1,1),
	ProductName			VARCHAR(50)NOT NULL,
	[Description]		VARCHAR(100)NOT NULL,
	StartDate			DATETIME NOT NULL,
	EndDate				DATETIME NOT NULL,
	HighestBind			DECIMAL(9,2),
	Winner				INT,
	UserId				INT,
	CONSTRAINT PK_Auction_ActuionId PRIMARY KEY(AuctionId),
	CONSTRAINT FK_Auction_User_UserId FOREIGN KEY(UserId)
	REFERENCES [User](UserId)
)

CREATE TABLE AuctionRecord
(
	RecordId			INT IDENTITY(1,1),
	AuctionId			INT NOT NULL,
	UserId				INT NOT NULL,
	Amount				DECIMAL(9,2)NOT NULL,
	BidDate				DATETIME NOT NULL,
	CONSTRAINT PK_AuctionRecord_RecordId PRIMARY KEY(RecordId),
	CONSTRAINT FK_AuctionRecord_Auction_AuctionId FOREIGN KEY(AuctionId)
	REFERENCES Auction(AuctionId),
	CONSTRAINT FK_AuctionRecord_User_UserId FOREIGN KEY(UserId)
	REFERENCES [User](UserId)
)


SELECT * FROM [User]
INSERT [User] VALUES('Alan10','1234','Alan Roberto Pitones de León','alan.roberto27012001@outlook.com','Administrador')

SELECT * FROM Auction /*18: Dia, 20: Año y 06: Mes*/
INSERT Auction VALUES('Carro','Es un carro deportivo',convert(datetime,'18-06-20 10:34:09 PM',2),convert(datetime,'24-06-20 01:48:19 PM',2),150000.23,NULL,1)

SELECT * FROM AuctionRecord
INSERT AuctionRecord VALUES(1,1,150000.23,convert(datetime,'18-06-20 10:34:09 PM',2))
