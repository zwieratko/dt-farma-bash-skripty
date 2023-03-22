-- task 0.
SELECT * FROM employees;
-- task 1.
SELECT
l.location_id, l.street_address, l.city, l.state_province,
c.country_name
FROM locations l JOIN countries c
ON l.country_id = c.country_id;
---
-- task 2.
SELECT
e.last_name, e.department_id,
d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;
---
-- task 3.
SELECT
e.last_name, e.job_id, e.department_id,
d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE l.city='Toronto';
---
-- task 4.
SELECT
e.last_name AS "Employee", e.employee_id AS "EMP#",
m.last_name AS "Manager", e.manager_id AS "Mgr#"
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;
---
-- task 5.
SELECT
e.last_name AS "Employee", e.employee_id AS "EMP#",
m.last_name AS "Manager", e.manager_id AS "Mgr#"
FROM employees e LEFT OUTER JOIN employees m
ON e.manager_id = m.employee_id
ORDER BY e.employee_id;
---
-- task 6.
SELECT
e.department_id, e.last_name,
c.last_name
FROM employees e JOIN employees c
ON e.department_id = c.department_id
WHERE e.last_name <> c.last_name;
---
-- task 7.
-- no way, we have no tables JOB_GRADES
---
-- task 8.
SELECT
e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date> ALL
(SELECT hire_date
FROM employees
WHERE last_name='Grant')
;
-- task 9.
SELECT
e.last_name, e.hire_date, m.last_name, m.hire_date
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;
---