
/* ******************************************************************************
    OM 2020.02.12
    Database: MUSSIE_SIRAK_SOUNDTRACK_BD_104_2020.sql
    Description: FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES DE REQUETES MYSQL
    DB Server: MySql
    Author: Mussie Sirak
******************************************************************************* */

/* ******************************************************************************
   Drop database if it exists
   Détection si une autre base de donnée du même nom existe
********************************************************************************/;
DROP DATABASE IF EXISTS MUSSIE_SIRAK_SOUNDTRACK_BD_104_2020;

/* ******************************************************************************
   Création d'un nouvelle base de donnée
********************************************************************************/;
CREATE DATABASE IF NOT EXISTS MUSSIE_SIRAK_SOUNDTRACK_BD_104_2020;

-- Utilisation de cette base de donnée

USE MUSSIE_SIRAK_SOUNDTRACK_BD_104_2020;

-- Create user
-- CREATE USER 'basic'@'localhost' IDENTIFIED BY 'basic_password';
-- CREATE USER 'plus'@'localhost' IDENTIFIED BY 'plus_password';
-- CREATE USER 'ruller'@'localhost' IDENTIFIED BY 'ruller_password';

-- SELECT User FROM mysql.user;

-- Create roles
-- CREATE ROLE user_read_only;
-- CREATE ROLE user_read_write;
-- CREATE ROLE user_can_change;

-- Test this
-- GRANT SELECT ON T_User.name TO 'user_read_only';
-- GRANT SELECT, INSERT ON t_user.name TO 'user_read_write';
-- GRANT UPDATE, DELETE ON t_user.name TO 'user_can_change';

-- GRANT 'user_read_only' TO 'basic'@'localhost', 'reader_2'@'localhost';
-- GRANT 'user_read_write' TO 'plus'@'localhost';
-- GRANT 'user_can_change' TO 'ruller'@'localhost';
-- --------------------------------------------------------
DROP TABLE IF EXISTS `T_Album`;
DROP TABLE IF EXISTS `T_Artist`;
DROP TABLE IF EXISTS `T_Genre`;
DROP TABLE IF EXISTS `T_MediaType`;
DROP TABLE IF EXISTS `T_Playlist`;
DROP TABLE IF EXISTS `T_PlaylistTrack`;
DROP TABLE IF EXISTS `T_Track`;
DROP TABLE IF EXISTS `T_Users`;
DROP TABLE IF EXISTS `Songs`;
DROP TABLE IF EXISTS `t_users`;

CREATE TABLE `T_Album`
(
    `Album_Id` INT NOT NULL UNIQUE,
    `Title` VARCHAR(160) NOT NULL,
    `Artist_Id` INT NOT NULL,
    CONSTRAINT `PK_T_Album` PRIMARY KEY  (`Album_Id`)
);
-- ---------------------------------------------------
-- Add constrain generId (foreign key to Geners TABLE)
-- Add releasedate
-- ---------------------------------------------------

-- Artist table
CREATE TABLE `T_Artist`
(
    `Artist_Id` INT NOT NULL,
    `Name` VARCHAR(120),
    CONSTRAINT `PK_T_Artist` PRIMARY KEY  (`Artist_Id`)
);
-- Data for T_Artist
INSERT INTO `T_Artist` VALUES
(1, 'Linking Park'),
(2, ''),
(3, ''),
(4, ''),
(5, ''),
(6, ''),
(7, ''),
(8, '');

CREATE TABLE `T_Genre`
(
    `Genre_Id` INT NOT NULL,
    `Name` VARCHAR(120),
    CONSTRAINT `PK_Genre` PRIMARY KEY  (`Genre_Id`)
);
-- Add may be some description in T_Genre


CREATE TABLE `T_MediaType`
(
    `MediaType_Id` INT NOT NULL,
    `Name` VARCHAR(120),
    CONSTRAINT `PK_T_MediaType` PRIMARY KEY  (`MediaType_Id`)
);

---
---Create Structure for T_Playlists
---

