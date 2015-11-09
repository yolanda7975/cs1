{-
Homework due Friday is at the bottom, from #5.
-}

module nat

import bool
import eq
import Serialize

data nat = O | S nat

||| returns the successor of any given nat
succ: nat -> nat
succ n = S n

||| returns the predecessor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n

||| return true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

|||return true if the argument is odd ow false
oddb: nat -> bool
oddb n = not (evenb n)

--binary function
--1:addition
add: nat -> nat -> nat
add O m = m
add (S n) m = S (add n m)

--2:multiplication
mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add (mult n m) m

--3:exponential
exp: nat -> nat -> nat
exp O m = O
exp (S n) O = (S O)
exp m (S n) = mult m (exp m n)

--4: factorial
fact: nat -> nat
fact O = (S O)
fact (S n) = mult (S n) (fact n)

--5: substraction
subp: nat -> nat -> nat
subp O m = O
subp n O = n
subp (S n) (S m) = subp n m

--6: given a pair of natural numbers, (a, b), return true if a is less than or equal to b, otherwise return false
lep: nat-> nat -> bool
lep O m = true
lep (S n) O = false
lep (S n) (S m) = lep n m

 -- 7:given a pair of natural numbers, (a, b), return true if a is equal to be, otherwise return false
eql_nat: nat -> nat -> bool
eql_nat O O = true
eql_nat O (S m) = false
eql_nat (S n) O = false
eql_nat (S n) (S m) = eql_nat n m

--8: given a pair of natural numbers, (a, b), return true if a is greater than b, otherwise return false
gtp: nat -> nat -> bool
gtp O m = false
gtp (S n) O = true
gtp (S n) (S m) = gtp n m

--9:given a pair of natural numbers, (a, b), return true of a is greater than or equal to b
gep: nat -> nat -> bool
gep m O = true
gep O (S n) =false
gep (S n) (S m) = gep n m

--10:given a pair of natural numbers, (a, b), return true if a is less than b
ltp: nat -> nat -> bool
ltp m O = false
ltp O (S n) = true
ltp (S n) (S m) = ltp n m

instance eq nat where
 eql n1 n2 = eql_nat n1 n2

instance Serialize nat where
  toString O = "Z"
  toString (S n) = "S" ++ (toString n)
  
