
/* ******************************************************************************
    OM 2020.02.12
    Database: MUSSIE_SIRAK_SALADES_BD_104_2020.sql
    Description: FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES DE REQUETES MYSQL
    DB Server: MySql
    Author: Mussie Sirak
******************************************************************************* */

/* ******************************************************************************
   Drop database if it exists
   Détection si une autre base de donnée du même nom existe
********************************************************************************/;
DROP DATABASE IF EXISTS MUSSIE_SIRAK_SALADES_BD_104_2020;

/* ******************************************************************************
   Création d'un nouvelle base de donnée
********************************************************************************/;
CREATE DATABASE IF NOT EXISTS MUSSIE_SIRAK_SALADES_BD_104_2020;

-- Utilisation de cette base de donnée

USE MUSSIE_SIRAK_SALADES_BD_104_2020;

-- --------------------------------------------------------
-- list of all tables in the selected database
--

SELECT *
FROM INFORMATION_SCHEMA.TABLES;

-- list of all constraints in the selected database
SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

-- join tables and constraints data
SELECT
    INFORMATION_SCHEMA.TABLES.TABLE_NAME,
    SUM(CASE WHEN INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'PRIMARY KEY' THEN 1 ELSE 0 END) AS pk,
    SUM(CASE WHEN INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'UNIQUE' THEN 1 ELSE 0 END) AS uni,
    SUM(CASE WHEN INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'FOREIGN KEY' THEN 1 ELSE 0 END) AS fk
FROM INFORMATION_SCHEMA.TABLES
LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS ON INFORMATION_SCHEMA.TABLES.TABLE_NAME = INFORMATION_SCHEMA.TABLE_CONSTRAINTS.TABLE_NAME
GROUP BY
    INFORMATION_SCHEMA.TABLES.TABLE_NAME
ORDER BY
    INFORMATION_SCHEMA.TABLES.TABLE_NAME ASC;

-- SELECT
--     INFORMATION_SCHEMA.TABLES.TABLE_NAME,
--     INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_NAME,
--     INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_TYPE
-- FROM INFORMATION_SCHEMA.TABLES
-- INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS ON INFORMATION_SCHEMA.TABLES.TABLE_NAME = INFORMATION_SCHEMA.TABLE_CONSTRAINTS.TABLE_NAME
-- ORDER BY
--     INFORMATION_SCHEMA.TABLES.TABLE_NAME ASC,
--     INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_TYPE DESC;

CREATE USER 'basic'@'localhost' IDENTIFIED BY 'basic_password';
CREATE USER 'plus'@'localhost' IDENTIFIED BY 'plus_password';
CREATE USER 'ruller'@'localhost' IDENTIFIED BY 'ruller_password';
-- SELECT User FROM mysql.user;

CREATE ROLE user_read_only;
CREATE ROLE user_read_write;
CREATE ROLE user_can_change;


GRANT SELECT ON t_user.name TO 'user_read_only';
GRANT SELECT, INSERT ON t_user.name TO 'user_read_write';
GRANT UPDATE, DELETE ON t_user.name TO 'user_can_change';

GRANT 'user_read_only' TO 'basic'@'localhost', 'reader_2'@'localhost';
GRANT 'user_read_write' TO 'plus'@'localhost';
GRANT 'user_can_change' TO 'ruller'@'localhost';

