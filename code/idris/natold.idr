module nat

import bool 

%default total

data nat = O | S nat

|||returns true if the argument is (represents) zero, ow. false
isZero: nat -> bool
isZero O = true
isZero (S_) = false

|||returns the successor of any given nat
succ: nat -> nat
succ O = S O
succ (S n') = S (S n')

succ n = S n

|||returns the predecessor of any given nat
pred: nat -> nat
pred O = O 
pred (S n) = n

||| return true if the argument is even ow false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n
