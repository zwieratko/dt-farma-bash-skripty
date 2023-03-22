-- task 1.
SELECT sysdate AS "Date" FROM DUAL;
-- task 2.
SELECT employee_id, last_name, salary, ROUND(salary*1.155, 0) AS "New Salary" FROM employees ORDER BY 1;
-- task 3.
-- ??
-- task 4.
SELECT employee_id, last_name, salary, ROUND(salary*1.155, 0) AS "New Salary", ROUND(salary*1.155, 0)- salary AS "Increase" FROM employees ORDER BY 1;
-- task 5a.
SELECT last_name AS "Name", LENGTH(last_name) AS "Length" FROM employees WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%' ORDER BY 1;
-- task 5b.
SELECT last_name AS "Name", LENGTH(last_name) AS "Length" FROM employees WHERE last_name LIKE '&type_letter%' ORDER BY 1;
-- task 5c.
SELECT last_name AS "Name", LENGTH(last_name) AS "Length" FROM employees WHERE last_name LIKE UPPER('&type_letter%') ORDER BY 1;
-- task 6.
SELECT last_name, ROUND((SYSDATE-hire_date)/12,0) AS "MONTHS_WORKED" FROM employees ORDER BY 2;
-- task 7.
SELECT last_name, LPAD(salary,15,'$') FROM employees ORDER BY 2 DESC;
-- task 8.
SELECT SUBSTR(last_name,1,8) || RPAD(' ', ROUND(salary/1000,0), '*') AS "EMPLOYEES_AND_THEIR_SALARIES" FROM employees ORDER BY salary DESC;
-- task 9.
SELECT last_name, TRUNC((SYSDATE-hire_date)/7,0) AS TENURE FROM employees ORDER BY 2 DESC;
-- end of task