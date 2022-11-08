create database techmac_db;
use techmac_db;
create table techhyve_employees
(
employee_id int primary key,
first_name varchar(30),
last_name varchar(30),
gender varchar(10),
age int
);
create table techcloud_employees
(
employee_id int primary key,
first_name varchar(30),
last_name varchar(30),
gender varchar(10),
age int
);
create table techsoft_employees
(
employee_id varchar(10) primary key,
first_name varchar(30),
last_name varchar(30),
gender varchar(10),
age int
);
alter table techsoft_employees add (proficiency_level int check(proficiency_level>0 and proficiency_level<6));
alter table techcloud_employees add (proficiency_level int check(proficiency_level>0 and proficiency_level<6));
alter table techhyve_employees add (proficiency_level int check(proficiency_level>0 and proficiency_level<6));
alter table techsoft_employees modify proficiency_level int check(proficiency_level>0 and proficiency_level<6) default 1;
alter table techhyve_employees modify proficiency_level int check(proficiency_level>0 and proficiency_level<6) default 1;
alter table techcloud_employees modify proficiency_level int check(proficiency_level>0 and proficiency_level<6) default 1;
alter table techsoft_employees modify age int check(age>21 and age<55);
alter table techhyve_employees modify age int check(age>21 and age<55);
alter table techcloud_employees modify age int check(age>21 and age<55);

desc techhyve_employees;
alter table techsoft_employees modify employee_id varchar(10);
alter table techhyve_employees modify employee_id varchar(10);
alter table techcloud_employees modify employee_id varchar(10);

insert into techhyve_employees values('TH0001','Eli','Evans','Male',26,1);
insert into techhyve_employees values('TH0002','Carlos','Simmons','Male',32,2);
insert into techhyve_employees values('TH0003','Kathie','Bryant','Female',25,1);
insert into techhyve_employees values('TH0004','Joey','Hughes','Male',41,4);
insert into techhyve_employees values('TH0005','Alice','Matthews','Female',52,4);

insert into techcloud_employees values('TC0001','Teresa','Bryant','Female',39,2);
insert into techcloud_employees values('TC0002','Alexis','Patterson','Male',48,5);
insert into techcloud_employees values('TC0003','Rose','Bell','Male',42,3);
insert into techcloud_employees values('TC0004','Gemma','Watkins','Male',44,3);
insert into techcloud_employees values('TC0005','Kingston','Martinez','Male',29,2);

insert into techsoft_employees values('TS0001','Peter','Burtler','Male',44,4);
insert into techsoft_employees values('TS0002','Harold','Simmons','Male',54,4);
insert into techsoft_employees values('TS0003','Juliana','Sanders','Male',36,2);
insert into techsoft_employees values('TS0004','Paul','Ward','Male',29,2);
insert into techsoft_employees values('TS0005','Nicole','Bryant','Male',30,2);

create table techhyve_employees_bkp like techhyve_employees;
insert techhyve_employees_bkp select* from techhyve_employees;

create table techcloud_employees_bkp like techcloud_employees;
insert techcloud_employees_bkp select* from techcloud_employees;

create table techsoft_employees_bkp like techsoft_employees;
insert techsoft_employees_bkp select* from techsoft_employees;

delete from techhyve_employees where employee_id='TH0003';
delete from techhyve_employees where employee_id='TH0005';

select* from techhyve_employees;

delete from techcloud_employees where employee_id='TC0001';
delete from techcloud_employees where employee_id='TC0004';

create table techhyvecloud_employees like techcloud_employees;
insert techhyvecloud_employees select* from techhyve_employees;
insert techhyvecloud_employees select* from techcloud_employees;
select* from techhyvecloud_employees;

truncate table techhyve_employees;
truncate table techcloud_employees;