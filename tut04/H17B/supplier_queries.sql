-- Q12 Find the names of suppliers who supply some red part.
--    sname
-- -----------
--  Priceline
--  Kmart
--  Coles
--  Red-Mart
-- (4 rows)

create or replace view q12(name)
as
	select distinct s.sname
	from catalog c
	join suppliers s on (s.sid = c.sid)
	join parts p on (p.pid = c.pid)
	where p.colour = 'red';
;

-- Q13 Find the sids of suppliers who supply some red or green part.
--  sid
-- -----
--    2
--    3
--    4
--    5
--    6
-- (5 rows)
create or replace view q13(sid)
as
	select distinct c.sid
	from catalog c
	join parts p on (p.pid = c.pid)
	where p.colour = 'red' or p.colour = 'green';
;

-- Q14 Find the sids of suppliers who supply some red part or whose address is 221 Packer Street.
--  sid
-- -----
--    2
--    3
--    4
--    5
--    6
-- (5 rows)
create or replace view q14(sid)
as
	select distinct s.sid
	from catalog c
	join suppliers s on (s.sid = c.sid)
	join parts p on (p.pid = c.pid)
	where p.colour = 'red' or s.address = '221 Packer Street';
;

-- Q15 Find the sids of suppliers who supply some red part and some green part.
--  sid
-- -----
--    3
--    4
-- (2 rows)
create or replace view q15(sid)
as
	(select distinct c.sid
	from catalog c
	join parts p on (p.pid = c.pid)
	where p.colour = 'red')
	intersect
	(select distinct c.sid
	from catalog c
	join parts p on (p.pid = c.pid)
	where p.colour = 'green')
;

-- Q16 Find the sids of suppliers who supply every part.
--  sid
-- -----
--    3
--    4
-- (2 rows)

create or replace view q16(sid)
as
select s.sid
from suppliers s
where not exists((select p.pid from parts p)
				 except
				 (select c.pid from catalog c
				  where c.sid = s.sid))
;

-- Q23 Find the pids of parts supplied by every supplier at a price less than 200 dollars (if any supplier either does not supply the part or charges more than 200 dollars for it, the part should not be selected).

create or replace view q23(pid)
as
select c.pid
from catalog c
where c.cost < 200
group by c.pid
having count(*) = (select count(*) from Suppliers)
;