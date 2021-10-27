create type StateType as (sum numeric, count numeric);

create function include(s StateType, v numeric) returns StateType
as $$
begin
	if (v is not null) then
		s.sum := s.sum + v;
		s.count := s.count + 1;
	end if;

	return s;
end;
$$ language plpgsql;


create function compute(s StateType) returns numeric
as $$
begin
	if (s.count = 0) then
		return 0;
	end if;

	return s.sum / s.count;
end;
$$ language plpgsql;

create aggregate mean(numeric) (
	stype = StateType,
	initcond = '(0,0)',
	sfunc = include,
	finalfunc = compute
);


/*
sum
	stype = int
	initcond = 0

1, 2, 3

state: 0
v = 1
state: 0 + 1 = 1
v = 2
state: 1 + 2 = 3
v = 3
state: 3 + 3 = 6


mean
	stype = (int, int)
	initcond = 0

1, 2, 3
state: (0, 0)
v = 1
state: (1, 1)
v = 2
state: (3, 2)
v = 3
state: (6, 3)

finalfunc: (int, int) -> int
6/3 = 2

*/