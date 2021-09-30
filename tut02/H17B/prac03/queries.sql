-- Which employee works the longest hours each week?
select * from employees
where hourspweek =
	(select max(hourspweek) from employees);

-- What is the family name of the manager of the Sales department?
select familyname from departments d
join employees e on (d.manager = e.tfn)
where d.name = 'Sales';

-- How many hours per week does each employee spend in each department?
select e.tfn as employee, d.name as department, (e.hourspweek * wf.percentage / 100) as hours from worksfor wf
join departments d on (d.id = wf.department)
join employees e on (e.tfn = wf.employee);