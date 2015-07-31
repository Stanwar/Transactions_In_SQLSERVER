
--
-- SQL Script to Insert Records in Uitunes database
-- Sharad Tanwar ( stanwa2)
-- U.Illinois , Chicago
-- CS 480, Summer 2015
-- HomeWork 1
--

SET IDENTITY_INSERT [dbo].[Albums] ON
INSERT INTO [dbo].[Albums] ([AlbumID], [AlbumName], [YearRel], [Price]) VALUES (1, N'8 Mile', 2014, CAST(5.0000 AS SmallMoney))
INSERT INTO [dbo].[Albums] ([AlbumID], [AlbumName], [YearRel], [Price]) VALUES (2, N'1989', 2014, CAST(10.0000 AS SmallMoney))
INSERT INTO [dbo].[Albums] ([AlbumID], [AlbumName], [YearRel], [Price]) VALUES (5, N'Living Dead Girl', 2010, CAST(2.0000 AS SmallMoney))
INSERT INTO [dbo].[Albums] ([AlbumID], [AlbumName], [YearRel], [Price]) VALUES (6, N'Citizen Cope', 2010, CAST(10.0000 AS SmallMoney))
SET IDENTITY_INSERT [dbo].[Albums] OFF

SET IDENTITY_INSERT [dbo].[Artists] ON
INSERT INTO [dbo].[Artists] ([ArtistID], [ArtistName], [YearBorn]) VALUES (1, N'Citizen Cope', 1970)
INSERT INTO [dbo].[Artists] ([ArtistID], [ArtistName], [YearBorn]) VALUES (2, N'Eminem', 1973)
INSERT INTO [dbo].[Artists] ([ArtistID], [ArtistName], [YearBorn]) VALUES (3, N'Led Zeppelin', 1967)
INSERT INTO [dbo].[Artists] ([ArtistID], [ArtistName], [YearBorn]) VALUES (4, N'Pink Floyd', 1955)
SET IDENTITY_INSERT [dbo].[Artists] OFF

SET IDENTITY_INSERT [dbo].[Genres] ON
INSERT INTO [dbo].[Genres] ([GenreID], [GenreName]) VALUES (1, N'Rap')
INSERT INTO [dbo].[Genres] ([GenreID], [GenreName]) VALUES (2, N'Hip Hop')
INSERT INTO [dbo].[Genres] ([GenreID], [GenreName]) VALUES (3, N'Rock')
INSERT INTO [dbo].[Genres] ([GenreID], [GenreName]) VALUES (4, N'Heavy Metal')
INSERT INTO [dbo].[Genres] ([GenreID], [GenreName]) VALUES (5, N'Fruity')
SET IDENTITY_INSERT [dbo].[Genres] OFF

SET IDENTITY_INSERT [dbo].[Users] ON
INSERT INTO [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Pssword], [AccountBalance]) VALUES (1, N'Sharad', N'Tanwar', N'sharad_tanwar@outlook.com', N'sharad', 1000)
INSERT INTO [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Pssword], [AccountBalance]) VALUES (3, N'Max', N'Behran', N'max_behran@outlook.com', N'max', 500)
INSERT INTO [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Pssword], [AccountBalance]) VALUES (5, N'Prateek', N'Garg', N'pkgarg@outlook.com', N'horny', 300)
SET IDENTITY_INSERT [dbo].[Users] OFF

SET IDENTITY_INSERT [dbo].[Songs] ON
INSERT INTO [dbo].[Songs] ([SongID], [SongName], [YearRel], [Price], [Duration], [Discount]) VALUES (1, N'Sideways', 2014, CAST(2.0000 AS SmallMoney), N'00:04:00', 3)
INSERT INTO [dbo].[Songs] ([SongID], [SongName], [YearRel], [Price], [Duration], [Discount]) VALUES (2, N'Holdin On', 2014, CAST(3.0000 AS SmallMoney), N'00:03:48', 3)
INSERT INTO [dbo].[Songs] ([SongID], [SongName], [YearRel], [Price], [Duration], [Discount]) VALUES (3, N'Lose Yourself', 2002, CAST(3.0000 AS SmallMoney), N'00:03:12', 0)
INSERT INTO [dbo].[Songs] ([SongID], [SongName], [YearRel], [Price], [Duration], [Discount]) VALUES (4, N'Blank Space', 2015, CAST(3.0000 AS SmallMoney), N'00:03:58', 0)
SET IDENTITY_INSERT [dbo].[Songs] OFF

