module list

import nat
import bool
import ite
import eq
import Serialize
import Box


infixr 7 :: --infix,pred 7, named ::
data list a = nil | (::) a (list a)--list is a constructor

li: list bool
li = true :: false :: true :: true :: nil

lO:list nat
lO = nil

l1:list nat
l1 = O :: nil -- or lO , they both represent a small list

l2:list nat
l2 = (S O) :: (S(S O)) :: nil

l3:list nat
l3 = (S O) :: (S(S O)) :: (S(S(S O))) :: nil

|||length function
length: list a -> nat
length nil = O
length (n::l)  = S (length l)

{-
|||append function
append: list a -> list a -> list a
append nil l = l
append (m :: l) l' = m :: (append l l')
-}

||| append as an infix operater ++
(++): list a -> list a -> list a
(++) nil l2 = l2
(++) (h :: t) l2 = h :: (t ++ l2)

|||map a function over elements of a list
map: (a -> b) -> list a -> list b   -- a,b are elements
map f nil = nil                     -- f= (a -> b), a function, like ageMap
map f (h::t) = (f h) :: (map f t)   -- taking head h, forming new list


||| give a list and a predicate on elements return the sublist of elements for which the predicate is true
filter: (a -> bool) -> list a -> list a      -- list a -> list a, same type of list, eg list nat, list bool...
filter f nil = nil                           -- "if" the predicate is true for the head of the list, we need "if"
filter f (h :: t) = ite (f h)                --ite: if then else
                        ( h :: (filter f t)) -- if the condition holds, return this result
                               (filter f t)  --o.w. return this result

foldr: (a -> a -> a) ->a -> (list a) ->a
foldr f id nil = id
foldr f id (h::t) = f (h) (list.foldr f id t)

--eql: a -> a -> bool
--eql a nil = false
--eql v1 v2

member: (eq a) => a -> list a -> bool
member v nil = false
member v (h::t) = ite (eql v h)
                      true
                      (member v t)

instance (eq a) => eq (list a) where
  eql nil nil = true
  eql (h :: t) nil = false
  eql nil (h :: t) = false
  eql (h1 :: t1) (h2 :: t2) = and (eql h1 h2) (eql t1 t2)

toStringList :(Serialize a)=> list a -> String
toStringList nil = ""
toStringList (h::nil)= (toString h)
toStringList (h::t) = (toString h) ++ ", " ++(toStringList t) --h is an element,which is defined

instance (Serialize a) => Serialize (list a) where
  toString l ="[" ++ (toStringList l) ++"]"

  {-
  toString (v::nil) = toString v
  toString (h::t) = (toString h) ++ "," ++ (toString t)
print_list:(Serialize a) => list a-> String
print_list nil = "[]"
print_list l = "[" ++ (toString l) ++ "]"
-}
