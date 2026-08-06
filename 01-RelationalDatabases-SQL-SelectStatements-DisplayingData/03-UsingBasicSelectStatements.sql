show user;

select count(*) from employees;            

SELECT USER FROM DUAL;

DESC employees;

-- 01 -> the basic SELECT statement
-- basic components of a SELECT statement (most common statements issued into a databases)
-- used to retrive records from a table or tables multi-table statements

-- Basic structure of the SELECT statement
-- Select column list ( *, column1,column2....)
-- From table(s)(multitable statements)
-- Where filter condition (where clause with filter if one doesnt want to see every row)
-- Order BY Desired column(s) (sort the results)
-- (more componets are available to use)

-- Use a basic SELECT statement to retrive all reocrds from a table
SELECT * from employees;

--Select only the desired column
select Employee_ID, First_name, Last_name from employees;



-- 02 -> Writing SQL statements
-- continuaton of basic strucuture of select statement
-- rules, conventions, alternative methods that can be used to assemble select statement
-- key word SELECT, not case sensivie
-- autcomplete to prevent misspelling
-- drag and drop to also prevent mispselling
--common to see keyword separated from their own line
-- use of semi-collon  inicates and end of a statement

select first_name,last_name,employee_ID
from employees;