INSERT INTO [dbo].[SongArtistDetails] ([SongID], [ArtistID], [ArtistRole], [GenreID]) VALUES (1, 1, N'LEAD', 1);
INSERT INTO [dbo].[SongArtistDetails] ([SongID], [ArtistID], [ArtistRole], [GenreID]) VALUES (1, 2, N'FEAT', 1);
INSERT INTO [dbo].[SongArtistDetails] ([SongID], [ArtistID], [ArtistRole], [GenreID]) VALUES (2, 1, N'LEAD', 2);
INSERT INTO [dbo].[SongArtistDetails] ([SongID], [ArtistID], [ArtistRole], [GenreID]) VALUES (2, 2, N'FEAT', 2);

INSERT INTO [dbo].[SongAlbumDetails] ([SongID], [AlbumID], [GenreID]) VALUES (1, 1, 1)
INSERT INTO [dbo].[SongAlbumDetails] ([SongID], [AlbumID], [GenreID]) VALUES (2, 1, 1)
INSERT INTO [dbo].[SongAlbumDetails] ([SongID], [AlbumID], [GenreID]) VALUES (3, 1, 1)
INSERT INTO [dbo].[SongAlbumDetails] ([SongID], [AlbumID], [GenreID]) VALUES (2, 2, 2)
INSERT INTO [dbo].[SongAlbumDetails] ([SongID], [AlbumID], [GenreID]) VALUES (3, 2, 2)
INSERT INTO [dbo].[SongAlbumDetails] ([SongID], [AlbumID], [GenreID]) VALUES (1, 2, 2)


SET IDENTITY_INSERT [dbo].[Playlists] ON
INSERT INTO [dbo].[Playlists] ([PlaylistID], [PlaylistName], [UserID]) VALUES (1, N'Chill', 1)
INSERT INTO [dbo].[Playlists] ([PlaylistID], [PlaylistName], [UserID]) VALUES (4, N'Melody', 5)
SET IDENTITY_INSERT [dbo].[Playlists] OFF


INSERT INTO [dbo].[PlaylistDetails] ([PlaylistID], [ItemType], [ItemID], [AddDate], [Visible]) VALUES (1, N'ALBUM', 1, N'2014-11-12', 0)
INSERT INTO [dbo].[PlaylistDetails] ([PlaylistID], [ItemType], [ItemID], [AddDate], [Visible]) VALUES (1, N'SONG', 1, N'2013-05-05', 1)
INSERT INTO [dbo].[PlaylistDetails] ([PlaylistID], [ItemType], [ItemID], [AddDate], [Visible]) VALUES (1, N'SONG', 2, N'2013-04-04', 1)

SET IDENTITY_INSERT [dbo].[Reviews] ON
INSERT INTO [dbo].[Reviews] ([ReviewId], [AlbumID], [SongID], [PlaylistID], [ReviewType], [UserID], [Rating], [COMMENT]) VALUES (1, 1, NULL, NULL, N'ALBUM', 1, 3, N'This isnt bad')
INSERT INTO [dbo].[Reviews] ([ReviewId], [AlbumID], [SongID], [PlaylistID], [ReviewType], [UserID], [Rating], [COMMENT]) VALUES (3, 1, NULL, NULL, N'ALBUM', 5, 4, N'Excellant')
INSERT INTO [dbo].[Reviews] ([ReviewId], [AlbumID], [SongID], [PlaylistID], [ReviewType], [UserID], [Rating], [COMMENT]) VALUES (4, NULL, 1, NULL, N'SONG', 1, 5, N'Perfect')
SET IDENTITY_INSERT [dbo].[Reviews] OFF


SET IDENTITY_INSERT [dbo].[Purchase] ON
INSERT INTO [dbo].[Purchase] ([TransactionID], [UserID], [NumberOfItems], [Amount], [DateOfPurchase]) VALUES (1, 1, 2, CAST(50.0000 AS SmallMoney), N'2013-12-12')
INSERT INTO [dbo].[Purchase] ([TransactionID], [UserID], [NumberOfItems], [Amount], [DateOfPurchase]) VALUES (2, 5, 3, CAST(100.0000 AS SmallMoney),N'2014-05-05')
SET IDENTITY_INSERT [dbo].[Purchase] OFF


INSERT INTO [dbo].[PurchaseDetails] ([TransactionID], [PurchaseType], [PurchaseItemID], [ItemAmount]) VALUES (1, N'ALBUM', 1, CAST(10.0000 AS SmallMoney))
INSERT INTO [dbo].[PurchaseDetails] ([TransactionID], [PurchaseType], [PurchaseItemID], [ItemAmount]) VALUES (1, N'SONG', 1, CAST(2.0000 AS SmallMoney))
INSERT INTO [dbo].[PurchaseDetails] ([TransactionID], [PurchaseType], [PurchaseItemID], [ItemAmount]) VALUES (1, N'ALBUM', 2, CAST(10.0000 AS SmallMoney))

