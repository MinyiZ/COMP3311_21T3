
create function emp_stamp() returns trigger
as $$
begin
	-- check that name and salary are not null
	if (new.salary is null or new.empname is null) then
		raise exception 'Name and salary cannot be null';
	end if;

	-- check that salary is positive
	if (new.salary <= 0) then
		raise exception 'Salary must be positive';
	end if;

	-- stamp the tuple
	new.last_date := now();
	new.last_usr := user();

	return new;
end;
$$ language plpgsql;

create trigger emp_stamp_trigger
before insert or update
on Emp
for each row
execute procedure emp_stamp();