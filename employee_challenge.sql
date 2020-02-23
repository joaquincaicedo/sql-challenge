/*List the following details of each employee: employee number, last name, first name, gender, and salary.*/
select employee.emp_no, employee.first_name, employee.last_name, employee.gender, salary.salary
from employee_data as employee 
INNER JOIN salaries as salary ON
from employee_data as employee.emp_no = salary.emp_no;

/*List employees who were hired in 1986.*/
select * from employee_data 
WHERE LEFT(hire_date, 4) = '1986';

/*List the manager of each department with the following information: department number, department name,
the manager's employee number, last name, first name, and start and end employment dates.*/

select department.emp_no, department.dept_no, department.from_date, department.to_date, employee.first_name, employee.last_name, depa.dept_name
from dep_manager as department 
INNER JOIN employee_data as employee 
  ON d.emp_no = employee.emp_no
INNER JOIN departments as depa 
  ON department.dept_no = depa.dept_no;
  
/*List the department of each employee with the following information: employee number, last name, first name, and department name.*/

select employee.emp_no,employee.first_name, employee.last_name,  depa.dept_no, depa.dept_name
from employee_data as employee 
INNER JOIN employees as emp 
  ON e.emp_no = emp.emp_no
INNER JOIN departments as depa
  ON emp.dept_no = dep.dept_no;
  
/*List all employees whose first name is "Hercules" and last names begin with "B."*/

select * from employee_data
WHERE 
	first_name= 'Hercules'
	AND LEFT(last_name, 1)= 'B';
	
/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/

select e.emp_no,e.first_name, e.last_name, dep.dept_name
from employee_data as e 
INNER JOIN employees as emp 
  ON e.emp_no = emp.emp_no
INNER JOIN departments as dep 
  ON emp.dept_no = dep.dept_no
WHERE dept_name = 'Sales';

/*List all employees in the Sales and Development departments, including their employee number, last name, first name
, and department name.*/

select employee.emp_no,employee.first_name, employee.last_name, depa.dept_name
from employee_data as employee 
INNER JOIN employees as emp 
  ON e.emp_no = emp.emp_no
INNER JOIN departments as dep 
  ON emp.dept_no = dep.dept_no
WHERE dept_name = 'Sales'
	   OR dept_name = 'Development';
	   
/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
select last_name, COUNT(emp_no) as "Employees same last name"
FROM employee_data
GROUP BY last_name
ORDER BY "Employees same last name" DESC;


