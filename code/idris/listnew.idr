module listnew

import bool
import nat

infixr 7 ::, ++

data list a  = nil | (::) a (list a)

length:list a -> nat
length nil = O
length (h::t) = S (length t)

append: list a  -> list a -> list a
append nil l2 = l2
append (h :: l1') l2 = h :: (append l1' l2)

||| append as an infix operater ++
(++): list a -> list a -> list a
(++) nil l2 = l2
(++) (h :: t) l2 = h :: (t ++ l2)

|||map a function over elements of a list
map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h) :: (map f t)
