# solutions

## Q1b

A → B holds

B → A does not hold

A → C does not hold

C → B does not hold

## Q2

1. A+ = {A,B}
2. ACEG+ = {A,B,C,E,F,G}
3. BD+ = {A,B,C,D,E,F,G}

## Q3

1. ACD+ = {A,B,C,D,E}
    
    CDE+ = {A,B,C,D,E}
    
    BCD+ = {A,B,C,D,E}
    
2. not in 3NF
3. not in BCNF

## Q4

1. candidate key: B
    
    not BCNF: C → D and C → A does not contain key on LHS
    
    not 3NF: C → D and C → A does not contain partial key on RHS
    
2. candidate key: BD
    
    not BCNF: B → C and D → A does not have key on LHS
    
    not 3NF: neither RHS contains part of key
    
3.  candidate key: ABC,BCD
    
     not BCNF: D → A does not have key on LHS
    
     in 3NF
    
4.  candidate key: A
    
     not BCNF: BC → D does not have key on LHS
    
     not 3NF: BC → D does not have part of key on RHS
    
5. candidate key: AB, AD, BC, CD
    
    not BCNF: if we choose key AB, C → A and D → B does not have key on LHS
    
    in 3NF for AB
    
6. candidate key: A
    
    in BCNF
    
    in 3NF
    

## Q5

Team(name, captain): name → captain

Player(name, teamPlayedFor): name → teamPlayedFor

Fan(name, address): name → address

TeamColours(teamName, colour): no non-trivial fd

yes in BCNF because every single relation is in BNCF because the fds in those relations are in BCNF

## Q7

R(A,B,C,D)

1. candidate key: B
    
    __BCNF__
    
    reduced minimal cover = {C → AD, B → C}
    
    ABCD
    
    choose fd {C → AD} and split tables
    
    CAD {C → AD} key: C ⇒ is in BCNF
    
    BC {B → C}   key: B ⇒ is in BCNF
    
    result
    
    CAD, BC

    <br>

    __3NF__
    
    minimal cover = {C → D, C → A, B → C}
    
    reduced minimal cover = {C → AD, B → C}
    
    split table
    
    CAD {C → AD}
    
    BC {B → C}
    
    result
    
    CAD, BC
    
2. candidate key: BD
    
    __BCNF__
    
    reduced minimal cover = {B → C, D → A}
    
    ABCD
    
    choose fd {B → C} and split tables
    
    BC {B → C}  key: B ⇒ is in BCNF
    
    ABD {D → A} key: BD
    
    choose fd {D → A} and split tables
    
    AD {D → A} key: D ⇒ is in BCNF
    
    BD {} key: BD ⇒ in BCNF
    
    result
    
    BC, AD, BD

    <br>
    
    __3NF__
    
    minimal cover = {B → C, D → A}
    
    reduced minimal cover = {B → C, D → A}
    
    split table
    
    BC {B → C}
    
    AD {D → A}
    
    add table with candidate key
    
    BD
    
    result
    
    BC, AD, BD
    
3.  candidate key: ABC,BCD

    __BCNF__
    
     ABCD
    
     reduced minimal cover = {ABC → D, D → A}
    
     
    
     choose fd {D → A} and split tables
    
     AD {D → A} key: D ⇒ in BCNF
    
     BCD {} key: BCD ⇒ in BCNF
    
     result
    
     AD, BCD
    
     ————————————————————————————————————————
    
     ABCD
    
     reduced minimal cover = {ABC → D, D → A}
    
     
    
     choose fd {ABC → D} and split tables
    
     ABCD {ABC → D, D → A} key: ABC
    
     ABC {} key: ABC ⇒ in BCNF
    
     choose fd {D → A} and split tables
    
     AD {D → A} key: D ⇒ in BCNF
    
     BCD {} key: BCD ⇒ in BCNF
    
     result
    
     ABC, AD, BCD
    
4.  candidate key: A
    
     __3NF__
    
     minimal cover = {A → B, BC → D, A → C}
    
     reduced minimal cover = {A → BC, BC → D}
    
     split table
    
     ABC {A → BC}
    
     BCD {BC → D}
    
     result
    
     ABC, BCD