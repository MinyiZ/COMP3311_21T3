-- Q2 

update Employees
set salary = 0.8 * salary
where age < 25;

-- update through view example
create or replace view young_employees(eid, salary)
as
	select eid, salary
	from employees
	where age < 25
;

update young_employees
set salary = 0.8 * salary;


-- Q3

create or replace view sales_eids(eid)
as
	select wi.eid
	from departments d
	join worksin wi on (d.did = wi.did)
	where d.dname = 'Sales'
;

update Employees
set salary = 1.1 * salary
where eid in (select eid from sales_eids);
