-- q2a

create table Teacher (
	staffID		integer,
	subj	    text,
	semester	text,
	primary key	(staffID),
	foreign key (subj) references Subj(subjCode)
);

create table Subj (
	subjCode	text,
	primary key	(subjCode)
);


-- q2b

create table Teacher (
	staffID		integer,
	primary key	(staffID),
);

create table Subj (
	subjCode	text,
	primary key	(subjCode)
);

create table Teaches (
	staff		integer,
	subj		text,
	semester	text,
	primary key (staff, subj),
	foreign key (staff) references Teacher(staffID),
	foreign key (subj) references Subj(subjCode)
);

-- q2c

create table Teacher (
	staffID		integer,
	primary key	(staffID),
);

create table Subj (
	subjCode	text,
	staff		integer not null unique,
	semester	text,
	primary key	(subjCode)
	foreign key (staff) references Teacher(staffID),
);

-- q5a

create table R (
	id 		integer,
	name 	text,
	address text,
	d_o_b	date,

	primary key (id)
);

-- q5b

create table S (
	name 	text,
	address text,
	d_o_b	date,

	primary key (name, address)
)

-- q10

create table Supplier (
	name	text,
	city	text,

	primary key (name)
);

create table Part (
	number	integer,
	colour	text,

	primary key (number)
);

create table Supply (
	supplier 	text,
	part		integer,
	quantity	integer,

	primary key (supplier, part),
	foreign key supplier references Supplier(name),
	foreign key part references Part(number)
);