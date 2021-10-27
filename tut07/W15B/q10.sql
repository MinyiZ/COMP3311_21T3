
-- trigger to increment numStudents if new enrolment
create function insert_check returns trigger
as $$
begin
	update course set numStudes=numStudes+1 where code=new.course;
	return null;
end;
$$ language plpgsql;

create trigger insert_check_trigger
	after insert
	on enrolment
	execute procedure insert_check();

-- trigger to decrement numStudents if delete enrolment
create function delete_check returns trigger
as $$
begin
	update course set numStudes=numStudes-1 where code=old.course;
	return null;
end;
$$ language plpgsql;

create trigger delete_check_trigger
	after delete
	on enrolment
	execute procedure delete_check();

-- trigger to increment/decrement if update enrolment
create function update_check returns trigger
as $$
begin
	update course set numStudes=numStudes+1 where code=new.course;
	update course set numStudes=numStudes-1 where code=old.course;
	return null;
end;
$$ language plpgsql;

create trigger update_check_trigger
	after update
	on enrolment
	execute procedure update_check();

-- trigger to check quota is not exceededcreate function insert_check returns trigger
create function quota_check returns trigger
as $$
declare
	quota_full boolean;
begin
	select into quota_full
	(numStudes >= quota)
	from Course where code = new.course;

	if (quota_full) then
		raise exception 'Course is full';
	end if;
end;
$$ language plpgsql;

create trigger quota_check_trigger
	before insert
	on enrolment
	execute procedure quota_check();