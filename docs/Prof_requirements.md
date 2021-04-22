# Module 141 à faire

* __Semaine 1__ [Backup et recovery](#backup_et_recovery)
    -  __Semaine 2__ [Utiliser](#use_uwamp)
* __Semaine 1__ [USERS : GRANT, REVOKE](#grant_revoke)
* __Semaine 1:__ [Transactions, Commit and Rollback](#transaction)
* __Semaine 2:__ [Information Schema](#information_schema)
* __Semaine 3:__ [MariaDB](#MariaDB)
* __Semaine 4:__ [Adminer and Views](#views)
* __Semaine 5:__ [Triggers & Postgress Install](#triggers_postgres_install)
* __Semaine 6:__ [POSTGRE/MYSQL JSON EMOJIS](#Postgres)
* __Semaine 7:__ [Outils pour BD](#bd_utils)
* __Semaine 8:__ [Json et méthodes HTTP](#json_methode_http)
* __Semaine 9:__ [POSTGRE (GENERATE DATA)](#postgre)
* __Semaine 10:__ [MONGODB](#mongodb)

* __Semaine 11:__ Json et méthodes HTT

## <a name="backup_et_recover">Backup et recovery

* Vos sujets :

    * backup et restore d'une BD.
    * backup et restore de 3 BD.
    * Moteurs de stockage "BLACKHOLE" (https://sony-noel.developpez.com/tutorials/mysql/moteurs/?page=blackhole) et "CSV" (faire quelques essais  d'insertion de données et commenter les effets).

### <a name="use_uwamp">Utiliser Uwamp ou MariaDB


1) L'onglet DUMP dans PhpMyAdmin

2) L'outil "mysqldump"

une façon simple c'est de suivre la petite description de ce site:

https://www.commentcamarche.net/contents/694-importer-et-exporter-des-donnees-sous-mysql


vous devez lire les commandes au cœur du manuel

https://dev.mysql.com/doc/refman/8.0/en/using-mysqldump.html

(en français)

https://www.epsic.ch/secure/moodle/pluginfile.php/4664/mod_resource/content/1/refman-5.0-fr.pdf


Vous devez me montrez vos essais dans des scripts commentés. Il faut une certaine automatisation des "choses", faire du copier coller est un peu ennuyeux.



## <a name="grant_revoke">17.09.2020 USERS : GRANT, REVOKE


ps: ce dossier (accumulations de scripts commentés) peut-être fait seul ou à deux personnes au maximum.
Modifié le: jeudi 17 septembre 2020, 08:43


## <a name="transactions">Transactions (COMMIT, ROLLBACK) 24.09.2020

Transactions (COMMIT, ROLLBACK)

Autocommit (activer, désactiver, interroger)

Transactions. (INSERT, UPDATE, DELETE)


## <a name="information_schema">Approche de la BD "INFORMATION SCHEMA" MySql 01.10.2020
A l'aide de PhpMyAdmin...
    • Faire des requêtes en ouvrant la BD "INFORMATION SCHEMA"

    • Ouvrir la table "TABLES"

    • DONC : cliquez sur la colonne "TABLE_ROWS" vous obtenez le nombre de colonnes contenues dans vos bd.. recliquez et c'est le nombre maximal qui est affiché en premier. Récupérez la requête pour vous scripts avec un "p'tit" commentaire de ce qu'elle est censé faire.
```sql
SELECT * FROM `TABLES` ORDER BY `TABLES`.`TABLE_ROWS` DESC
```

    • Pour vous enfoncer dans la connaissance passez donc la requête ci-dessous... décrire le résultat 
```sql
SELECT * FROM `TABLES`  
WHERE TABLE_SCHEMA NOT IN ("information_schema","performance_schema","phpmyadmin","mysql","sys")
ORDER BY `TABLES`.`TABLE_ROWS`  DESC
LIMIT 700
```
    • Dans la requête ci-dessus, changer un paramètre pour afficher l'ordre inverse.
    • Faites quelques requêtes de ce genre sur l'information schéma :
- Si vous avez l'intention de connaître les variable globales "GLOBAL_VARIABLES"
vous aurez une erreur...(rose...pas rouge..mais un joli rose...comme un cochonnet )...
passez donc la commande ci-dessous dans votre onglet "SQL" de PhpMyAdmin
`set @@global.show_compatibility_56=ON;`

    • Chercher des noms de colonnes qui commencent par ... essayez et décrire..
```sql
SELECT TABLE_SCHEMA, COLUMN_NAME FROM `STATISTICS`
WHERE TABLE_SCHEMA NOT IN ("information_schema","performance_schema","phpmyadmin","mysql","sys") AND COLUMN_NAME REGEXP BINARY '^fk'
LIMIT 700
```
    • Beaucoup de données qui se trouvent dans "INFORMATION_SCHEMA" peuvent s'approcher par les commandes [SHOW](https://dev.mysql.com/doc/refman/8.0/en/show.html)

## <a name="MariaDB">MariaDB (04.11.2020)

Vous devez avoir installé MariaDB (https://mariadb.com/kb/en/upgrading-from-mysql-to-mariadb/) sur une de vos machines virtuelles ou n'importe où.... d'ailleurs.
Lire, parcourir ces deux articles, cela va déboucher sur des questions techniques, donc il faut au moins importer votre base de donnée dans MariaDB [(migrating to mariadb)](https://mariadb.com/kb/en/migrating-to-mariadb/). Comme toujours, décrivez brièvement comment vous avez exporté et importé votre BD.
[Top 10 base de donnes](https://www.digora.com/fr/blog/TOP-10-des-bases-de-donnees)
[mariadb vs mysql](https://mariadb.com/kb/fr/mariadb-vs-mysql-features/)

## <a name="adminer"> Adminer & Triggers (19.11.2020)

en accord avec l'injustice globale, il est normal, selon le comparatif ci-dessous) qu'Adminer de SON point de vue soit bien meilleur que PhPMyAdmin :

[phpmyadmin](https://www.adminer.org/en/phpmyadmin/)

Selon des "bruits de couloir" vous avez déjà "touché" ADMINER.... dans ce module 141, à vous d'être touché par grâce et son intelligence intrinsèque (hein train sec)


En référence au document du comparatif ci-dessus...Répondez par des exemples sous forme de script MySql sur VOTRE base de données. Qu'est ce qu'un TRIGGER ?

[how to manage and use mysql database triggers on ubuntu 18-04](https://www.digitalocean.com/community/tutorials/how-to-manage-and-use-mysql-database-triggers-on-ubuntu-18-04-fr)


## <a name="views">Adminer & VIEWS... et LONGBLOB (26.11.2020)


[adminer-phpmyadim](https://www.adminer.org/en/phpmyadmin/)


En référence au document du comparatif ci-dessus...Répondez par des exemples sous forme de script MySql sur VOTRE base de données. Qu'est ce qu'un VUE ?

Comment faire un INSERT dans un champ de type BLOB, LONGBLOB ? Un petit script pour montrer votre maîtrise de ces petites choses.

## <a name="triggers_postgres_install">TRIGGERS et Installation de POSTGRE (03.12.2020)


Faire un TRIGGER BEFORE UPDATE avec un test IF


Installer POSTGRE avec les décisions IMPORTANTES pour le bon déroulement de l’installation ..(pas TROP de PRINT SCREEN merci...)

Juste savoir comment définir certaines étapes cruciales pour que tout fonctionne bien.

https://www.postgresqltutorial.com/install-postgresql/


## <a name="Postgres">POSTGRES/MYSQL JSON EMOJIS (17.12.2020)

Tout est dans le titre.

Stocker des émojis (POSTGRE et MYSQL)

Exporter des données depuis MySql en JSON

Définir un champ de type JSON et y insérer des données (POSTGRE et MYSQL)

## <a name="bd_outils">Outils pour BD

Faire un schéma de votre BD avec un des outils suivants (préférence pour [dbeaver](https://dbeaver.io/))


[pgadmin](https://www.pgadmin.org/)

[dbeaver](https://dbeaver.io/)

[navicat](https://www.navicat.com/fr)

[datagrip](https://www.jetbrains.com/fr-fr/datagrip/)

[omnidb](https://omnidb.org/)

## <a name="json_methode_http">Json et méthodes HTTP


[jsonplaceholder.typicode](http://jsonplaceholder.typicode.com/)

[Http Methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)

## <a name="postgre"> POSTGRE (GENERATE DATA) 04.02.2021

Il faut vous inspirer de cela pour générer 1 million d'utilisateurs avec des noms aléatoires.

[makina-corpus.com](https://makina-corpus.com/blog/metier/2017/postgresql-utilisations-avancees-de-generate_series-pour-generer-du-contenu)

## <a name="mongodb"> MONGODB 11.03.2021

[Openclassrooms](https://openclassrooms.com/fr/courses/4462426-maitrisez-les-bases-de-donnees-nosql/4474601-decouvrez-le-fonctionnement-de-mongodb)
[Meraki free-demo](https://meraki.cisco.com/fr-fr/free-demo/)


### OM

Rien à voir, mais culture générale souhaitée. ps: https://video.fosdem.org/
