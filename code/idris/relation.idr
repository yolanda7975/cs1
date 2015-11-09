module relation

import list
import bool
import People
import person


query2:  (list tuple) -> (tuple -> bool) -> (tuple -> value) ->
            (value -> value -> value) -> value -> value
query2 relation select project reduce id =
         list.foldr reduce id (map project (filter select relation))


{-
--count
countOne: a -> Nat
countOne v = 1

number: Nat
number = query2 people gender countOne plus 0

count_rel: (list tuple) -> (tuple -> bool) -> Nat
count_rel rel sel = query2 rel sel countOne plus 0

--sum
sum_rel: (list tuple) -> (tuple -> bool) -> (tuple -> Nat) -> Nat
sum_rel rel sel proj = query2 rel sel proj plus 0

--mean
aveAge: pair Nat Nat
aveAge = mkPair
           (query2 people gender age plus 0)
           (query2 people gender countOne plus 0)

ave_rel:
(list tuple) -> (tuple -> bool) -> (tuple -> Nat) -> pair Nat Nat
ave_rel rel sel proj =
                       mkPair (sum_rel rel sel proj) (count_rel rel sel)

aveAge': pair Nat Nat
aveAge' = ave_rel people gender age
-}
