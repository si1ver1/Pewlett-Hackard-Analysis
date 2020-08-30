# Pewlett-Hackard-Analysis

## Overview of Project
The goal of this assignment is to analyze the number of employees who are retiring, analyze the employees available for the mentorship program and use the data to help prepare for a "silver tsunami" or big increase in retirements.

### Results of Pewlett-Hackard-Analysis
Below we can see a list of the number of employees and their titles both for the entire company and then for those who are retiring:

All Titles       |  Retiring Titles
:-------------------------:|:-------------------------:
![all_titles](https://raw.githubusercontent.com/si1ver1/Pewlett-Hackard-Analysis/master/data/all_titles.jpg) | ![retiring_titles](https://raw.githubusercontent.com/si1ver1/Pewlett-Hackard-Analysis/master/data/retiring_titles.jpg)

Based on these we see that there are:
- 443,308 employees total, 90,398 retiring, 1,549 available for mentorship program
- Most of the retirees hold senior positions
- Overall there are very few managers and very few of them are retiring
- The number of availability for mentorship program seems small

### Summary
- The company will need to fill 90,398 roles
- There are 90,398 retirees (or roles to fill) and 1,549 employees  who can mentor which means each mentor would need to teach 58 other employees (90398/1549).

Looking a little further into the "silver tsunami" we can determine which department is most affected. We can adjust our initial retirement collection code to add in the department names into our list of retirees and save it into a new table called retiring_departments

```SQL
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, t.title, dep.dept_name
into retiring_departments 
from employees e
inner join title t on e.emp_no = t.emp_no
inner join dept_emp d on e.emp_no = d.emp_no
inner join departments dep on d.dept_no = dep.dept_no
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no
```
Use the retiring_departments table to get the count of employees retiring from each department

```SQL
select count(dept_name), dept_name
from retiring_departments
group by dept_name
order by count desc
```

Using the above queries we can see which deparment will have the largest impact from retirements:
![retiring_departments](https://raw.githubusercontent.com/si1ver1/Pewlett-Hackard-Analysis/master/data/retiring_departments.jpg)