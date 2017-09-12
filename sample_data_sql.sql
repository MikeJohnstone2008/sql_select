drop table if exists student;

create table student (
	student_id int(11) unsigned NOT NULL AUTO_INCREMENT,
	first_name varchar(30) DEFAULT NULL,
	last_name varchar(30) DEFAULT NULL,
	years_of_experience tinyint(3) DEFAULT NULL,
	start_date date DEFAULT NULL,
	PRIMARY KEY (student_id)
);

insert into student (first_name, last_name, years_of_experience, start_date) values ('Eric','Ephram',2,'2016-03-31');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Greg','Gould',6,'2016-09-30');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Adam','Ant',5,'2016-06-02');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Howard','Hess',1,'2016-02-28');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Charles','Caldwell',7,'2016-05-07');
insert into student (first_name, last_name, years_of_experience, start_date) values ('James','Joyce',9,'2016-08-27');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Doug','Dumas',13,'2016-07-04');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Kevin','Kraft',3,'2016-04-15');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Frank','Fountain',8,'2016-01-31');
insert into student (first_name, last_name, years_of_experience, start_date) values ('Brian','Biggs',4,'2015-12-25');