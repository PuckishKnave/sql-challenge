-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e LEFT JOIN salaries AS s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
INNER JOIN departments AS d
	ON dm.dept_no=d.dept_no
LEFT JOIN employees AS e
	ON dm.emp_no=e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no
WHERE d.dept_name in ('Sales','Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;