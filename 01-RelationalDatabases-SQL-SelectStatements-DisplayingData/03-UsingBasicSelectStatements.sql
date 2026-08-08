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
 
 
 
-- 03 -> Arithmetic Expressions
-- use of arithmetic operations in a SELECT statement(using when one has a numeric column)
-- four basic arithmetic operations are multiply, divide, add,subtract

-- using arithmeitc operations in a select statement

-- multiply the salary column by 12 to get an annual salary
--(derived column /calculated field) -> salary*12
select employee_id, first_name, Last_name, salary, salary * 12
from employees;

-- aivide by 4 to get a weekly salary
select employee_id , first_name, last_name, salary ,salary / 4 
from employees;

-- add or subtract a value to estimate raise oe deduction
select employee_id, first_name, last_name, salary, salary + 500
from employees;

select employee_id, first_name, last_name, salary, salary - 500
from employees;


-- 04 -> operator precedence in arithmetic expressions
-- order of operations when calculations are combined
-- multiply-divide-add-subtract
-- alter default order of operation by using parentheses ()
-- using arithmetic operations in a select statement

-- alter the default order of operations by using parenthesis
select employee_id, first_name,Last_name, salary, salary * 12 + 500 from employees;

--functionally equivalent to the statement above, but clarifies the order (parenthesis ensures the operation in the parenthesis is done/implemented first)
select employee_id, first_name, Last_name, salary, (salary * 12) + 500 from employees;

--this statement performs the calculation of 500*12 first(equals 6000), then adds 6000 to the salary
select employee_id, first_name, last_name, salary ,salary + 500 * 12 from employees;

--this statement adds 500 o the monthly salary before multiplyin by 12(make sure the first operation is implemented first by placing them in parenthesis)
select employee_id ,first_name, last_name, salary , (salary +500) * 12 from employees;



-- 05 -> NULL value
-- presence of null. it is nothing. no valu ever entered
-- it does not indicate a value was entered then deleted, does not equate to zero or any other value (including other nulls)
-- null does not equal another null, its simply nothing
-- using arithmetic operations in a select statement

-- be mindful of nulls when performing calculations. 
select employee_id, first_name, last_name, salary, commission_pct from employees;

select employee_id, first_name,last_name, salary, commission_pct, salary*commission_pct from employees;



-- 06 -> column aliases to make results a little more meaningful
-- presenting the information to an end user through reports or saved view
-- name of any given column in any given table is set when the table is designed. 
-- not recommended to change the name of a column
-- using column aliases to make results more meaningful

-- without aliases, column names appear in the result as entered in the select statement
select employee_id, Last_name, salary ,salary * 12 from employees;

--using alias to prevent the reuslts ina more user-friendly manner
--use double quote to define the alias, the use of AS keyword is optional
select employee_id, last_name AS "name", salary "monthly salary",salary * 12"annual salary" from employees;



-- 07 -> concatenation operator
-- commonly used with text or character columns. can be used in numeric column
-- it is simply taking one column and attaching it to another column or combining more than two column together to from one single value

-- use two vertical bars (pipe character) to "attach two or more columns together into a single result"
select employee_id, last_name || job_id AS "employee position" from employees;

--concatenate multiple columns together to produce a new value 
select employee_id || manager_id || department_id AS "employee code" from employees;



-- 08 -> Literal character strings
-- enhancement of query results especially when using concatenation by using literal characters -included in the resultset

-- defnined in single quotes (along with concatenation) to enhace formatting
select employee_id ,first_name || ' ' || last_name as "full Name" from employees;

select employee_id, first_name || ', ' || last_name as "full name" from employees order by "full name";

-- literal character cana also begin the select list
select 'Employee: ' || last_name || ', ' || first_name || ' -> Position: ' || job_id as "employee Details" from employees;



-- 09 -> WHERE clause (common operator)
-- used as a filter to restrict the records that are returned and not view every record
-- without a where clause, oracle returns all/every record from any given table or collection of tables, against which is being queried
-- complicate criteria statement sych as issue multiple statements of criteria  (must meet and this condition , and this, and this , or that , or that )

-- find aall employees with a salary of greater than $10000
select * from employees where salary >= 10000;

-- find all employees with a  salary of greater than or equal to $10000 but less than or equal to $20000
select * from employees where salary >= 10000 and salary <= 20000 ; -- must indicate column name when using add
-- could be re-writen as BETWEEN 10000 and 20000
select * from employees where salary BETWEEN 10000 AND  20000 ;

-- find employees with a specific last name
select * from employees where last_name ='King'; --characters neeed to be delimited using single quote. numbers dont need quotes

-- find employees who were hired in the year 2007
select * from employees where hire_date between '1-01-2007' and '12-31-2007';-- it includes both the specified values from both ends of the filter

-- find employees who were hired any time on or after january 1st, 2008
select * from employees where hire_date >= '01-01-2008';  --use of numeric operators (><=) against character based data ('brian','2007-10-01')



-- 10 -> duplicate rows
-- output of same value multiple times is okay but seeing the same value over and over resulting in confussion

--removing duplicate values from results by using DISTINCT keyword
select distinct department_id from employees order by department_id;



-- 11 -> Displaying table structure
-- view design of table using the DESCRIBE keyword to ascertain the properties of a table and populate the selct statement
-- used for where cluase particularly in respect to the comparison operators (numeric vs character based comparision)
-- function
describe employees;



-- 12 -> EXERCIVE: retriving data using SQL statement

--Describe and use the basic SELECT statement
describe jobs;
select hire_date from employees;
select * from jobs;

-- apply standard order of precedence in SQL arithmetic expresssions
select 'old salary '|| min_salary , Min_salary + 20 * 12 AS "salary increment" from jobs;
select 'old salary '|| min_salary , (Min_salary + 20 ) * 12 AS "New Annual Salary" from jobs;

-- use literal character string in a select statement
-- to concatinate and use alias in the select statement
select 'Employee: ' || LAST_NAME || ',' || FIRST_NAME || ' -> POSITION :'|| JOB_ID AS "Employee Details" from employees;

--descibe when to use the where clause
-- filter out data that is not needed
select * from employees where hire_date >= '1/1/2000' order by employee_id;

-- eliminate duplicate rows drom sql statement output using the distinct qualifier
select distinct manager_id from employees;






















