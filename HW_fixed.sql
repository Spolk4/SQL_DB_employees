-- SELECT * FROM departments;
-- SELECT * FROM dept_emp;
-- SELECT * FROM dept_manager;
-- SELECT * FROM employees;
-- SELECT * FROM salaries;
-- SELECT * FROM titles;

--1. list the following details of each employee: 
--employee number, last name, first name, gender and salary

SELECT e.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name",
	e.gender AS "Gender", 
	s.salary AS "Salary"
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

--2. List all the employees who were hired in 1986.
SELECT e.hire_date AS "Hire Date",
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name"
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE e.hire_date BETWEEN '1986/01/01' AND '1986/12/31'
ORDER BY e.hire_date ASC;

--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT dm.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	dm.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name",
	dm.from_date AS "Start Date",
	dm.to_date AS "End Date"
	
FROM dept_manager AS dm
JOIN departments AS d
ON dm.dept_no = d.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no;

--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name", 
	e.first_name AS "First Name",
	d.dept_name AS "Dept Name"

FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999/01/01'
ORDER BY e. emp_no ASC;

--5. List all employees whose first name
--is Hurculese and last name begins with 'B'.
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, 
--and department name. 
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales');

--7 list all the employees in the Sales and the Development departments,
--including their employee number, last name, first name, and department 
--name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--8 In descending order, list the frequency count of employee last names;
--how many employees share each last name.

SELECT last_name, 
COUNT(last_name) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count";
