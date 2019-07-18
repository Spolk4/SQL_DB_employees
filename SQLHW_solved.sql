<<<<<<< HEAD
--Inspect the CSVs and sketch out an ERD of the tables. Feel free to use a tool like http://www.quickdatabasediagrams.com.

--Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
--Import each CSV file into the corresponding SQL table.

--Once you have a complete database, do the following:

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
--2. List employees who were hired in 1986.
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--5. List all employees whose first name is "Hercules" and last names begin with "B."
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--Bonus (Optional)
	--As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:
	--Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:

   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   
	--Consult SQLAlchemy documentation for more information.
	--If using a password, do not upload your password to your GitHub repository. See https://www.youtube.com/watch?v=2uaTPmNvH0I and https://martin-thoma.com/configuration-files-in-python/ for more information.

	--Create a bar chart of average salary by title.
	--You may also include a technical report in markdown format, in which you outline the data engineering steps taken in the homework assignment.
___________________________________________________________________________________________________________________________
--DROP TABLE if it exists

CREATE TABLE employee (
	emp_no INTEGER PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR,
	hire_date DATE
);
CREATE TABLE salaries (
    emp_no INTEGER,
    salary MONEY,
    from_date DATE,
    to_date DATE
);

CREATE TABLE titles (
    emp_no INTEGER,
    title VARCHAR,
    from_date DATE,
    to_date DATE
);
--Join employee, salaries, and titles
-- Join Tables
SELECT customer.first_name, customer.last_name, email.email, phone.phone
FROM customer
JOIN customer_email AS email
  ON customer.id = email.customer_id
JOIN customer_phone AS phone
  ON customer.id = phone.customer_id;
  
 --QUERY and SUBQUERY
--1. SELECT e.emp_no, e.last_name, e.first_name, gender, s.salary
--	 FROM employee e
	 JOIN salaries s
	 ON (e.emp_no = s.emp_no)
	
	SELECT * 
	FROM employee
--2. check for hire_date then query 
	SELECT * 
	FROM employee
	WHERE hire_date IN (1986)
	
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INTEGER,
    from_date DATE,
    to_date DATE
);
--Join departments and department manager
-- Join Tables
SELECT customer.first_name, customer.last_name, email.email, phone.phone
FROM customer
JOIN customer_email AS email
  ON customer.id = email.customer_id
JOIN customer_phone AS phone
  ON customer.id = phone.customer_id;

--create Junction tables dm_x_e

CREATE TABLE student_courses_junction (
  student_id INTEGER NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id),
  course_id INTEGER NOT NULL,
  FOREIGN KEY (course_id) REFERENCES courses(id),
  course_term VARCHAR NOT NULL,
  PRIMARY KEY (student_id, course_id)
);


--import all csv files to the corresponding table
=======
--Inspect the CSVs and sketch out an ERD of the tables. Feel free to use a tool like http://www.quickdatabasediagrams.com.

--Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
--Import each CSV file into the corresponding SQL table.

--Once you have a complete database, do the following:

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
--2. List employees who were hired in 1986.
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--5. List all employees whose first name is "Hercules" and last names begin with "B."
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--Bonus (Optional)
	--As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:
	--Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:

   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   
	--Consult SQLAlchemy documentation for more information.
	--If using a password, do not upload your password to your GitHub repository. See https://www.youtube.com/watch?v=2uaTPmNvH0I and https://martin-thoma.com/configuration-files-in-python/ for more information.

	--Create a bar chart of average salary by title.
	--You may also include a technical report in markdown format, in which you outline the data engineering steps taken in the homework assignment.
___________________________________________________________________________________________________________________________
--DROP TABLE if it exists

CREATE TABLE employee (
	emp_no INTEGER PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR,
	hire_date DATE
);
CREATE TABLE salaries (
    emp_no INTEGER,
    salary MONEY,
    from_date DATE,
    to_date DATE
);

CREATE TABLE titles (
    emp_no INTEGER,
    title VARCHAR,
    from_date DATE,
    to_date DATE
);
--Join employee, salaries, and titles
-- Join Tables
SELECT customer.first_name, customer.last_name, email.email, phone.phone
FROM customer
JOIN customer_email AS email
  ON customer.id = email.customer_id
JOIN customer_phone AS phone
  ON customer.id = phone.customer_id;
  
 --QUERY and SUBQUERY
--1. SELECT e.emp_no, e.last_name, e.first_name, gender, s.salary
--	 FROM employee e
	 JOIN salaries s
	 ON (e.emp_no = s.emp_no)
	
	SELECT * 
	FROM employee
--2. check for hire_date then query 
	SELECT * 
	FROM employee
	WHERE hire_date IN (1986)
	
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INTEGER,
    from_date DATE,
    to_date DATE
);
--Join departments and department manager
-- Join Tables
SELECT customer.first_name, customer.last_name, email.email, phone.phone
FROM customer
JOIN customer_email AS email
  ON customer.id = email.customer_id
JOIN customer_phone AS phone
  ON customer.id = phone.customer_id;

--create Junction tables dm_x_e

CREATE TABLE student_courses_junction (
  student_id INTEGER NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id),
  course_id INTEGER NOT NULL,
  FOREIGN KEY (course_id) REFERENCES courses(id),
  course_term VARCHAR NOT NULL,
  PRIMARY KEY (student_id, course_id)
);


--import all csv files to the corresponding table
>>>>>>> a89af60667ee0faf6b0ec5f8f20b0aa01a2ccc1b
