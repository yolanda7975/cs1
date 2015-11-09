module set_spect

-- imports needed for specification
import bool
import option
import pair
import list
import nat
import eq
import Serialize

-- imports needed for list-based implementation
import list
import ite

data set a = mkSet (list a)

-- The empty set of a
emptySet: set a
emptySet = mkSet nil

-- If s is empty then true, otherwise false
isEmpty: (s: set a) -> bool
isEmpty (mkSet nil) = true
isEmpty (mkSet l) = false

-- Return the set, s union {v}
set_insert: (eq a) =>(v: a) -> (s:set a)-> set a
set_insert v (mkSet l) = ite (member v l)
                             (mkSet l)
                             (mkSet (v::l))

-- Return the set, s - {v}
list_remove: (eq a) => (v: a) -> (l: list a) -> list a
list_remove v nil = nil
list_remove v (h::t) = ite (eql v h)
                       t
                       (h::(list_remove v t))
set_remove: (eq a) => (v: a) -> (s:set a) -> set a
set_remove v (mkSet l) = mkSet (list_remove v l)

-- Return the number of elements in s
set_cardinality: (s: set a) -> nat
set_cardinality (mkSet nil) = O
set_cardinality (mkSet (n::l)) = S (set_cardinality (mkSet l))

-- If v is in s return true, otherwise false
set_member: (eq a) => (v: a) -> (s: set a) -> bool
set_member v (mkSet nil) = false
set_member v (mkSet (n::l)) = ite (eql v n)
                              true
                              (set_member v (mkSet l))

-- Return union of s1 and s2
combine: (eq a) => (l1:list a)->(l2:list a) -> list a
combine nil l = l
combine (h::t) l = ite (member h l)
                   (combine t l)
                   (h:: (combine t l))
set_union: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_union (mkSet l1) (mkSet l2) = mkSet (combine l1 l2)

-- Return the intersection of s1 and s2
list_intersection: (eq a) => (l1:list a) -> (l2:list a) -> list a
list_intersection nil l = nil
list_intersection (h::t) l = ite (member h l) (h:: (list_intersection t l)) (list_intersection t l)
set_intersection: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_intersection (mkSet p) (mkSet q) = mkSet (list_intersection p q)

-- Return the set difference, s1 minus s2

list_difference:(eq a) => (l1: list a) -> (l2: list a) -> list a
list_difference nil l=l
list_difference (h::t) l = ite (member h l) (list_difference t (list_remove h l)) (h::(list_difference t l))
set_difference: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_difference (mkSet l1) (mkSet l2) = mkSet (list_difference l1 l2)


-- Return true if p is true for every v in s, otherwise false
set_forall: (p: a -> bool) -> (s: set a) -> bool
set_forall evenb (mkSet nil) = true
set_forall p (mkSet (h::t)) = and (p h) (set_forall p (mkSet t))

-- Return true if p is true for some v in s, otherwise else false
set_exists: (p: a -> bool) -> (s: set a) -> bool
set_exists oddb (mkSet nil) = false
set_exists p (mkSet (h::t)) = or (p h) (set_exists p (mkSet t))

set_witness: (p: a -> bool) -> (s: set a) -> option a
set_witness p (mkSet (h::t)) = ite (set_exists p (mkSet (h::t))) ((ite (p h)) (some h) (set_witness p (mkSet t))) (none)

--pairlist, (h l),return (h ei),ei belongs to l
pairlist: a -> list b -> list (pair a b)
pairlist someA nil = nil
pairlist someA (b::tb) = (mkPair someA b)::(pairlist someA tb)
list_product:(l1:list a) -> (l2:list b) -> list(pair a b)
list_product nil l = nil
list_product l nil = nil
list_product (h::t) p = (pairlist h p) ++ (list_product t p)
set_product: (s1: set a) -> (s2: set b) -> set (pair a b)
set_product (mkSet l1) (mkSet l2) = mkSet (list_product l1 l2)

{-subset:
h h::t = piarlist h t
list_powerset:(l1:list a)->(l2:list a)
list_powerset (h::t)= (subset h (h::t))++(list powerset t)
--set_powerset: (s: set a) -> set (set a)
set_powerset (mkSet nil) = mkSet (mkSet nil)
set_powerset (mkSet l)= mkSet (mkSet (list_powerset l))-}
-- return true if s1 and s2 are equal, else false
subset_elements:(eq a) => list a -> list a -> bool
subset_elements nil l = true
subset_elements (h1::t1) l = and (member h1 l) (subset_elements t1 l)

same_elements: (eq a) => list a -> list a -> bool
same_elements p q = and (subset_elements p q) (subset_elements q p)

set_eql: (eq a) => (s1: set a) -> (s2: set a) -> bool
set_eql (mkSet l1) (mkSet l2) = same_elements l1 l2

-- Return a string representation of s
set_toString: (Serialize a) => set a -> String
set_toString (mkSet nil) = ""
set_toString (mkSet (h::nil))= (toString h)
set_toString (mkSet (h::t)) = (toString h) ++ ", " ++(set_toString (mkSet t))

instance (eq a) => eq (set a) where
  eql s1 s2 = set_eql s1 s2

instance (Serialize a) => Serialize (set a) where
  toString s = set_toString s
