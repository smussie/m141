-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : maria_db
-- Généré le : mer. 20 jan. 2021 à 01:16
-- Version du serveur :  10.5.5-MariaDB-1:10.5.5+maria~focal
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `MUSSIE_SIRAK_SOUNDTRACK_BD_104_2020`
--

-- --------------------------------------------------------

--
-- Structure de la table `T_Album`
--

CREATE TABLE `T_Album` (
  `Album_Id` int(11) NOT NULL,
  `Title` varchar(160) NOT NULL,
  `Artist_Id` int(11) NOT NULL,
  -- use artwork to insert emojis
  `ArtworkPath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `T_Artist`
--

CREATE TABLE `T_Artist` (
  `Artist_Id` int(11) NOT NULL,
  `Name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `T_Artist`
--

INSERT INTO `T_Artist` (`Artist_Id`, `Name`) VALUES
(1, 'Linking Park'),
<<<<<<< HEAD
(2, ''),
(3, ''),
(4, ''),
(5, ''),
(6, ''),
(7, ''),
(8, '');
=======
(2, 'Imany'),
(3, 'Manchester Orchestra'),
(4, 'Jacob Banks'),
(5, 'Labrinth'),
(6, 'Amber Run'),
(7, 'LP');
>>>>>>> Add testing sql databases

-- --------------------------------------------------------

--
-- Structure de la table `T_Genre`
--

CREATE TABLE `T_Genre` (
  `Genre_Id` int(11) NOT NULL,
  `Name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `T_Genre`
--

INSERT INTO `T_Genre` (`Genre_Id`, `Name`) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Metal'),
(4, 'Alternative & Punk'),
(5, 'Rock And Roll'),
(6, 'Blues'),
(7, 'Latin'),
(8, 'Reggae'),
(9, 'Pop'),
(10, 'Soundtrack'),
(11, 'Bossa Nova'),
(12, 'Easy Listening'),
(13, 'Heavy Metal'),
(14, 'R&B/Soul'),
(15, 'Electronica/Dance'),
(16, 'World'),
(17, 'Hip Hop'),
(18, 'Science Fiction'),
(19, 'TV Shows'),
(20, 'Sci Fi & Fantasy'),
(21, 'Drama'),
(22, 'Comedy'),
(23, 'Alternative'),
(24, 'Classical'),
(25, 'Opera'),
(26, 'Country'),
(27, 'Folk'),
(28, 'Rap');

-- --------------------------------------------------------

--
-- Structure de la table `T_MediaType`
--

CREATE TABLE `T_MediaType` (
  `MediaType_Id` int(11) NOT NULL,
  `Name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `T_MediaType`
--

INSERT INTO `T_MediaType` (`MediaType_Id`, `Name`) VALUES
(1, 'MPEG audio file'),
(2, 'Protected AAC audio file'),
(3, 'Protected MPEG-4 video file'),
(4, 'mp3'),
(5, 'AAC audio file');

-- --------------------------------------------------------

--
-- Structure de la table `T_Playlist`
--

CREATE TABLE `T_Playlist` (
  `Playlist_Id` int(11) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Owner` varchar(50) NOT NULL,
  `Date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `T_Playlist`
--

INSERT INTO `T_Playlist` (`Playlist_Id`, `Name`, `Owner`, `Date_created`) VALUES
(1, 'wild', 'me', '2020-10-10 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `T_PlaylistTrack`
--

CREATE TABLE `T_PlaylistTrack` (
  `Playlist_Id` int(11) NOT NULL,
  `Track_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `T_Songs`
--

CREATE TABLE `T_Songs` (
  `Song_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `path` varchar(500) NOT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `T_Track`
--

CREATE TABLE `T_Track` (
  `Track_Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Album_Id` int(11) DEFAULT NULL,
  `MediaType_Id` int(11) NOT NULL,
  `Genre_Id` int(11) DEFAULT NULL,
  `Composer` varchar(220) DEFAULT NULL,
  `Duration` int(11) NOT NULL,
  `Bytes` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

<<<<<<< HEAD
=======
INSERT INTO `Track` (`TrackId`, `Name`, `AlbumId`, `MediaTypeId`, `GenreId`, `Composer`, `Milliseconds`, `Bytes`, `UnitPrice`) VALUES (1, N'Mount Everest', 1, 3, 1, N'Van Halen', 105639, 3495897, 0.99);
>>>>>>> Add testing sql databases
-- --------------------------------------------------------

--
-- Structure de la table `T_Users`
--

CREATE TABLE `T_Users` (
  `User_Id` int(11) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Company` varchar(80) DEFAULT NULL,
  `Address` varchar(70) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `SignUpDate` date NOT NULL,
  `Date_of_birth` date NOT NULL,
  `SupportRepId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `T_Album`
--
ALTER TABLE `T_Album`
  ADD PRIMARY KEY (`Album_Id`),
  ADD UNIQUE KEY `Album_Id` (`Album_Id`),
  ADD KEY `IFK_AlbumArtist_Id` (`Artist_Id`);

--
-- Index pour la table `T_Artist`
--
ALTER TABLE `T_Artist`
  ADD PRIMARY KEY (`Artist_Id`);

--
-- Index pour la table `T_Genre`
--
ALTER TABLE `T_Genre`
  ADD PRIMARY KEY (`Genre_Id`);

--
-- Index pour la table `T_MediaType`
--
ALTER TABLE `T_MediaType`
  ADD PRIMARY KEY (`MediaType_Id`);

--
-- Index pour la table `T_Playlist`
--
ALTER TABLE `T_Playlist`
  ADD PRIMARY KEY (`Playlist_Id`);

--
-- Index pour la table `T_PlaylistTrack`
--
ALTER TABLE `T_PlaylistTrack`
  ADD PRIMARY KEY (`Playlist_Id`,`Track_Id`),
  ADD KEY `IFK_PlaylistTrackTrack_Id` (`Track_Id`);

--
-- Index pour la table `T_Songs`
--
ALTER TABLE `T_Songs`
  ADD PRIMARY KEY (`Song_id`);

--
-- Index pour la table `T_Track`
--
ALTER TABLE `T_Track`
  ADD PRIMARY KEY (`Track_Id`),
  ADD KEY `IFK_TrackAlbum_Id` (`Album_Id`),
  ADD KEY `IFK_TrackGenre_Id` (`Genre_Id`),
  ADD KEY `IFK_TrackMediaType_Id` (`MediaType_Id`);

--
-- Index pour la table `T_Users`
--
ALTER TABLE `T_Users`
  ADD PRIMARY KEY (`User_Id`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `NONCLUSTERED` (`Username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `T_Playlist`
--
ALTER TABLE `T_Playlist`
  MODIFY `Playlist_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `T_Users`
--
ALTER TABLE `T_Users`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `T_Album`
--
ALTER TABLE `T_Album`
  ADD CONSTRAINT `FK_AlbumArtist_Id` FOREIGN KEY (`Artist_Id`) REFERENCES `T_Artist` (`Artist_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `T_PlaylistTrack`
--
ALTER TABLE `T_PlaylistTrack`
  ADD CONSTRAINT `FK_PlaylistTrackPlaylist_Id` FOREIGN KEY (`Playlist_Id`) REFERENCES `T_Playlist` (`Playlist_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PlaylistTrackTrack_Id` FOREIGN KEY (`Track_Id`) REFERENCES `T_Track` (`Track_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `T_Track`
--
ALTER TABLE `T_Track`
  ADD CONSTRAINT `FK_TrackAlbum_Id` FOREIGN KEY (`Album_Id`) REFERENCES `T_Album` (`Album_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TrackGenre_Id` FOREIGN KEY (`Genre_Id`) REFERENCES `T_Genre` (`Genre_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TrackMediaType_Id` FOREIGN KEY (`MediaType_Id`) REFERENCES `T_MediaType` (`MediaType_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
<<<<<<< HEAD
=======
CREATE VIEW Artist_list
AS
SELECT
  s.staff_id AS ID,
  CONCAT(s.first_name, _utf8' ', s.last_name) AS name,
  a.address AS address,
  a.postal_code AS `zip code`,
  a.phone AS phone,
  city.city AS city,
  country.country AS country,
  s.store_id AS SID
FROM staff AS s
  JOIN address AS a ON s.address_id = a.address_id
  JOIN city ON a.city_id = city.city_id
  JOIN country ON city.country_id = country.country_id;
>>>>>>> Add testing sql databases
