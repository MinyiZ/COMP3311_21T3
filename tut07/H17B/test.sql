create or replace function quota_check() returns trigger
as $$
begin
	raise notice 'Triggered yay';
	return null;
end;
$$ language plpgsql;

create trigger quota_check_trigger
before insert
on S
execute procedure quota_check();