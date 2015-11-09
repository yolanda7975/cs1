unit.idr
u: unit  --type of decoration
u = mkunit

v: unit
v = mkunit

list.idr
--lb2:nat
--lb2 = length nil  nil here is not defined (people, nat, bool),repl will show error
--lb1 false gives context
--lb2 = length nil {a = nat},correct!|||map a function over elements of a list

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
