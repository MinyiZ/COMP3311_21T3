# tut09

## Redundancy is Bad

![Untitled](tut09%20cbc1d365fed2411d89d4fd2102c53ab2/Untitled.png)

what if we want to

- change balance of A-113
- add new account
- delete account
- update branch address

## Functional Dependency

X → Y

can be read as:

- Y functionally depends on X
- X determines Y
- if we know X then we know Y

Rules

reflectivity:            X → X

augmentation:            X → Y         ⇒ XZ → YZ

transitivity:            X → Y, Y → Z  ⇒ X → Z

additivity:              X → Y, X → Z  ⇒ X → YZ

projectivity:            X → YZ        ⇒ X → Y, X → Z

pseudotransitivity:      X → Y, YZ → W ⇒ XZ → W

## Closure

X+       largest set of attributes that can be derived from X using F

where

X         set of attributes

F         set of functional dependencies

## Super Key

set of attributes that uniquely identifies a tuple in a table

any set X, such that X+ = R

## Candidate Key

a.k.a primary key

minimal superkey

any set X, such that X+ = R and there is no Y subset of X such that Y+ = R

## Boyce-Codd Normal Form (BCNF)

for all functional dependencies X → Y

either

- X → Y is trivial
- X is a superkey

## Third Normal Form (3NF)

for all functional dependencies X → Y

either

- X → Y is trivial
- X is a superkey
- Y is single attribute of a candidate key