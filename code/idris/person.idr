module Person

import bool


||| A record type that is equivalent to:
||| (data Person = mkPerson String nat)
||| but where we give names to fields.
||| A person has a name and an age in
||| years.
record Person where
    constructor mkPerson
    name : String
    age : Nat
    height: Nat
    gender: bool
    --if female

-- An example value of type Person
p: Person
p = mkPerson "Tommy" 3 21 false

-- And now here's the key idea: The
-- names of the fields are automatically
-- names of projection functions! Here
-- we get out the age of person, p.
t: Nat
t = age p
-- expect 3

-- Here we get the name of person p.
n: String
n = name p
-- expect "Tommy"
