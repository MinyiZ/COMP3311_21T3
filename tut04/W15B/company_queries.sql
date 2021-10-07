-- Q2

-- update Employees
-- set salary = salary * 0.8
-- where age < 25;

-- Q3

update Employees
set salary = salary * 1.1
where eid in
	(
		select wi.eid
		from worksin wi
		join departments d on (d.did = wi.did)
		where d.dname = 'Sales'
	);