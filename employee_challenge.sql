CREATE TABLE Department (
    "DepartmentID" VARCHAR(5)   NOT NULL,
    "Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        "DepartmentID"
     )
);

CREATE TABLE Employee_Department (
    "EmployeeID" INT   NOT NULL,
    "DepartmentID" VARCHAR(5)   NOT NULL,
    "From" date   NOT NULL,
    "To" date   NOT NULL
);

CREATE TABLE Department_Manager (
    "DepartmentID" VARCHAR(5)   NOT NULL,
    "EmployeeID" INT   NOT NULL,
    "From" date   NOT NULL,
    "To" date   NOT NULL
);

CREATE TABLE Employee (
    "EmployeeID" INT   NOT NULL,
    "BirthDate" VARCHAR(20)   NOT NULL,
    "FirstName" VARCHAR(20)   NOT NULL,
    "LastName" VARCHAR(20)   NOT NULL,
    "Gender" VARCHAR(20)   NOT NULL,
    "Start" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE Salaries (
    "EmployeeID" INT   NOT NULL,
    "Salary" int   NOT NULL,
    "From" date   NOT NULL,
    "To" date   NOT NULL
);

CREATE TABLE Titles (
    "EmployeeID" INT   NOT NULL,
    "Title" VARCHAR(20)   NOT NULL,
    "From" date   NOT NULL,
    "To" date   NOT NULL
);

/*List the following details of each employee: employee number, last name, first name, gender, and salary.*/
SELECT *
FROM employee
INNER JOIN salaries ON employee.employee_id = salaries.employee_id;

/*List employees who were hired in 1986.*/
SELECT * FROM employee 
WHERE start_date BETWEEN '1985-12-31' AND '1987-01-01'

/*List the manager of each department with the following information: department number, department name,
the manager's employee number, last name, first name, and start and end employment dates.*/
SELECT d.employee_id, d.department_id, d.from, d.to, e.first, e.last, dep.name
FROM department_manager as d 
INNER JOIN employee as e 
  ON d.employee_id = e.employee_id
INNER JOIN department as dep 
  ON d.department_id = dep.department_id;
  
/*List the department of each employee with the following information: employee number, last name, first name, and department name.*/

SELECT e.employee_id,e.first, e.last,  dep.department_id, dep.name
FROM employee as e 
INNER JOIN employee_department as emp 
  ON e.employee_id = emp.employee_id
INNER JOIN department as dep 
  ON emp.department_id = dep.department_id;  
  
/*List all employees whose first name is "Hercules" and last names begin with "B."*/

SELECT * FROM employee
WHERE 
	first = 'Hercules'
	AND LEFT(last, 1)= 'B';
  
/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/

SELECT e.employee_id,e.first, e.last, dep.name
FROM employee AS e 
INNER JOIN employee_department AS emp 
  ON e.employee_id = emp.employee_id
INNER JOIN department AS dep 
  ON emp.department_id = dep.department_id
WHERE name = 'Sales';

/*List all employees in the Sales and Development departments, including their employee number, last name, first name
, and department name.*/

SELECT e.employee_id,e.first, e.last, dep.name
FROM employee AS e 
INNER JOIN employee_department AS emp 
  ON e.employee_id = emp.employee_id
INNER JOIN department AS dep 
  ON emp.department_id = dep.department_id
WHERE name = 'Sales'
	   OR name = 'Development';

/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
SELECT last, COUNT(employee_id) AS "Employees same last name"
FROM employee
GROUP BY last
ORDER BY "Employees same last name" DESC;