-- COMP3311 Prac 03 Exercise
-- Schema for simple company database

create table Employees (
	tfn         char(11),
	givenName   varchar(30)	NOT NULL,
	familyName  varchar(30),
	hoursPweek  float,
	PRIMARY KEY (tfn),
	CHECK (tfn ~* '\d{3}-\d{3}-\d{3}'),
	CHECK (hoursPweek <= 168 and hoursPweek >= 0)
);

create table Departments (
	id          char(3),
	name        varchar(100) UNIQUE,
	manager     char(11) UNIQUE,
	PRIMARY KEY (id),
	FOREIGN KEY (manager) REFERENCES Employees (tfn),
	CHECK (id ~* '\d{3}')
);

create table DeptMissions (
	department  char(3),
	keyword     varchar(20) NOT NULL,
	FOREIGN KEY (department) REFERENCES Departments (id)
);

create table WorksFor (
	employee    char(11) NOT NULL,
	department  char(3) NOT NULL,
	percentage  float,
	FOREIGN KEY (employee) REFERENCES Employees (tfn),
	FOREIGN KEY (department) REFERENCES Departments (id),
	CHECK (percentage > 0 and percentage <= 100)
);