CREATE TABLE `T_Playlist`
(
    `Playlist_Id` INT(11) NOT NULL,
    `Name` VARCHAR(120),
    `Owner` VARCHAR(50 NOT NULL,
    `Date_created` DATETIME NOT NULL)
    CONSTRAINT `PK_T_Playlist` PRIMARY KEY  (`Playlist_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---
--- Insert data to T_Playlist
---
INSERT INTO `T_Playlist` (`Playlist_Id`,`Name`,`Owner`, `dateCreated`) VALUES
(1, 'wild', 'me', '2020-10-10 00:00:00');


-- AutoIncrement to T_Plalist
ALTER TABLE `T_Playlist`
    MODIFY `Playlist_Id` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


CREATE TABLE `T_PlaylistTrack`
(
    `Playlist_Id` INT NOT NULL,
    `Track_Id` INT NOT NULL,
    CONSTRAINT `PK_T_PlaylistTrack` PRIMARY KEY  (`Playlist_Id`, `Track_Id`)
);

---
---
---
CREATE TABLE `T_Track`
(
    `Track_Id` INT NOT NULL,
    `Name` VARCHAR(200) NOT NULL,
    `Album_Id` INT,
    `MediaType_Id` INT NOT NULL,
    `Genre_Id` INT,
    `Composer` VARCHAR(220),
    `Duration` INT NOT NULL,
    `Bytes` INT,
    `UnitPrice` NUMERIC(10,2) NOT NULL,
    CONSTRAINT `PK_T_Track` PRIMARY KEY  (`Track_Id`)
);
-- Add lyrics, change Duration to playtime

---
--- Table structure for T_Songs
---
CREATE TABLE `T_Songs`
(
    `Song_id` int(11) NOT NULL,
    `title` varchar(250) NOT NULL,
    `artist` int(11) NOT NULL,
    `album` int(11) NOT NULL,
    `genre` int(11) NOT NULL,
    `duration` varchar(8) NOT NULL,
    `path` varchar(500) NOT NULL,
    `albumOrder` int(11) NOT NULL,
    `plays` int(11) NOT NULL
)

ALTER TABLE `T_Songs` ADD PRIMARY KEY (`Song_id`);
---
--- Table structure for T_Users
---
CREATE TABLE `T_Users`
(
    `User_Id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Username` VARCHAR(25) NOT NULL,
    `FirstName` VARCHAR(40) NOT NULL,
    `LastName` VARCHAR(20) NOT NULL,
    `Company` VARCHAR(80),
    `Address` VARCHAR(70),
    `City` VARCHAR(40),
    `State` VARCHAR(40),
    `Country` VARCHAR(40),
    `PostalCode` VARCHAR(10),
    `Phone` VARCHAR(24),
    `Fax` VARCHAR(24),
    `Email` VARCHAR(60) NOT NULL,
    `Password` VARCHAR(64) NOT NULL,
    `SignUpDate` DATE NOT NULL,
    `Date_of_birth` date NOT NULL,
    `ProfilePicture`
    `SupportRepId` INT,
    UNIQUE KEY `Username` (`Username`),
    CONSTRAINT chk_age CHECK (select DATEDIFF(year,'Date_of_birth',getedate()) AS age where age >= 18 ),
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


UPDATE T_Users u SET u.Password=SHA2("PASSWORD",256) WHERE id=1;
SELECT (Lastname | Firstname) as Fullname, Password FROM t_users;

ALTER TABLE t_users ADD CONSTRAINT login UNIQUE NONCLUSTERED ( login_name, username )
ALTER TABLE t_users ADD fk_address int;
ALTER TABLE t_users ADD CONSTRAINT fk_address FOREIGN KEY (user_id) REFERENCES t_address(user_id)

ALTER TABLE `T_Album` ADD CONSTRAINT `FK_AlbumArtist_Id`
    FOREIGN KEY (`Artist_Id`) REFERENCES `T_Artist` (`Artist_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_AlbumArtist_Id` ON `T_Album` (`Artist_Id`);

ALTER TABLE `T_PlaylistTrack` ADD CONSTRAINT `FK_PlaylistTrackPlaylist_Id`
    FOREIGN KEY (`Playlist_Id`) REFERENCES `T_Playlist` (`Playlist_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `T_PlaylistTrack` ADD CONSTRAINT `FK_PlaylistTrackTrack_Id`
    FOREIGN KEY (`Track_Id`) REFERENCES `T_Track` (`Track_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_PlaylistTrackTrack_Id` ON `T_PlaylistTrack` (`Track_Id`);

ALTER TABLE `T_Track` ADD CONSTRAINT `FK_TrackAlbum_Id`
    FOREIGN KEY (`Album_Id`) REFERENCES `T_Album` (`Album_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackAlbum_Id` ON `T_Track` (`Album_Id`);

ALTER TABLE `T_Track` ADD CONSTRAINT `FK_TrackGenre_Id`
    FOREIGN KEY (`Genre_Id`) REFERENCES `T_Genre` (`Genre_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackGenre_Id` ON `T_Track` (`Genre_Id`);

ALTER TABLE `T_Track` ADD CONSTRAINT `FK_TrackMediaType_Id`
    FOREIGN KEY (`MediaType_Id`) REFERENCES `T_MediaType` (`MediaType_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackMediaType_Id` ON `T_Track` (`MediaType_Id`);

INSERT INTO `T_Genre` (`Genre_Id`, `Name`) VALUES
(1, N'Rock'),
(2, N'Jazz'),
(3, N'Metal'),
(4, N'Alternative & Punk'),
(5, N'Rock And Roll'),
(6, N'Blues'),
(7, N'Latin'),
(8, N'Reggae'),
(9, N'Pop'),
(10, N'Soundtrack'),
(11, N'Bossa Nova'),
(12, N'Easy Listening'),
(13, N'Heavy Metal'),
(14, N'R&B/Soul'),
(15, N'Electronica/Dance'),
(16, N'World'),
(17, N'Hip Hop'),
(18, N'Science Fiction'),
(19, N'TV Shows'),
(20, N'Sci Fi & Fantasy'),
(21, N'Drama'),
(22, N'Comedy'),
(23, N'Alternative'),
(24, N'Classical'),
(25, N'Opera'),
(26, N'Country'),
(27, N'Folk'),
(28, N'Rap');

INSERT INTO `MediaType` (`MediaType_Id`, `Name`) VALUES (1, N'MPEG audio file');
INSERT INTO `MediaType` (`MediaType_Id`, `Name`) VALUES (2, N'Protected AAC audio file');
INSERT INTO `MediaType` (`MediaType_Id`, `Name`) VALUES (3, N'Protected MPEG-4 video file');
INSERT INTO `MediaType` (`MediaType_Id`, `Name`) VALUES (4, N'mp3');
INSERT INTO `MediaType` (`MediaType_Id`, `Name`) VALUES (5, N'AAC audio file');
