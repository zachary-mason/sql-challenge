-- 1) joining employees and salaries tables
-- emp no, last name, first name, sex, salary
SELECT Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Employees.sex,
	Salaries.salary
FROM 
	Employees
JOIN
	Salaries ON Employees.emp_no = Salaries.emp_no;

-- 2) first name, last name, and hire date for the employees who were hired in 1986.
SELECT Employees.first_name,
	Employees.last_name,
	Employees.hire_date
FROM
	Employees
WHERE
	EXTRACT(YEAR FROM Employees.hire_date) = 1986;

-- 3) List manager of each dept with their dept number, dept name, employee number, last name, and first name
SELECT Departments.dept_no,
	Departments.dept_name,
	Dept_Manager.emp_no,
	Employees.last_name,
	Employees.first_name
FROM 
    Departments
JOIN 
    Dept_Manager ON Departments.dept_no = Dept_Manager.dept_no
JOIN 
    Employees ON Dept_Manager.emp_no = Employees.emp_no;

-- 4) List dept number for each employee along with that employee’s number, last name, first name, and department name.
SELECT Departments.dept_no,
	Employees.emp_no,
	Employees.last_Name,
	Employees.first_name,
	Departments.dept_name
FROM
	Employees
JOIN
	Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
JOIN
	Departments ON Dept_Emp.dept_no = Departments.dept_no;

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
	last_name,
	sex
From
	Employees
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6) List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name
FROM
	Employees
JOIN
	Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
JOIN
	Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE
	Departments.dept_name = 'Sales';

-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM
	Employees
JOIN
	Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
JOIN
	Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE
	Departments.dept_name in ('Sales', 'Development');

-- 8)List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	Employees.last_name, COUNT(Employees.last_name) AS "Name Count"
FROM
	Employees
GROUP BY
	Employees.last_name
ORDER BY "Name Count" DESC;