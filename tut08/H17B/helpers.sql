-- helper views or functions

-- Q3

create or replace view student_info
as
	select p.id, p.family, p.given, s.code as subject, t.code as term
	from courses c
	join terms t on (t.id = c.term)
	join subjects s on (s.id = c.subject)
	join course_enrolments e on (e.course = c.id)
	join people p on (e.student=p.id)
	order by p.family, p.given
;

-- OR

create type stu as (id int, family text, given text);

create or replace function student_info(_subject text, _term text) returns setof stu
as $$
begin
	return query
	select p.id, p.family::text, p.given::text
	from courses c
	join terms t on (t.id = c.term)
	join subjects s on (s.id = c.subject)
	join course_enrolments e on (e.course = c.id)
	join people p on (e.student=p.id)
	where s.code = _subject and t.code = _term
	order by p.family, p.given;
end;
$$ language plpgsql;

-- Q5

create or replace view student_info2
as
	select p.id, t.code as term, s.code as subject, s.name as subjectName
	from courses c
	join terms t on (t.id = c.term)
	join subjects s on (s.id = c.subject)
	join course_enrolments e on (e.course = c.id)
	join people p on (e.student=p.id)
	order by s.code
;