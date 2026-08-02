show user;

select * from employees;

select count(*) from employees;            

SELECT USER FROM DUAL;

SHOW USER;

SELECT USER FROM DUAL;

DESC employees;

SELECT employee_id, first_name, last_name FROM employees;


-- coop bank 


--01 - insert into statement

--view existing records in the department table

--DML - Data manipulation language

--select statement is used to selecting out all the exisiting records 

--retrieve exisitng records

select * from hr.departments order by department_id desc;

--insert a new record- dml language
--reference schema name(hr). table name (departments) to prevent error in data input  
-- ->'' single quotation vs double quotation

insert into hr.departments (department_id, department_name, manager_id, Location_id) values (280, 'IT training', 103,1400);

--shortcut: The column list can be left out as long as one specifies value for each column in the correct order

insert into hr.departments values (290 ,'user training' , 103, 1400);



--02 -> inserting ros with NULL value
--view existing records in the epartment table
select * from hr.departments order by department_id desc;

-- insert a new reocrd with nulls - use the keyword of 'null' for the column where i i accepted
insert into hr.departments (department_id, department_name, manager_id,location_id) values (300,'research', null, 1700);

--shortcut. the column list can be left out as you specify values for each column in the correct order 

-- adding single quotes on null attemts to put text-string onto number -> outputs an ERROR
insert into hr.departments values (310, 'brian' ,'null', 1700);

--3 -> inserting special values
--strucutre of table
-- use of special values that can insert








