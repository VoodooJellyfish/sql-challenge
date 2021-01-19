/* 
Question 1
*/
SELECT employees.first_name, employees.last_name, employees.sex, employees.emp_no, salaries.salary
FROM   employees
JOIN   salaries ON employees.emp_no = salaries.emp_no;

--Question 2
Select employees.first_name, employees.last_name, employees.hire_date
from employees
WHERE to_date(hire_date, 'mm/dd/yyyy') >= '01/01/1986' AND to_date(hire_date, 'mm/dd/yyyy') < '12/31/1986';

--Question 3
select employees.first_name, employees.last_name, employees.emp_no, dept_manager.dept_no, departments.dept_name
from employees 
inner join dept_manager on employees.emp_no = dept_manager.emp_no inner join departments on dept_manager.dept_no = departments.dept_no

--Question 4
select employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
from employees 
inner join dept_emp on employees.emp_no = dept_emp.emp_no inner join departments on dept_emp.dept_no = departments.dept_no

--Question 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name = 'Hercules' and employees.last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no inner join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.dept_no = 'd007'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no inner join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.dept_no = 'd007' or dept_emp.dept_no = 'd005'

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc