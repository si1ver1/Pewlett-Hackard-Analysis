-- Deliverable 1
select e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
into retirement_title
from employees e
inner join title t on e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
from retirement_title
order by emp_no asc, to_date desc;

-- Count by title
select count(title), title
into retiring_titles
from unique_titles
group by title
order by count desc


-- Deliverable 2
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
into mentorship_eligibilty
from employees e
inner join dept_emp d on e.emp_no = d.emp_no
inner join title t on e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and (d.to_date = '9999-01-01')
order by emp_no