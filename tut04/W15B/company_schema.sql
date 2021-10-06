create table Employees (
      eid     integer,
      ename   text,
      age     integer,
      salary  real,

      primary key (eid)
);
create table Departments (
      did     integer,
      dname   text,
      budget  real,
      manager integer,

      primary key (did),
      foreign key (manager) references Employees(eid)
);
create table WorksIn (
      eid     integer,
      did     integer,
      percent real,

      primary key (eid,did),
      foreign key (eid) references Employees(eid),          
      foreign key (did) references Departments(did)       
);