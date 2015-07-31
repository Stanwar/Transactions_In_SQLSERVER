
--
-- SQL Script to Create Uitunes database
-- Sharad Tanwar ( stanwa2)
-- U.Illinois , Chicago
-- CS 480, Summer 2015
-- HomeWork 1
--
DROP TABLE PurchaseDetails;
DROP TABLE Purchase;
DROP TABLE PlaylistDetails;
DROP TABLE Reviews;
DROP TABLE Playlists;
DROP TABLE SongAlbumDetails;
DROP TABLE SongArtistDetails;
DROP TABLE Songs;
DROP TABLE Albums;
DROP TABLE Artists;
DROP TABLE Genres;
DROP TABLE Users;
-- 
-- 
-- 

CREATE TABLE Genres (
   GenreID   SMALLINT IDENTITY(1,1) PRIMARY KEY,  -- IDENTITY = auto-increment, start at 1, by 1
   GenreName NVARCHAR(32) NOT NULL                -- Unicode string, variable length, max 32
);


CREATE TABLE Songs (
   SongID   INT IDENTITY(1,1) PRIMARY KEY,  -- IDENTITY = auto-increment, start at 1, by 1
   SongName NVARCHAR(240) NOT NULL,         -- Unicode string, variable length, max 128
   YearRel  SMALLINT NOT NULL,                       -- e.g. 2014
   Price	SMALLMONEY NOT NULL CHECK( Price >=0),
   Duration TIME,                          -- hh:mm:ss, e.g. 00:03:30
   Discount INT
);

--
CREATE TABLE Albums(
	AlbumID		INT IDENTITY(1,1) PRIMARY KEY,
	AlbumName	NVARCHAR(240) NOT NULL,
	YearRel		SMALLINT NOT NULL,
	Price		SMALLMONEY NOT NULL
);

-- Main Artists Table 
CREATE TABLE Artists (
   ArtistID   INT IDENTITY(1,1) PRIMARY KEY,  -- IDENTITY = auto-increment, start at 1, by 1
   ArtistName NVARCHAR(64) NOT NULL,          -- Unicode string, variable length, max 64
   YearBorn   SMALLINT		NOT NULL     			-- Year in which the Artist was born 
);

-- Main Users Table 

CREATE TABLE Users (
	UserID				INT IDENTITY(1,1) PRIMARY KEY,
	FirstName			NVARCHAR(240) NOT NULL,
	LastName			NVARCHAR(240) NOT NULL,
	Email				NVARCHAR(240) NOT NULL UNIQUE, -- Email has to be unique for every user
	Pssword				NVARCHAR(240) NOT NULL,
	AccountBalance		INT	         NOT NULL
);
-- Details table for Songs
CREATE TABLE SongArtistDetails (
   SongID     INT NOT NULL FOREIGN KEY REFERENCES Songs(SongID),
   ArtistID   INT NOT NULL FOREIGN KEY REFERENCES Artists(ArtistID),
   ArtistRole NVARCHAR(50) NOT NULL,               -- Lead/Author/Feat
   GenreID    SMALLINT FOREIGN KEY REFERENCES Genres(GenreID), 	
   PRIMARY KEY(SongID, ArtistID)
);

-- Details table for Songs
CREATE TABLE SongAlbumDetails (
   SongID     INT NOT NULL FOREIGN KEY REFERENCES Songs(SongID),
   AlbumID   INT NOT NULL FOREIGN KEY REFERENCES Albums(AlbumID),
   GenreID    SMALLINT FOREIGN KEY REFERENCES Genres(GenreID), 	
   PRIMARY KEY(SongID, AlbumID)
);


-- Playlists
CREATE TABLE Playlists(
	PlaylistID INT IDENTITY(1,1) PRIMARY KEY,					-- ID for Playlist 
	PlaylistName NVARCHAR(240) NOT NULL,						-- Playlist Name 
	UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID)	-- UserID References to Users Table 
);

-- PlayListDetails 
CREATE TABLE PlaylistDetails(
	PlaylistID INT FOREIGN KEY REFERENCES Playlists(PlaylistID),
	ItemType NVARCHAR(15) NOT NULL, -- SONG/ ALBUM
	ItemID INT NOT NULL,
	AddDate DATE,
	Visible BIT NOT NULL, -- 0 = NOT VISIBLE, 1 = VISIBLE 
	PRIMARY KEY (PlaylistID, ItemID, ItemType) 
);

-- Reviews Table 
CREATE TABLE Reviews(
	ReviewId INT IDENTITY(1,1) PRIMARY KEY,						-- ReviewID
	AlbumID INT FOREIGN KEY REFERENCES Albums(AlbumID) ,		-- AlbumID
	SongID INT FOREIGN KEY REFERENCES Songs(SongID),			-- SongID
	PlaylistID INT FOREIGN KEY REFERENCES Playlists(PlaylistID), -- Playlist ID 
	ReviewType NVARCHAR(15) NOT NULL,									-- ALBUM , SONG , PLAYLIST 
	UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID) ,			-- UserID 
	Rating TINYINT NOT NULL CHECK (Rating>=1 AND Rating<=5) ,	-- Rating 1-5
	COMMENT NVARCHAR(4000)										-- Optional Comment 
);

-- Main Purchase Table 
CREATE TABLE Purchase(
	TransactionID  INT IDENTITY(1,1) PRIMARY KEY,			 -- Purchase Transaction ID 
	UserID	INT NOT NULL FOREIGN KEY REFERENCES Users(UserID), -- The purchaser
	NumberOfItems  INT CHECK (NumberOfItems >=0),										 -- No of items being brought
	Amount		   SMALLMONEY NOT NULL,										 -- Amount of the Purchase
	DateOfPurchase DATE	NOT NULL									 -- Date of Purchase

);

-- Purchase Details Table which details the purchases in a single transaction
CREATE TABLE PurchaseDetails(
	TransactionID INT FOREIGN KEY REFERENCES Purchase(TransactionID),
	PurchaseType NVARCHAR(15) NOT NULL,					-- Album/ Song
	PurchaseItemID INT NOT NULL,					-- AlbumID /SongID
	ItemAmount SMALLMONEY NOT NULL,                       
	PRIMARY KEY (TransactionID, PurchaseType, PurchaseItemID) -- Primary Key 
);

-- Indexes
CREATE INDEX Review_User_Indx ON Reviews(ReviewID,UserID);

CREATE INDEX Review_User_Album_Indx ON Reviews(UserID,AlbumID);

CREATE INDEX Review_User_Song_Indx ON Reviews(UserID,SongID);

CREATE INDEX Albums_Name_Indx ON Albums(AlbumName);

CREATE INDEX Artists_Name_Indx ON Artists(ArtistName);

CREATE INDEX Song_Name_Indx ON Songs(SongName);

CREATE INDEX Users_Name_Indx ON Users(UserID);
