
create function emp_stamp() return trigger
as $$
begin
	-- check name and salary is given
	if (new.empname is null or new.salary is null) then
		raise exception 'Name and salary cannot be null';
	end if;

	-- check that salary is positive
	if (new.salary <= 0) then 
		raise exception 'Salary must be positive';
	end if;

	-- timestamp the tuple
	new.last_date := now();
	new.last_usr := user();

	return new;
end
$$ language plpgsql

create trigger emp_stamp_trigger
	before insert or update
	on Emp
	for each row
	execute procedure emp_stamp();