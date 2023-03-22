-- task 0.
SELECT * FROM departments;
--
-- task 1.
--
DEFINE type_the_name='&input';
SELECT e.last_name, e.hire_date, e.department_id
FROM employees e
WHERE e.department_id IN
(SELECT department_id
FROM employees
WHERE last_name=INITCAP('&type_the_name'))
AND e.last_name <> INITCAP('&type_the_name');
UNDEFINE type_the_name;
--
-- task 2.
SELECT
e.employee_id, e.last_name, e.salary
FROM employees e
WHERE e.salary >
(SELECT AVG(salary)
FROM employees)
ORDER BY salary ASC
;
--
-- task 3.
SELECT e.employee_id, e.last_name
FROM employees e
WHERE department_id IN
(SELECT department_id
FROM employees
WHERE last_name LIKE '%u%')
;
--
-- task 4.
SELECT e.last_name, e.department_id, e.job_id, d.location_id
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id=&type_loc_id_1400_1700
ORDER BY d.department_id
;
--
-- task 5.
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id IN
(SELECT manager_id
FROM employees
WHERE last_name='King')
AND last_name <> 'King'
;
--
-- task 6.
SELECT e.department_id, e.last_name, e.job_id
FROM employees e
WHERE e.department_id = (
SELECT d.department_id
FROM departments d
WHERE d.department_name='Executive')
;
--
-- task 7.
SELECT e.employee_id, e.last_name, e.salary
FROM employees e
WHERE department_id IN
(SELECT department_id
FROM employees
WHERE last_name LIKE '%u%')
AND e.salary>
(SELECT AVG(salary)
FROM employees)
;
--