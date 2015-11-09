module relationTest

import list
import relation
import bool
import People
import person


years'': Nat
years'' = query2 people gender age plus 0
--expecting 41

totalInches'': Nat
totalInches'' = query2 people gender height mult 1
--expecting 3776

names'': String
names'' = query2 people gender name (++) ""
--expecting Maryge


totalInches: Nat
totalInches = query2 people gender height plus 0
--expecting 123
