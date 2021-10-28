-- create trigger function to define what happens when its called
create function trigger_function()
	return trigger
as $$
begin
	-- trigger logic
end;
$$
language plpgsql

-- binds a database event to call a trigger function
create trigger trigger_name
{before | after} {insert | delete | update}
on table_name
-- for each row - trigger function called for each modified row
-- for each statement - trigger function called once
for each {row | statement}
execute procedure trigger_function();