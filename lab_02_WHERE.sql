-- task 0.
SELECT * FROM employees;
-- task 1.
SELECT last_name, salary FROM employees WHERE salary>12000 ORDER BY salary DESC;
-- task 2.
SELECT last_name, department_id FROM employees WHERE employee_id=176;
-- task 3.
SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000;
-- task 3.
SELECT last_name, salary FROM employees WHERE salary<5000 OR salary>12000;
-- task 4.
SELECT last_name, job_id, hire_date FROM employees WHERE last_name IN ('Matos', 'Taylor') ORDER BY 3;
-- task 5.
SELECT last_name, department_id FROM employees WHERE department_id IN (20, 50) ORDER BY 1;
-- task 6.
SELECT last_name AS "Employee", salary AS "Monthly Salaray" FROM employees WHERE (salary BETWEEN 5000 AND 12000) AND (department_id IN (20, 50));
-- task 7.
SELECT last_name, hire_date FROM employees WHERE hire_date LIKE '%04';
-- task 8.
SELECT last_name, job_id FROM employees WHERE job_id NOT LIKE '%MAN';
-- task 9.
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary DESC, commission_pct DESC;
-- task 9.
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct IS NOT NULL ORDER BY 2 DESC, 3 DESC;
-- task 10.
SELECT last_name, salary FROM employees WHERE salary>&type_min_salary ORDER BY 2 DESC;
-- task 11.
SELECT employee_id, last_name, salary, department_id FROM employees WHERE manager_id=&type_man_id ORDER BY &type_order_by;
-- task 12.
SELECT last_name FROM employees WHERE last_name LIKE '__a%';
-- task 13.
SELECT last_name FROM employees WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';
-- task 14.
SELECT last_name, job_id, salary FROM employees WHERE (job_id IN ('SA_REP', 'ST_CLERK')) AND (salary NOT IN (2500, 3500, 7000));
-- task 15.
SELECT last_name AS "Employee", salary AS "Monthly Salary", commission_pct FROM employees WHERE commission_pct=0.2;
-- end of tasks