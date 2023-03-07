#Tasks
#Upload the sql script to create the employees database.
#DONE
USE employees_mod;

#Create a procedure that will provide the average salary of all employees.
DROP PROCEDURE IF EXISTS employees_mod.get_employees_avg_salary;
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
CREATE PROCEDURE get_employees_avg_salary()
BEGIN
Select avg(salary)
from t_salaries ts;
END
$$ DELIMITER ;
SET GLOBAL log_bin_trust_function_creators = 0;
CALL get_employees_avg_salary();

#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
DROP PROCEDURE IF EXISTS employees_mod.emp_info;
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
CREATE PROCEDURE emp_info(first_name VARCHAR(50), last_name VARCHAR(50))
BEGIN
Select t_employees.emp_no
FROM t_employees
WHERE t_employees.first_name=first_name
AND t_employees.last_name=last_name;
END
$$ DELIMITER ;
SET GLOBAL log_bin_trust_function_creators = 0;


#Call the procedures
CALL emp_info("Mary","Sluis");


#Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee. Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.
DROP FUNCTION IF EXISTS emp_info;
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE FUNCTION emp_info(first_name VARCHAR(50), last_name VARCHAR(50))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE v_max_from_date DATE;
    DECLARE v_salary DECIMAL (10,2);
    
    SELECT max(from_date) INTO v_max_from_date
    FROM t_salaries ts
    INNER JOIN t_employees te
    ON te.emp_no = ts.emp_no
    WHERE te.first_name=first_name
    AND te.last_name=last_name;
    
	
    SELECT salary INTO v_salary
    FROM t_salaries ts
    INNER JOIN t_employees te
    ON te.emp_no = ts.emp_no
    WHERE te.first_name=first_name
    AND te.last_name=last_name
    AND ts.from_date=v_max_from_date;
    RETURN v_salary;
END
$$
DELIMITER ;

SET GLOBAL log_bin_trust_function_creators = 0;

SELECT emp_info("Mary","Sluis");

#Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)

DELIMITER $$
CREATE TRIGGER correct_hire_date
BEFORE UPDATE ON t_employees 
FOR EACH ROW
BEGIN
    IF NEW.hire_date > NOW() THEN
        SET NEW.hire_date = DATE_FORMAT(NOW(), '%y-%m-%d');
    END IF;
END
$$ DELIMITER ;

###  will trigger the previous trigger
UPDATE t_employees SET hire_date = "2024-10-12" WHERE emp_no="10008";

#Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index.
CREATE INDEX i_hire_date ON employees_mod.t_employees (hire_date);
DROP INDEX i_hire_date ON employees_mod.t_employees;

#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum. Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
SELECT * FROM t_salaries
WHERE t_salaries.salary > 89000;

CREATE INDEX i_salary ON t_salaries (salary);
SELECT * FROM t_salaries
WHERE salary > 89000;
#Yes it did improve performance. 0.0064 seconds vs 0.020 seconds

#Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee.
SELECT ts.emp_no, te.first_name, te.last_name,
  CASE
    WHEN ts.emp_no > 109990 THEN 'Yes'
    ELSE 'No'
  END AS num_over_109990,
  CASE
    WHEN dm.emp_no IS NOT NULL THEN 'Manager'
    ELSE 'Regular Employee'
  END AS employee_type
FROM t_salaries ts
JOIN t_employees te ON ts.emp_no = te.emp_no
LEFT JOIN t_dept_manager dm ON ts.emp_no = dm.emp_no
WHERE ts.emp_no > 109990;


#Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
DROP VIEW IF EXISTS manager_info;
CREATE VIEW manager_info AS SELECT tdm.emp_no, te.first_name, te.last_name, MAX(ts.salary) - MIN(ts.salary) AS salary_difference
FROM t_dept_manager tdm
JOIN t_employees te
ON tdm.emp_no=te.emp_no
JOIN t_salaries ts
ON te.emp_no=ts.emp_no
GROUP BY tdm.emp_no;
SELECT * FROM manager_info;


#Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t. Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.