/*******************************************************************************
   Create Tables
********************************************************************************/
--
-- Table structure for table `t_users`
--
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `date_of_birth` date NOT NULL,
  `login_name` varchar(24) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `username` varchar(24) NOT NULL,
  `img_gravatar` varchar(256) NOT NULL,
  `fk_nationalite` int NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `Date_cre` date NOT NULL,
  `Date_modifie` date NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `User_name` (`login_name`),
  UNIQUE KEY `fk_nationalite` (`fk_nationalite`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT chk_age CHECK (select DATEDIFF(year,'date_of_birth',getedate()) AS age where age >= 18 ),

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

UPDATE t_users u SET u.Password=SHA2("PASSWORD",256) WHERE id=1;
SELECT (lastname | firstname) as fullname, Password FROM t_users;

ALTER TABLE t_users ADD CONSTRAINT login UNIQUE NONCLUSTERED ( login_name, username )
ALTER TABLE t_users ADD fk_address int;
ALTER TABLE t_users ADD CONSTRAINT fk_address FOREIGN KEY (user_id) REFERENCES t_address(user_id)
--
-- Table structure for table `t_pays`
--
DROP TABLE IF EXISTS `t_pays`;
CREATE TABLE `t_pays` (
  `id_pays` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(75) NOT NULL UNIQUE,
  `code_pays_2` varchar(2) NOT NULL UNIQUE,
  `code_pays_3` varchar(2) NOT NULL UNIQUE,
  PRIMARY KEY (`id_pays`),
  CONSTRAINT is_alphabet CHECK (code_pays_2, code_pays_3 NOT LIKE '%[^A-Z]%')
);

ALTER TABLE t_pays ADD CONSTRAINT login UNIQUE NONCLUSTERED ( nom_pays, code_pays_2, code_pays_3  );
-- CREATE INDEX
-- CREATE VIEW
DROP TRIGGER IF EXISTS t_pays_insert;
CREATE TRIGGER t_pays_insert ON t_pays INSTEAD OF INSERT
AS BEGIN
    DECLARE @country_name CHAR(75);
    DECLARE @country_code_2  CHAR(2);
    DECLARE @country_code_3  CHAR(3);
    SELECT @country_name = nom_pays, @country_name_eng = nom_pays_eng, @country_code = code_pays FROM INSERTED;
    IF @country_name EXISTS (SELECT * from t_pays)
    BEGIN ROLLBACK
        RAISERROR ('Duplicate Data', 16, 1);
    END
    IF @country_name_eng IS NULL SET @country_name_eng = @country_name;
    INSERT INTO country (nom_pays, nom_pays_eng,  code_pays) VALUES (@country_name, @country_name_eng, @country_code);
END;

CREATE TRIGGER t_pays_after_insert on t_pays
AFTER INSERT
AS

IF EXISTS (select * from table t )

--
-- Dumping data for table `t_pays`
INSERT INTO t_pays (id_pays,nom_pays, code_pays_2, code_pays_3)
    SELECT @id_pays, @nom_pays, @code_pays_2, @code_pays_3, t_pays.id_pays,
        (select max(id_pays) as maxs from t_pays) + row_number() over (ORDER BY (SELECT NULL))
    WHERE t_pays.id_pays IN (SELECT ID FROM GetIDsTableFromIDsLIST(@id_pays))
VALUES
("Afghanistan","af","afg"),
("Albania","al","alb"),
("Algeria","dz","dza"),
("Andorra","ad","and"),
("Angola","ao","ago"),
("Antigua and Barbuda","ag","atg"),
("Argentina","ar","arg"),
("Armenia","am","arm"),
("Australia","au","aus"),
("Austria","at","aut"),
("Azerbaijan","az","aze"),
("Bahamas","bs","bhs"),
("Bahrain","bh","bhr"),
("Bangladesh","bd","bgd"),
("Barbados","bb","brb"),
("Belarus","by","blr"),
("Belgium","be","bel"),
("Belize","bz","blz"),
("Benin","bj","ben"),
("Bhutan","bt","btn"),
("Bolivia (Plurinational State of)","bo","bol"),
("Bosnia and Herzegovina","ba","bih"),
("Botswana","bw","bwa"),
("Brazil","br","bra"),
("Brunei Darussalam","bn","brn"),
("Bulgaria","bg","bgr"),
("Burkina Faso","bf","bfa"),
("Burundi","bi","bdi"),
("Cabo Verde","cv","cpv"),
("Cambodia","kh","khm"),
("Cameroon","cm","cmr"),
("Canada","ca","can"),
("Central African Republic","cf","caf"),
("Chad","td","tcd"),
("Chile","cl","chl"),
("China","cn","chn"),
("Colombia","co","col"),
("Comoros","km","com"),
("Congo","cg","cog"),
("Congo, Democratic Republic of the","cd","cod"),
("Costa Rica","cr","cri"),
("Côte d'Ivoire","ci","civ"),
("Croatia","hr","hrv"),
("Cuba","cu","cub"),
("Cyprus","cy","cyp"),
("Czechia","cz","cze"),
("Denmark","dk","dnk"),
("Djibouti","dj","dji"),
("Dominica","dm","dma"),
("Dominican Republic","do","dom"),
("Ecuador","ec","ecu"),
("Egypt","eg","egy"),
("El Salvador","sv","slv"),
("Equatorial Guinea","gq","gnq"),
("Eritrea","er","eri"),
("Estonia","ee","est"),
("Eswatini","sz","swz"),
("Ethiopia","et","eth"),
("Fiji","fj","fji"),
("Finland","fi","fin"),
("France","fr","fra"),
("Gabon","ga","gab"),
("Gambia","gm","gmb"),
("Georgia","ge","geo"),
("Germany","de","deu"),
("Ghana","gh","gha"),
("Greece","gr","grc"),
("Grenada","gd","grd"),
("Guatemala","gt","gtm"),
("Guinea","gn","gin"),
("Guinea-Bissau","gw","gnb"),
("Guyana","gy","guy"),
("Haiti","ht","hti"),
("Honduras","hn","hnd"),
("Hungary","hu","hun"),
("Iceland","is","isl"),
("India","in","ind"),
("Indonesia","id","idn"),
("Iran (Islamic Republic of)","ir","irn"),
("Iraq","iq","irq"),
("Ireland","ie","irl"),
("Israel","il","isr"),
("Italy","it","ita"),
("Jamaica","jm","jam"),
("Japan","jp","jpn"),
("Jordan","jo","jor"),
("Kazakhstan","kz","kaz"),
("Kenya","ke","ken"),
("Kiribati","ki","kir"),
("Korea (Democratic People's Republic of)","kp","prk"),
("Korea, Republic of","kr","kor"),
("Kuwait","kw","kwt"),
("Kyrgyzstan","kg","kgz"),
("Lao People's Democratic Republic","la","lao"),
("Latvia","lv","lva"),
("Lebanon","lb","lbn"),
("Lesotho","ls","lso"),
("Liberia","lr","lbr"),
("Libya","ly","lby"),
("Liechtenstein","li","lie"),
("Lithuania","lt","ltu"),
("Luxembourg","lu","lux"),
("Madagascar","mg","mdg"),
("Malawi","mw","mwi"),
("Malaysia","my","mys"),
("Maldives","mv","mdv"),
("Mali","ml","mli"),
("Malta","mt","mlt"),
("Marshall Islands","mh","mhl"),
("Mauritania","mr","mrt"),
("Mauritius","mu","mus"),
("Mexico","mx","mex"),
("Micronesia (Federated States of)","fm","fsm"),
("Moldova, Republic of","md","mda"),
("Monaco","mc","mco"),
("Mongolia","mn","mng"),
("Montenegro","me","mne"),
("Morocco","ma","mar"),
("Mozambique","mz","moz"),
("Myanmar","mm","mmr"),
("Namibia","na","nam"),
("Nauru","nr","nru"),
("Nepal","np","npl"),
("Netherlands","nl","nld"),
("New Zealand","nz","nzl"),
("Nicaragua","ni","nic"),
("Niger","ne","ner"),
("Nigeria","ng","nga"),
("North Macedonia","mk","mkd"),
("Norway","no","nor"),
("Oman","om","omn"),
("Pakistan","pk","pak"),
("Palau","pw","plw"),
("Panama","pa","pan"),
("Papua New Guinea","pg","png"),
("Paraguay","py","pry"),
("Peru","pe","per"),
("Philippines","ph","phl"),
("Poland","pl","pol"),
("Portugal","pt","prt"),
("Qatar","qa","qat"),
("Romania","ro","rou"),
("Russian Federation","ru","rus"),
("Rwanda","rw","rwa"),
("Saint Kitts and Nevis","kn","kna"),
("Saint Lucia","lc","lca"),
("Saint Vincent and the Grenadines","vc","vct"),
("Samoa","ws","wsm"),
("San Marino","sm","smr"),
("Sao Tome and Principe","st","stp"),
("Saudi Arabia","sa","sau"),
("Senegal","sn","sen"),
("Serbia","rs","srb"),
("Seychelles","sc","syc"),
("Sierra Leone","sl","sle"),
("Singapore","sg","sgp"),
("Slovakia","sk","svk"),
("Slovenia","si","svn"),
("Solomon Islands","sb","slb"),
("Somalia","so","som"),
("South Africa","za","zaf"),
("South Sudan","ss","ssd"),
("Spain","es","esp"),
("Sri Lanka","lk","lka"),
("Sudan","sd","sdn"),
("Suriname","sr","sur"),
("Sweden","se","swe"),
("Switzerland","ch","che"),
("Syrian Arab Republic","sy","syr"),
("Tajikistan","tj","tjk"),
("Tanzania, United Republic of","tz","tza"),
("Thailand","th","tha"),
("Timor-Leste","tl","tls"),
("Togo","tg","tgo"),
("Tonga","to","ton"),
("Trinidad and Tobago","tt","tto"),
("Tunisia","tn","tun"),
("Turkey","tr","tur"),
("Turkmenistan","tm","tkm"),
("Tuvalu","tv","tuv"),
("Uganda","ug","uga"),
("Ukraine","ua","ukr"),
("United Arab Emirates","ae","are"),
("United Kingdom of Great Britain and Northern Ireland","gb","gbr"),
("United States of America","us","usa"),
("Uruguay","uy","ury"),
("Uzbekistan","uz","uzb"),
("Vanuatu","vu","vut"),
("Venezuela (Bolivarian Republic of)","ve","ven"),
("Viet Nam","vn","vnm"),
("Yemen","ye","yem"),
("Zambia","zm","zmb"),
("Zimbabwe","zw","zwe");

LTER TABLE
ALTER TABLE t_pays ADD COLUMN nom_pays_eng VARCHAR(75);

--
-- Table structure for table `t_ville`
--

DROP TABLE IF EXISTS `t_ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ville` (
  `Id_Ville` int NOT NULL AUTO_INCREMENT,
  `Nom_de_ville` varchar(64) NOT NULL,
  `NPA_ville` int NOT NULL,
  `Canton` varchar(2) NOT NULL,
  PRIMARY KEY (`Id_Ville`),
  KEY `Id_Ville` (`Id_Ville`),
  KEY `Canton` (`Canton`)
) ENGINE=InnoDB AUTO_INCREMENT=9400 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ville`
--
DROP TRIGGER IF EXISTS t_country_delete;
CREATE TRIGGER t_country_delete ON t_pays INSTEAD OF DELETE
AS BEGIN
    DECLARE @id INT;
    DECLARE @count INT;
    SELECT @id = id FROM DELETED;
    SELECT @count = COUNT(*) FROM t_ville WHERE pays_id = @id;
    IF @count = 0
        DELETE FROM country WHERE id = @id;
    ELSE
        THROW 51000, 'Can not delete - country is referenced in other tables', 1;
END;

--
-- Dumping data for table `t_address`
--

--
-- Create Temporary Table
--
