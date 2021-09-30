-- q2a

create table Teacher (
	staffID		integer,
	subj		text,
	semester	text,

	primary key (staffID),
	foreign key (subj) references Subject(subjCode)
);

create table Subject (
	subjCode	text,
	
	primary key (subjCode)
);

-- q2b
create table Teacher (
	staffID		integer,

	primary key (staffID)
);

create table Teaches (
	teacher		integer	
	subj		text,
	semester	text,

	primary key (teacher, subj, semester),
	foreign key (teacher) references Teacher(staffID),	
	foreign key (subj) references Subject(subjCode)
);

create table Subject (
	subjCode	text,
	
	primary key (subjCode)
);

-- q2c

create table Teacher (
	staffID		integer,

	primary key (staffID),
);

create table Subject (
	subjCode	text,
	-- not null because subject must have a teacher (total participation)
	-- unique because teacher can only teach 0 or 1 subject
	teacher		integer not null unique,
	semester	text,
	
	primary key (subjCode),
	foreign key (teacher) references Teacher(staffID)
);

-- q5a

create table R (
	id		integer primary key,
	name	text,
	address	text,
	d_o_b	date
);


create table R (
	id		integer,
	name	text,
	address	text,
	d_o_b	date,

	primary key (id)
);

-- q5b

create table S (
	name	text,
	address	text,
	d_o_b	date,

	primary key (name, address)
);
