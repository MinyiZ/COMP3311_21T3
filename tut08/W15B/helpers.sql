-- Q3
create or replace view student_info
as
	select p.id, p.family, p.given, s.code as subj, t.code as term
	from Courses c
	join Terms t on (c.term = t.id)
	join Subjects s on (c.subject = s.id)
	join Course_enrolments e on (e.course = c.id)
	join People p on (e.student = p.id)
	order by p.family, p.given
;

-- OR

create type stu as (id int, family text, given text);
create or replace function student_info(_subject text, _term text) returns setof stu
as $$
begin
	return query
	select p.id, p.family::text, p.given::text
	from Courses c
	join Terms t on (c.term = t.id)
	join Subjects s on (c.subject = s.id)
	join Course_enrolments e on (e.course = c.id)
	join People p on (e.student = p.id)
	where s.code = _subject
	and t.code = _term
	order by p.family, p.given;
end;
$$ language plpgsql;

-- Q5

create or replace view student_courses
as
select e.student, t.code as term, s.code as subject, s.name as subjname
from Course_enrolments e
join Courses c on (c.id = e.course)
join Subjects s on (c.subject = s.id)
join Terms t on (c.term = t.id)
order by s.code
;