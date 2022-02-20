
-----------------------------------------------------------------------------------
-- Deliverable 1: The Number of Retiring Employees by Title
-----------------------------------------------------------------------------------

-- 1. Create retirement_titles tables
select e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
into retirement_titles
from employees as e
join titles as t on e.emp_no = t.emp_no
where e.birth_date between '1952-01-01' and '1955-12-31'
order by e.emp_no asc;

-- 2. Double check table to match screenshot
select * 
from retirement_titles;

-- 3. Export retirement_titles table to csv

-- 4. Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_retirement_title
FROM retirement_titles 
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Check unique_retirement_titles to match screenshot
select *
from unique_retirement_title

-- 5. Export unique_retirement_titles to csv

-- 6. Get the number of each retiring titles. Count the number of titles 
select count(*), title
into retiring_titles
from unique_retirement_title 
group by title

-- 7. Check retiring titles to match screenshot
select * 
from retiring_titles
order by count desc

-- 8. Export retiring titles to csv

-----------------------------------------------------------------------------------
-- Deliverable 2: The Employees Eligible for the Mentorship Program
-----------------------------------------------------------------------------------


SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date,de.to_date, ti.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN titles as ti ON e.emp_no = ti.emp_no
WHERE de.to_date = '9999-01-01' 
AND e.birth_date BETWEEN '1965-01-01'AND '1965-12-31'
ORDER BY e.emp_no;


-- check mentorship_eligibility to match screen shot 
select *
from mentorship_eligibility

-- export mentorship_eligibility to csv