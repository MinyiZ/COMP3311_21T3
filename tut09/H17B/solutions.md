# thu solutions

## Q1b

A → B holds

B → A not hold

C → B not hold

## Q2

1. A+ = {A, B}
2. ACEG+ = {A, B, C, E, F, G}
3. BD+ = {A, B, C, D, E, F, G}

## Q3

1. CDE+ = {A, B, C, D, E}
BCD
ACD
2. not in third normal form
3. not in BCNF

## Q4

1. candidate key: B
    
    not BCNF: C → D and C → A does not have key on LHS
    
    not 3NF: C → D and C → A does not have part of key on RHS
    
2. candidate key: BD
    
    not BCNF: B → C and D → A does not have key on LHS
    
    not 3NF: B → C and D → A does not have part of key RHS
    
3. candidate key: ABC, BCD

   not BCNF: D → A does not have key on LHS

 in 3NF: for key ABC, ABC → D is ok because LHS is key, D → A is ok because RHS is part of key

d. candidate key: A

    not BCNF: BC → D does not have key on LHS

    not 3NF: BC → D does not have part of key on RHS

e. candidate key: AB, CD, BC, AD

    not BCNF: for key AB, C → A and D → B does not have key on LHS

    in 3NF for key AB

f. candidate key: A

   in BCNF

   in 3NF

## Q5

Team(name, captain): name → captain

Player(name, teamPlayedFor): name → teamPlayedFor

TeamColours(teamName, colour): no non-trivial fds

## Q7

1. candidate key: B
    
    BCNF Normalisation
    
    reduced minimal cover = {C → AD, B → C}
    
    ABCD
    
    choose fd {C → AD} and split tables
    
    CAD {C → AD} key: C ⇒ in BCNF
    
    BC  {B → C}  key: B ⇒ in BCNF
    
    result
    
    CAD, BC
    
    3NF Normalisation
    
    minimal cover = {C → D, C → A, B → C}
    
    reduced minimal cover = {C → AD, B → C}
    
    split into tables
    
    CAD {C → AD} key: C
    
    BC  {B → C}  key: B
    
    result
    
    CAD, BC
    
2. candidate key: BD
    
    BCNF Normalisation
    
    reduced minimal cover = {B → C, D → A}
    
    ABCD
    
    choose fd {D → A} and split tables
    
    DA  {D → A} key: D ⇒ in BCNF
    
    BCD {B → C} key: BD
    
    choose fd {B → C} and split tables
    
    BC {B → C} key: B ⇒ in BCNF
    
    BD {}      key: BD ⇒ in BCNF
    
    result
    
    AD, BC, BD
    
    3NF Normalisation
    
    minimal cover = {B → C, D → A}
    
    reduced minimal cover = {B → C, D → A}
    
    split into tables
    
    BC {B → C} key: B
    
    AD {D → A} key: D
    
    no table has key BD so add table
    
    BD {} key: BD
    
    result
    
    BC, AD, BD
    
3. candidate key: ABC, BCD

   BCNF Normalisation

reduced minimal cover = {ABC → D, D → A}

choose fd {ABC → D} and split tables

ABCD {ABC → D, D → A} key: ABC

ABC  {} key: ABC ⇒ in BCNF

choose {D → A} and split tables

AD  {D → A} key: D   ⇒ in BCNF

BCD {}      key: BCD ⇒ in BCNF

result

ABC, AD, BCD

 

3NF Normalisation

minimal cover = {ABC → D, D → A}

reduced minimal cover = {ABC → D, D → A}

split tables

ABCD {ABC → D} key: ABC

DA   {D → A}   key: D

result

ABCD, AD

d. candidate key: A

BCNF Normalisation

    

3NF Normalisation

minimal cover = {A → B, BC → D, A → C}

reduced minimal cover = {A → BC, BC → D}

split tables

ABC {A → BC} key: A

BCD {BC → D} key: BC

result

ABC, BCD

e. candidate key: AB, CD, BC, AD

   BCNF Normalisation