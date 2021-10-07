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

      -- check (1 = (
      --       select wi.percent
      --       from worksin wi
      --       where manager = wi.eid 
      -- ))
);
create table WorksIn (
      eid     integer default 1,
      did     integer,
      percent real,

      -- primary key (eid,did),
      foreign key (eid) references Employees(eid) on delete set default,      
      foreign key (did) references Departments(did)

      -- check (1 >= (
      --       select sum(percent)
      --       from worksin wi
      --       where eid = wi.eid
      -- ))
);