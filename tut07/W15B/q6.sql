
-- a

create function r_pk_check() return trigger
as $$
begin
	-- check a and b are not null
	if (new.a is null or new.b is null) then
		raise exception 'Primary key cannot be null';
	end if;

	if (TG_OP = 'update' and old.a = new.a and old.b = new.b) then
		return new;
	end if;

	-- check not duplicate primary key
	select * from R where a=new.a and b=new.b;
	if (found) then
		raise exception 'Duplicate primary key found';
	end if;
end;
$$ language plpgsql

create trigger r_pl_check_trigger()
	before insert or update
	on R
	for each row
	execute procedure r_pk_check();

-- b

create function t_fk_check() return trigger
as $$
begin
	select * from S where x = new.k;
	if (not found) then
		raise exception 'Non-existent reference primary key in S'
	end if;
end;
$$ language plpgsql

create trigger t_fk_check_trigger()
	before insert or update
	on T
	for each row
	execute procedure t_fk_check();

create function t_fk_check_delete() return trigger
as $$
begin
	select * from T where k=old.x

	if (found) then
		raise exception 'References exist in T'
	end if; 
end;
$$ language plpgsql

create trigger t_fk_check_delete_trigger()
	before delete
	on T
	for each row
	execute procedure t_fk_check_delete();