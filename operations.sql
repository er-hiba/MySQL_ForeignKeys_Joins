mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
9 rows in set (0.08 sec)

mysql> use isgi;
Database changed
mysql> show tables;
+----------------+
| Tables_in_isgi |
+----------------+
| stagiaire      |
+----------------+
1 row in set (0.13 sec)

mysql> desc stagiaire;
+-----------+-------------+------+-----+-----------+-------------------+
| Field     | Type        | Null | Key | Default   | Extra             |
+-----------+-------------+------+-----+-----------+-------------------+
| CIN       | varchar(10) | NO   | PRI | NULL      |                   |
| NomSTG    | varchar(30) | YES  |     | NULL      |                   |
| Age       | int         | YES  |     | NULL      |                   |
| Filiere   | varchar(50) | YES  |     | NULL      |                   |
| Ville     | varchar(10) | YES  |     | Marrakech |                   |
| Date_insc | date        | YES  |     | curdate() | DEFAULT_GENERATED |
+-----------+-------------+------+-----+-----------+-------------------+
6 rows in set (0.01 sec)

mysql> select * from stagiaire;
+-----------+--------+------+---------+-----------+------------+
| CIN       | NomSTG | Age  | Filiere | Ville     | Date_insc  |
+-----------+--------+------+---------+-----------+------------+
| AA123456  | HIba   |   19 | Dev     | Marrakech | 2023-03-20 |
| BB123456  | Hind   |   18 | info    | Marrakech | NULL       |
| CC1234564 | omar   |   21 | web     | Marrakech | 2024-02-08 |
+-----------+--------+------+---------+-----------+------------+
3 rows in set (0.01 sec)

mysql> create table etudiant like stagiaire;
Query OK, 0 rows affected (0.10 sec)

mysql> show tables;
+----------------+
| Tables_in_isgi |
+----------------+
| etudiant       |
| stagiaire      |
+----------------+
2 rows in set (0.00 sec)

mysql> desc etudiant;
+-----------+-------------+------+-----+-----------+-------------------+
| Field     | Type        | Null | Key | Default   | Extra             |
+-----------+-------------+------+-----+-----------+-------------------+
| CIN       | varchar(10) | NO   | PRI | NULL      |                   |
| NomSTG    | varchar(30) | YES  |     | NULL      |                   |
| Age       | int         | YES  |     | NULL      |                   |
| Filiere   | varchar(50) | YES  |     | NULL      |                   |
| Ville     | varchar(10) | YES  |     | Marrakech |                   |
| Date_insc | date        | YES  |     | curdate() | DEFAULT_GENERATED |
+-----------+-------------+------+-----+-----------+-------------------+
6 rows in set (0.01 sec)

mysql> select * from etudiant;
Empty set (0.02 sec)

mysql> alter table etudiant
    -> drop column Age,
    -> drop column Filiere,
    -> drop column Ville,
    -> drop column Date_insc;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc etudiant;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| CIN    | varchar(10) | NO   | PRI | NULL    |       |
| NomSTG | varchar(30) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table groupe(
    -> CodeGRP mediumint primary key,
    -> NomGRP varchar(10),
    -> Filiere varchar(30));
Query OK, 0 rows affected (0.05 sec)

mysql> desc groupe;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| CodeGRP | mediumint   | NO   | PRI | NULL    |       |
| NomGRP  | varchar(10) | YES  |     | NULL    |       |
| Filiere | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into etudiant
    -> values
    -> ('AA123456', 'Hiba'),
    -> ('BB123456', 'Aabla'),
    -> ('CC123456', 'Nickie');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from etudiant;
+----------+--------+
| CIN      | NomSTG |
+----------+--------+
| AA123456 | Hiba   |
| BB123456 | Aabla  |
| CC123456 | Nickie |
+----------+--------+
3 rows in set (0.00 sec)

mysql> insert into groupe
    -> values
    -> (1, 'Dev104', 'Développement Digital'),
    -> (2, 'Dev102', 'Développement Digital'),
    -> (3, 'ID103', 'Infrastructure Digitale'),
    -> (4, 'SIR24', 'Systèmes Informatiques R');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from groupe;
+---------+--------+--------------------------+
| CodeGRP | NomGRP | Filiere                  |
+---------+--------+--------------------------+
|       1 | Dev104 | Développement Digital    |
|       2 | Dev102 | Développement Digital    |
|       3 | ID103  | Infrastructure Digitale  |
|       4 | SIR24  | Systèmes Informatiques R |
+---------+--------+--------------------------+
4 rows in set (0.00 sec)

mysql> create table groupe_copy like groupe;
Query OK, 0 rows affected (0.05 sec)

mysql> desc groupe_copy;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| CodeGRP | mediumint   | NO   | PRI | NULL    |       |
| NomGRP  | varchar(10) | YES  |     | NULL    |       |
| Filiere | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into groupe_copy select * from groupe;
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from groupe_copy;
+---------+--------+--------------------------+
| CodeGRP | NomGRP | Filiere                  |
+---------+--------+--------------------------+
|       1 | Dev104 | Développement Digital    |
|       2 | Dev102 | Développement Digital    |
|       3 | ID103  | Infrastructure Digitale  |
|       4 | SIR24  | Systèmes Informatiques R |
+---------+--------+--------------------------+
4 rows in set (0.00 sec)

mysql> show tables;
+----------------+
| Tables_in_isgi |
+----------------+
| etudiant       |
| groupe         |
| groupe_copy    |
| stagiaire      |
+----------------+
4 rows in set (0.00 sec)

mysql> alter table etudiant
    -> add column CodeGRP mediumint;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table etudiant
    -> add foreign key (CodeGRP) references groupe(CodeGRP);
Query OK, 3 rows affected (0.12 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> desc etudiant;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| CIN     | varchar(10) | NO   | PRI | NULL    |       |
| NomSTG  | varchar(30) | YES  |     | NULL    |       |
| CodeGRP | mediumint   | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from etudiant;
+----------+--------+---------+
| CIN      | NomSTG | CodeGRP |
+----------+--------+---------+
| AA123456 | Hiba   |    NULL |
| BB123456 | Aabla  |    NULL |
| CC123456 | Nickie |    NULL |
+----------+--------+---------+
3 rows in set (0.00 sec)

mysql> update etudiant
    -> set CodeGRP = 1 where CIN = 'AA123456';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update etudiant
    -> set CodeGRP = 3 where CIN = 'CC123456';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update etudiant
    -> set CodeGRP = 4 where CIN = 'BB1234564';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from etudiant;
+----------+--------+---------+
| CIN      | NomSTG | CodeGRP |
+----------+--------+---------+
| AA123456 | Hiba   |       1 |
| BB123456 | Aabla  |    NULL |
| CC123456 | Nickie |       3 |
+----------+--------+---------+
3 rows in set (0.00 sec)

mysql> update etudiant
    -> set CodeGRP = 4 where CIN = 'BB123456';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from etudiant;
+----------+--------+---------+
| CIN      | NomSTG | CodeGRP |
+----------+--------+---------+
| AA123456 | Hiba   |       1 |
| BB123456 | Aabla  |       4 |
| CC123456 | Nickie |       3 |
+----------+--------+---------+
3 rows in set (0.00 sec)

mysql> select * from groupe;
+---------+--------+--------------------------+
| CodeGRP | NomGRP | Filiere                  |
+---------+--------+--------------------------+
|       1 | Dev104 | Développement Digital    |
|       2 | Dev102 | Développement Digital    |
|       3 | ID103  | Infrastructure Digitale  |
|       4 | SIR24  | Systèmes Informatiques R |
+---------+--------+--------------------------+
4 rows in set (0.01 sec)

mysql> delete from groupe where CodeGRP = 3;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`isgi`.`etudiant`, CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`CodeGRP`) REFERENCES `groupe` (`CodeGRP`))
mysql> delete from groupe where CodeGRP = 2;
Query OK, 1 row affected (0.01 sec)

mysql> select * from groupe;
+---------+--------+--------------------------+
| CodeGRP | NomGRP | Filiere                  |
+---------+--------+--------------------------+
|       1 | Dev104 | Développement Digital    |
|       3 | ID103  | Infrastructure Digitale  |
|       4 | SIR24  | Systèmes Informatiques R |
+---------+--------+--------------------------+
3 rows in set (0.00 sec)

mysql> select * from etudiant join groupe where etudiant.CodeGRP = groupe.CodeGRP;
+----------+--------+---------+---------+--------+--------------------------+
| CIN      | NomSTG | CodeGRP | CodeGRP | NomGRP | Filiere                  |
+----------+--------+---------+---------+--------+--------------------------+
| AA123456 | Hiba   |       1 |       1 | Dev104 | Développement Digital    |
| BB123456 | Aabla  |       4 |       4 | SIR24  | Systèmes Informatiques R |
| CC123456 | Nickie |       3 |       3 | ID103  | Infrastructure Digitale  |
+----------+--------+---------+---------+--------+--------------------------+
3 rows in set (0.00 sec)

mysql> alter table etudiant
    -> rename NomSTG to NomETU;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to NomETU' at line 2
mysql> alter table etudiant
    -> rename column NomSTG to NomETU;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc etudiant;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| CIN     | varchar(10) | NO   | PRI | NULL    |       |
| NomETU  | varchar(30) | YES  |     | NULL    |       |
| CodeGRP | mediumint   | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from etudiant;
+----------+--------+---------+
| CIN      | NomETU | CodeGRP |
+----------+--------+---------+
| AA123456 | Hiba   |       1 |
| BB123456 | Aabla  |       4 |
| CC123456 | Nickie |       3 |
+----------+--------+---------+
3 rows in set (0.00 sec)

mysql> select * from etudiant join groupe where etudiant.CodeGRP = groupe.CodeGRP;
+----------+--------+---------+---------+--------+--------------------------+
| CIN      | NomETU | CodeGRP | CodeGRP | NomGRP | Filiere                  |
+----------+--------+---------+---------+--------+--------------------------+
| AA123456 | Hiba   |       1 |       1 | Dev104 | Développement Digital    |
| BB123456 | Aabla  |       4 |       4 | SIR24  | Systèmes Informatiques R |
| CC123456 | Nickie |       3 |       3 | ID103  | Infrastructure Digitale  |
+----------+--------+---------+---------+--------+--------------------------+
3 rows in set (0.00 sec)

mysql> select CIN, NomETU, NomGRP, Filiere from etudiant join groupe where etudiant.CodeGRP = groupe.CodeGRP;
+----------+--------+--------+--------------------------+
| CIN      | NomETU | NomGRP | Filiere                  |
+----------+--------+--------+--------------------------+
| AA123456 | Hiba   | Dev104 | Développement Digital    |
| BB123456 | Aabla  | SIR24  | Systèmes Informatiques R |
| CC123456 | Nickie | ID103  | Infrastructure Digitale  |
+----------+--------+--------+--------------------------+
3 rows in set (0.00 sec)

mysql>