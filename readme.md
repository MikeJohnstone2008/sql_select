--#1:
mysql> SELECT first_name, last_name
    -> FROM student
    -> ;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Eric       | Ephram    |
| Greg       | Gould     |
| Adam       | Ant       |
| Howard     | Hess      |
| Charles    | Caldwell  |
| James      | Joyce     |
| Doug       | Dumas     |
| Kevin      | Kraft     |
| Frank      | Fountain  |
| Brian      | Biggs     |
+------------+-----------+
10 rows in set (0.00 sec)

mysql>

--#2:
mysql> SELECT * FROM student WHERE years_of_experience < 8;
+------------+------------+-----------+---------------------+------------+
| student_id | first_name | last_name | years_of_experience | start_date |
+------------+------------+-----------+---------------------+------------+
|          1 | Eric       | Ephram    |                   2 | 2016-03-31 |
|          2 | Greg       | Gould     |                   6 | 2016-09-30 |
|          3 | Adam       | Ant       |                   5 | 2016-06-02 |
|          4 | Howard     | Hess      |                   1 | 2016-02-28 |
|          5 | Charles    | Caldwell  |                   7 | 2016-05-07 |
|          8 | Kevin      | Kraft     |                   3 | 2016-04-15 |
|         10 | Brian      | Biggs     |                   4 | 2015-12-25 |
+------------+------------+-----------+---------------------+------------+
7 rows in set (0.01 sec)

mysql>

--#3:
mysql> SELECT student_id, last_name, start_date FROM student Order BY last_name asc;
+------------+-----------+------------+
| student_id | last_name | start_date |
+------------+-----------+------------+
|          3 | Ant       | 2016-06-02 |
|         10 | Biggs     | 2015-12-25 |
|          5 | Caldwell  | 2016-05-07 |
|          7 | Dumas     | 2016-07-04 |
|          1 | Ephram    | 2016-03-31 |
|          9 | Fountain  | 2016-01-31 |
|          2 | Gould     | 2016-09-30 |
|          4 | Hess      | 2016-02-28 |
|          6 | Joyce     | 2016-08-27 |
|          8 | Kraft     | 2016-04-15 |
+------------+-----------+------------+
10 rows in set (0.00 sec)

--#4:
mysql> SELECT * FROM student WHERE first_name IN ('Adam', 'James', 'Frank') ORDER BY last_name desc;
+------------+------------+-----------+---------------------+------------+
| student_id | first_name | last_name | years_of_experience | start_date |
+------------+------------+-----------+---------------------+------------+
|          6 | James      | Joyce     |                   9 | 2016-08-27 |
|          9 | Frank      | Fountain  |                   8 | 2016-01-31 |
|          3 | Adam       | Ant       |                   5 | 2016-06-02 |
+------------+------------+-----------+---------------------+------------+
3 rows in set (0.00 sec)

--#5:
mysql> SELECT first_name, last_name, start_date FROM student WHERE start_date between '2016-01-01' and '2016-06-30' ORDER BY start_date desc;
+------------+-----------+------------+
| first_name | last_name | start_date |
+------------+-----------+------------+
| Adam       | Ant       | 2016-06-02 |
| Charles    | Caldwell  | 2016-05-07 |
| Kevin      | Kraft     | 2016-04-15 |
| Eric       | Ephram    | 2016-03-31 |
| Howard     | Hess      | 2016-02-28 |
| Frank      | Fountain  | 2016-01-31 |
+------------+-----------+------------+
6 rows in set (0.00 sec)

--Medium challenge:
mysql> CREATE TABLE `grade` (
    ->   `grade_id` int NOT NULL AUTO_INCREMENT,
    ->   `grade_name` varchar(50) NOT NULL,
    ->   PRIMARY KEY (`grade_id`)
    -> );
Query OK, 0 rows affected (0.01 sec)


mysql> INSERT INTO grade (grade_name) VALUES ("Incomplete"), ("Complete and unsatisfactory"), ("Complete and satisfactory"), ("Exceeds expectations"), ("Not graded");
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX grade_idx
    -> ON grade (grade_id);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> CREATE INDEX assmt_grade_idx
    -> ON assignment (grade_id);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> ALTER TABLE assignment
    -> ADD CONSTRAINT FK_gradeName
    -> FOREIGN KEY (grade_id) REFERENCES grade(grade_id);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> explain assignment;
+----------------+------------------+------+-----+---------+----------------+
| Field          | Type             | Null | Key | Default | Extra          |
+----------------+------------------+------+-----+---------+----------------+
| assignment_id  | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| student_id     | int(11)          | NO   |     | NULL    |                |
| assignment_nbr | int(11)          | NO   |     | NULL    |                |
| class_id       | int(11)          | YES  |     | NULL    |                |
| grade_id       | int(11)          | YES  | MUL | NULL    |                |
+----------------+------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> select * from assignment;
Empty set (0.00 sec)

mysql> explain grade;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| grade_id   | int(11)     | NO   | PRI | NULL    | auto_increment |
| grade_name | varchar(50) | NO   |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> select * from grade;
+----------+-----------------------------+
| grade_id | grade_name                  |
+----------+-----------------------------+
|        1 | Incomplete                  |
|        2 | Complete and unsatisfactory |
|        3 | Complete and satisfactory   |
|        4 | Exceeds expectations        |
|        5 | Not graded                  |
+----------+-----------------------------+
5 rows in set (0.00 sec)


--HARD:
mysql>  INSERT INTO assignment (student_id, assignment_nbr, class_id, grade_id) VALUES (3,2,100,5), (4,1,200,4), (5,1,200,3), (7,2,200,2);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from assignment;
+---------------+------------+----------------+----------+----------+
| assignment_id | student_id | assignment_nbr | class_id | grade_id |
+---------------+------------+----------------+----------+----------+
|             1 |          1 |              1 |      100 |        1 |
|             2 |          1 |              1 |      100 |        1 |
|             3 |          3 |              2 |      100 |        5 |
|             4 |          4 |              1 |      200 |        4 |
|             5 |          5 |              1 |      200 |        3 |
|             6 |          7 |              2 |      200 |        2 |
+---------------+------------+----------------+----------+----------+
6 rows in set (0.01 sec)

--create FK on assignment student_id
CREATE INDEX student_idx
ON assignment (student_id);
CREATE INDEX index_name
ON table_name (column1, column2, ...);

mysql> CREATE INDEX student_idx
    -> ON assignment (student_id);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> ALTER TABLE assignment Modify student_id int(11) unsigned NOT NULL;
Query OK, 6 rows affected (0.04 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE assignment
    -> ADD CONSTRAINT FK_StudentNumber
    -> FOREIGN KEY (student_id) REFERENCES student(student_id);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

--TEST foreign key:

INSERT INTO assignment (student_id, assignment_nbr, class_id, grade_id) VALUES (100,2,200,5);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`tiy`.`assignment`, CONSTRAINT `FK_StudentNumber` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`))
