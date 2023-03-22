-- task 0.
SELECT * FROM employees;
-- task 1.
-- True (group function operate on sets of rows to give one result per group)
-- task 2.
-- False (group function ignore NULL values)
-- task 3.
-- False (WHERE can not restrict groups)
-- task 4.
SELECT MAX(salary) AS "Maximum", MIN(salary) AS "Minimum", SUM(salary) AS "Sum", ROUND(AVG(salary),0) AS "Average" FROM employees;
-- task 5.
SELECT job_id, MAX(salary) AS "Maximum", MIN(salary) AS "Minimum", SUM(salary) AS "Sum", ROUND(AVG(salary),0) AS "Average" FROM employees GROUP BY job_id ORDER BY "Average" DESC;
-- task 6.
SELECT job_id, COUNT(*) FROM employees GROUP BY job_id;
-- task 7.
SELECT COUNT(DISTINCT manager_id) FROM employees;
-- task 8.
SELECT MAX(salary)-MIN(salary) AS "DIFFERENCE" FROM employees;
-- task 9.
SELECT manager_id, MIN(salary) FROM employees GROUP BY manager_id HAVING manager_id IS NOT NULL AND MIN(salary)>6000 ORDER BY 2 DESC;
-- task 10.
SELECT
COUNT(employee_id) AS "TOTAL",
COUNT(CASE SUBSTR(hire_date,8,2) WHEN '03' THEN 1 END) AS "2003",
COUNT(CASE SUBSTR(hire_date,8,2) WHEN '04' THEN 1 END) AS "2004",
COUNT(CASE SUBSTR(hire_date,8,2) WHEN '05' THEN 1 END) AS "2005",
COUNT(CASE SUBSTR(hire_date,8,2) WHEN '06' THEN 1 END) AS "2006"
FROM employees;
-- task 11.
SELECT
job_id,
SUM(CASE department_id WHEN 20 THEN salary END) AS "20",
SUM(CASE department_id WHEN 50 THEN salary END) AS "50",
SUM(CASE department_id WHEN 80 THEN salary END) AS "80",
SUM(CASE department_id WHEN 90 THEN salary END) AS "90",
SUM(CASE WHEN department_id IN (20, 50, 80, 90) THEN salary END) AS "Total"
FROM employees
GROUP BY job_id;
-- end of tasks