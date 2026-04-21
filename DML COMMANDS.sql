-- DML COMMANDS ==> data manipulation language
-- insert
-- upadte
-- delete

create table emp_table
(empid int primary key,
	empname varchar(30),
	exp int , company varchar(20),
	salary int , age int check(age>18),
	country varchar(20) default 'India');

insert into emp_table values
(101,'John',2,'IBM',40000,25,'India');

insert into emp_table values
(102,'Jeevan',3,'IBM',50000,26,'India'),
	(103,'Riya',4,'TCS',60000,30,'India'),
	(104,'Rohan',7,'IBM',80000,29,'India'),
	(105,'Zara',10,'Google',90000,32,'India');


insert into emp_table(empid,empname) values
(107,'Ridaa');

-- update: change values
-- update age of RIdaa as 24
update emp_table
	set age=24 where empid=107;

-- update exp=2,salary=30000,company=TCS at Ridaa
update emp_table
	set exp=2,salary=30000,company='TCS' where empid=107;

-- update salary of John and Jeevan as 80000
update emp_table
	set salary=80000 where empid in (101,102);
select * from emp;

-- delete: used to delete records
-- delete record related t0 Jeevan
delete from emp_table
where empid=102;

-- delete all teh records where exp is greater than 5
delete from emp_table
where exp>5;
