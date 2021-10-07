create table Employees (
      eid     integer,
      ename   text,
      age     integer,
      salary  integer,

      primary key (eid),

      check (salary >= 15000)
);
create table Departments (
      did     integer,
      dname   text,
      budget  integer,
      manager integer not null,

      primary key (did),
      foreign key (manager) references Employees(eid)

      -- note won't work in postgres
      -- check (100 = (select sum(w.percent)
      --               from worksin w
      --               where w.eid = manager)
      -- ) 
);
create table WorksIn (
      eid     integer,
      did     integer,
      percent real,

      primary key (eid,did),
      foreign key (eid) references Employees(eid) on delete cascade,          
      foreign key (did) references Departments(did)

      -- note won't work in postgres
      -- check (100 >= (select sum(w.percent)
      --        from worksin w
      --        where w.eid = eid) 
      -- )
);