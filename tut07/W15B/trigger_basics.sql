
-- create trigger function to define what to do when called
create function trigger_function()
	return trigger
as $$
begin
	-- trigger logic
end;
$$
language plpgsql

-- bind a database event to call a trigger function
create trigger trigger_name
	{before | after} {insert | delete | update | truncate}
	on table_name
	-- for each row - trigger function called for each modified row
	-- for each statement - trigger function called only once regardless of number of rows modified
	for each {row | statement}
	execute procedure trigger_function();