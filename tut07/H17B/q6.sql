-- a
create function r_pk_check() returns trigger
as $$
begin
	-- not null
	if (new.a is null or new.b is null) then
		raise exception 'Primary key cannot be null';
	end if;

	if (TG_OP = 'update' and old.a = new.a and old.b = new.b) then
		return new;
	end if;

	-- is unique
	select * from R
	where a = new.a and b=new.b;

	if (found) then
		raise exception 'Duplicate primary key found';
	end if; 

	return new;
end;
$$ language plpgsql;

create trigger r_pk_check_trigger
before insert or update
on R
for each row
execute procedure r_pk_check();

-- b
create function t_fk_check() returns trigger
as $$
begin
	-- check that the referenced tuple exists in S
	select * from S
	where x = new.k;

	if (not found) then
		raise exception 'Non-existent reference to primary key in S';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger t_fk_check_trigger
before insert or update
on T
for each row
execute procedure t_fk_check();

create function s_ref_check() returns trigger
as $$
begin
	if (TG_OP = 'update' and old.x = new.x) then
		return new;
	end if;

	select * from T
	where k=old.x

	if (found) then
		raise exception 'References exist in T';
	end if;
end;
$$ language plpgsql;

create trigger s_ref_check_trigger
before update or delete
on S
for each row
execute procedure s_ref_check();