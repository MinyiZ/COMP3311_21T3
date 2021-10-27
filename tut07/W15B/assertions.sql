-- Q1

create assertion manager_works_in_department
check not exists
(
	select *
	from Employees e
	join departments d on (d.manager = e.id)
	where e.works_in <> d.id
);

-- Q2

create assertion employee_manager_salary
check not exists
(
	select *
	from Employee emp
		 join Department dept on (dept.id = emp.works_in)
		 join Employee mgr on (dept.manager = mgr.id)
	where emp.salary > mgr.salary
);