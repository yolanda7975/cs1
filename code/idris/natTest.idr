module natTest

import nat
import bool
import pair

data natTest = O | S nat

add1:nat
add1 = add (S O) (S O) --expecting S(S O)

mult1:nat
mult1 = mult (S O) (S O) --expecting (S O)

exp1:nat
exp1 = exp (S(S O)) (S O) --expecting S(S O)

fact1:nat
fact1 = fact (S(S O)) --expecting S(S O)

subp1:nat
subp1 = subp (S(S O)) (S O) --expecting (S O)

lep1: bool
lep1 = lep (S O) (S(S(O))) --expecting true

eqp1: bool
eqp1 = eqp (S O) (S(S(O))) --expecting false
eqp2: bool
eqp2 = eqp (S(S(O))) (S(S(O))) --expecting true

gtp1: bool
gtp1 = gtp (S(S(O))) (S(S(O))) --expecting false
gtp2: bool
gtp2 = gtp (S(S(O))) (S(O)) --expecting true

gep1: bool
gep1 = gep (S O) (S(S(O))) --expecting false
gep2: bool
gep2 = gep (S(S(O))) (S(S(O))) --expecting true
gep3: bool
gep3 = gep (S(S(O))) (S(O)) --expecting true

ltp1: bool
ltp1 = ltp (S O) (S(S(O))) --expecting true
ltp2: bool
ltp2 = ltp (S(S(O))) (S(S(O))) --expecting false
ltp3: bool
ltp3 = ltp (S(S(O))) (S(O)) --expecting false
