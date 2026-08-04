show user;

select * from employees;

select count(*) from employees;            

SELECT USER FROM DUAL;

SHOW USER;

SELECT USER FROM DUAL;

DESC employees;

SELECT employee_id, first_name, last_name FROM employees;


-- coop bank 


-- 01 -> insert into statement
-- view existing records in the department table
-- DML - Data manipulation language
-- select statement is used to selecting out all the exisiting records 
-- retrieve exisitng records

select * from hr.departments order by department_id desc;

-- insert a new record- dml language
-- reference schema name(hr). table name (departments) to prevent error in data input  
-- ->'' single quotation vs double quotation

insert into hr.departments (department_id, department_name, manager_id, Location_id) values (280, 'IT training', 103,1400);

-- shortcut: The column list can be left out as long as one specifies value for each column in the correct order

insert into hr.departments values (290 ,'user training' , 103, 1400);



-- 02 -> inserting ros with NULL value
-- view existing records in the epartment table
select * from hr.departments order by department_id desc;

-- insert a new reocrd with nulls - use the keyword of 'null' for the column where i i accepted
insert into hr.departments (department_id, department_name, manager_id,location_id) values (300,'research', null, 1700);

-- shortcut. the column list can be left out as you specify values for each column in the correct order 

-- adding single quotes on null attemts to put text-string onto number -> outputs an ERROR
insert into hr.departments values (310, 'brian' ,'null', 1700);



-- 03 -> inserting special values
-- strucutre of table
-- use of special values that can insert values automatically

-- viewing exisinting records
select * from hr.employees order by employee_id desc;

-- use the SYSDATE funtion to automatically eneter todays date as the gire date
insert into hr.employees (employee_id, first_name, last_name, Email, phone_number, Hire_date, Job_id, salary, commission_pct,manager_id,department_id) values (207,'Sharon','Andershon','SANDERSON', '123.456.7890',SYSDATE ,'AC_MGR',10000,NULL,101,110);



-- 04 -> update statement - dml statement
-- implementing changes using update statement

-- view existing records in the department table
select * from hr.departments order by department_id desc;

-- change a value in the table using the UPDATE statement
-- BE SURE to SPECIFIY a WHERE clause! - otherwise it would update every record i.e use the unique identifier to update a certain record
-- update statement updates the table and all dml statements act against a table
-- SET operator against the column that we want to change. sets the value equal to 
-- update multiple columns in a gived column  WHERE clause is not used
update hr.departments set department_name ='Research and developement' where department_id = 300;



-- 05 -> TRUNCATE statement
-- removing records from a table using either DELETE statement or the TRUNCATE TABLE statement
-- a copy of the table is made to prevent affecting original records especially in a production environment while one is learning and testing 

-- view exisiting records
select * from hr.departments_copy order by department_id desc;

-- remove a single record using rhe DELETE statemenet. BE sure to use a WHERE clause
delete from hr.departments_copy where department_id=300;

-- removing multiple recors using the delete statement by removing the where clause
delete from hr.departments_copy where department_id >=200;
delete from hr.departments_copy where department_id between 200 and 400;

-- remove all records using the delete statemenet by removing the where clause 
-- data mainipulation languge - has rollbanck before commit
--dropin the table deletes the table entirely
delete from hr.departments_copy;
-- data definition language. has no rollback 
-- remove all records using the truncate tabll statemenet
truncate table hr.departments_copy;



-- 06 -> transactions is a unit of work that can be committed or rollback
-- if a problem occurs, change is discarded
-- allows database to be consistent
-- rollback ,commit statement issued in oracle
-- verify records
select * from departments_copy;

-- delete all records form the table 
delete from departments_copy;

-- undo changes to database, rollbacks all changes made in a session
rollback;

--commit transaction changes
commit;

--attemt to restore the record changes
rollback;



-- 07 -> savepoint - controlling transaction management
-- verify records
select * from departments_copy order by department_id desc;

-- insert a new record
insert into departments_copy values (310, 'quality control', null, null);

-- create a savepoint to 'protect' the new reocrd
savepoint after_insert;

--delete an existing record
delete from departments_copy where department_id = 300;
 
-- discard the delete operation without discarding the earlier insert operation 
rollback to after_insert;



-- 09 -> Statement-level rollback
-- allows control of statements manually
-- if a single DMl statement fills during execution, only that statement is rolled back
--  the oracle server implements an implicit savepoint - handled by oracle
-- all changes are retrived
-- user should terminate transactions explicitly by executing a COMMIT or ROLLBACK statement



-- 10 -> read consistency of data all the time prevents other users from viewing transactions in progress
-- most database enviroments consist of a number of databases connected with many users at the same time  (changes or writing to database or selecting data or reading data )
-- mechanism for all tranaction are not interfering with each other

-- verify record
select * from departments order by department_id desc;

--change the department name
update departments set department_name = 'product testing' where department_id =310;

-- transaction in progress
-- commit the update operation to the database
commit;

-- concurrency - many users connected to the same database 


-- manual data locking
-- making modifications to tables in oracle,
-- the database engine acquires the necessary locks automatically to prevent collition of transactions between users
-- high level of concurrency - same record at the same time
-- appropriate lock, appropriate level and appropriate time