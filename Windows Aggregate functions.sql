-- Create the employees table
CREATE TABLE emp_data (
EmpID VARCHAR(10) PRIMARY KEY,
EmpName VARCHAR(100),
Department VARCHAR(50),
Salary INT
);
-- Insert 16 records into the employees table
INSERT INTO emp_data(EmpID, EmpName, Department, Salary) VALUES
('EMP101', 'Chris Garcia', 'HR', 60000),
('EMP102', 'Michael Davis', 'HR', 60000),
('EMP103', 'Alex Davis', 'HR', 75000),
('EMP106', 'Jane Miller', 'IT', 75000),
('EMP107', 'David Smith', 'IT', 90000),
('EMP110', 'Emily Johnson', 'Sales', 55000),
('EMP111', 'John Johnson', 'Sales', 67000),
('EMP112', 'Chris Smith', 'Sales', 65000),
('EMP113', 'Laura Garcia', 'Marketing', 70000),
('EMP114', 'David Johnson', 'Marketing', 85000),
('EMP104', 'Laura Davis', 'HR', 93000),
('EMP105', 'Michael Martinez', 'IT', 95000),
('EMP108', 'Anna Brown', 'IT', 85000),
('EMP109', 'Sarah Wilson', 'IT', 95000),
('EMP115', 'Jane Davis', 'Marketing', 75000),
('EMP116', 'Alex Martinez', 'Marketing', 80000);

select * from emp_data;
--window functions : the function that performs calculations over set of rows related to current row.
--window aggregate functions

--find first highest salary
select max(salary) from emp_data;
-- to get it along the whole table.
-- over clause is used when u want some aggregate function along the whole table.
-- over --> over all the rows.
select * , max(salary) over() as max_salary from emp_data;

-- find which employee is getting first highest salary.
select * from
(select * , max(salary) over() as max_salary from emp_data)
where salary = max_salary;

--cte: common table expression.
-- Employee with highest salary
with cte as
(select * , max(salary) over() as max_salary from emp_data)
select * from cte where salary = max_salary;

-- find which employee will get minimum salary.
-- min_salary colum is created
select * , min(salary) over() as min_salary from emp_data;
-- employee with min salary.
select * from
(select * , min(salary) over() as min_salary from emp_data)
where salary = min_salary;

-- with cte
with cte as
(select * , min(salary) over() as min_salary from emp_data)
select * from cte where salary = min_salary;

--find which employee are getting salaries greater than average salary.
select * from
(select * , avg(salary) over() as avg_salary from emp_data)
where salary > avg_salary;

with cte as
(select * , avg(salary) over() as avg_salary from emp_data)
select * from cte where salary  > avg_salary;


-- find which employee is getting min salary among each dept.
select * , min(salary) over(partition by department) as min_salary from emp_data;

select * from
(select * , min(salary) over(partition by department) as min_salary from emp_data)
where salary = min_salary;
 

with cte as
(select * , min(salary) over() as min_salary from emp_data)
select * from cte where salary = min_salary;

-- find which employee is getting highest salary among each dept.
select * , max(salary) over(partition by department) as max_salary from emp_data;

select * from
(select * , max(salary) over(partition by department) as max_salary from emp_data)
where salary = max_salary;
 

with cte as
(select * , max(salary) over() as max_salary from emp_data)
select * from cte where salary = max_salary;

--find dept and employees where number of employees are greater than 4.
-- for number of employess ==> use Count.
select * , count(*) over(partition by department) as emp_count from emp_data;

select * from
(select * ,count(*) over(partition by department) as emp_count from emp_data)
where emp_count > 4;

with cte as
(select * ,count(*) over(partition by department) as emp_count from emp_data)
select * from cte where emp_count > 4;




