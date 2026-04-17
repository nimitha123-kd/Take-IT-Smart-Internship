-- DDL commands
-- Create Flipkart database
create database flipkart;

-- Drop flipkart database
drop database flipkart;

-- create table
create table emp_data
(empid int primary key,
	empname varchar(30) not null,
	exp int,
	salary int ,
	company varchar(20),
	country varchar(20) default 'India',
	age int check (age>18));




-- ALter 
-- add column : address
Alter table emp_data
add column address varchar(30) not null;

-- add column : phoneno , email
Alter table emp_data
add column phoneno varchar(10) not null,
	add column email varchar(30) unique ;

-- drop address columns
Alter table emp_data
drop column address;

-- drop email and phone number
Alter table emp_data
drop column email,
drop column phoneno;

-- rename column
-- exp as emp_exp
Alter table emp_data
rename exp to emp_exp;

-- change data type
-- change empname to varchar(100)

Alter table emp_data
Alter column empname type varchar(100);


-- Rename table
ALter table emp_data rename to emp_details;

-- drop table
Drop table emp_details;


select * from emp_details;







