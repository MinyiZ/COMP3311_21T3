-- schema

create table Suppliers (
      sid     integer primary key,
      sname   text,
      address text
);
create table Parts (
      pid     integer primary key,
      pname   text,
      colour  text
);
create table Catalog (
      sid     integer references Suppliers(sid),
      pid     integer references Parts(pid),
      cost    real,
      primary key (sid,pid)
);

-- Q13
select c.sid
from parts p
join catalog c on (p.pid = c.cid)
where p.colour = 'red' or p.colour = 'green';

-- Q15
(select c.sid
from parts p
join catalog c on (p.pid = c.cid)
where p.colour = 'red')
intersect
(select c.sid
from parts p
join catalog c on (p.pid = c.cid)
where p.colour = 'green')

select c.sid
from parts p
join catalog c on (p.pid = c.cid)
where p.colour = 'red'
and exists (select p2.pid
			from parts p2
			join catalog c2 on (p2.pid = c2.cid)
			where p2.colour = 'green'
			and c2.sid = c.sid
			)

-- Q16
select s.sid
from suppliers s
where not exists ((select p.pid from parts p)
					except
			      (select c.pid from catalog c where c.sid = s.sid))