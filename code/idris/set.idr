module set

import list
import ite
import bool
import eq
import Serialize

|||mkSet is meant to be private
data set a  = mkSet (list a)

|||a starting for buildihg any set
new_set: set a
new_set = mkSet nil

set_insert: (eq a) => a -> set a -> set a
set_insert v (mkSet l) = ite (member v l)
                         (mkSet l)
                         (mkSet (v :: l))


subset_elements:(eq a) => list a -> list a -> bool
subset_elements nil l = true
subset_elements (h1::t1) l = and (member h1 l) (subset_elements t1 l)

same_elements: (eq a) => list a -> list a -> bool
same_elements p q = and (subset_elements p q) (subset_elements q p)

eql_set: (eq a) => set a -> set a -> bool
eql_set (mkSet l1) (mkSet l2) = same_elements l1 l2

instance (eq a) => eq (set a) where
  eql s1 s2 = eql_set s1 s2
