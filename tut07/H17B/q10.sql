-- insert into enrolments should update course table
create function insert_student() returns trigger
as $$
	update Course
	set numStudes=numStudes+1
	where code = new.course;

	return null;
$$ language plpgsql;

create trigger insert_student_trigger
after insert
on Enrolment
execute procedure insert_student();

-- delete from enrolments should update course table
create function delete_student() returns trigger
as $$
	update Course
	set numStudes=numStudes-1
	where code = old.course;

	return null;
$$ language plpgsql;

create trigger delete_student_trigger
after delete
on Enrolment
execute procedure delete_student();

-- update to enrolments should update course table
create function update_student() returns trigger
as $$
	if (old.course = new.course) then
		return null;
	end if;

	update Course
	set numStudes=numStudes+1
	where code = new.course;

	update Course
	set numStudes=numStudes-1
	where code = old.course;

	return null;
$$ language plpgsql;

create trigger update_student_trigger
after update
on Enrolment
execute procedure update_student();

-- insert into enrolment does not exceed quota
create function quota_check() returns trigger
as $$
declare
	quota_full boolean;
begin
	select into quota_full
	(numStudes >= quota)
	from Course
	where code = new.course;

	if (quota_full) then 
		raise exception 'Course is full';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger quota_check_trigger
before insert
on Enrolment
execute procedure quota_check();