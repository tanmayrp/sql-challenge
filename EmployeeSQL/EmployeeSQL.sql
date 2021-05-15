-- Data Analysis
-- Once you have a complete database, do the following:

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", e.sex As "Sex", s.salary AS "Salary"
FROM employees e
	INNER JOIN salaries s ON e.emp_no = s.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees e
WHERE hire_date >= '1/1/1986'
	AND hire_date <= '12/31/1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no AS "Department Number", d.dept_name AS "Department Name", e.emp_no AS "Managers Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name"
FROM employees e
	INNER JOIN dept_manager m ON e.emp_no = m.emp_no
	INNER JOIN departments d ON m.dept_no = d.dept_no;
	
	
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e
	INNER JOIN dept_employees de ON de.emp_no = e.emp_no
	INNER JOIN departments d ON d.dept_no = de.dept_no;
	
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name AS "First Name", e.last_name AS "Last Name", e.sex AS "Sex"
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e
	INNER JOIN dept_employees de ON de.emp_no = e.emp_no
	INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM employees e
	INNER JOIN dept_employees de ON de.emp_no = e.emp_no
	INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, count(*)
FROM employees e
GROUP BY e.last_name

