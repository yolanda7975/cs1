module set_spectTest

import set_adt_hw

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

empty1:bool
empty1 = isEmpty (mkSet l2)
--expecting false

insert1: set nat
insert1 = set_insert (S O) (mkSet (S (S O) :: S (S (S O)) :: nil))
--expecting mkSet (S O :: S (S O) :: S (S (S O)) :: nil)

list_remove1:list nat
list_remove1 = list_remove (S O) l3
--expecting S (S O) :: S (S (S O)) :: nil
set_remove1:set nat
set_remove1 = set_remove (S O) (mkSet l3)
--expecting mkSet (S (S O) :: S (S (S O)) :: nil)

card: nat
card = set_cardinality (mkSet l3)
--expecting S (S (S O))

member1:bool
member1 = set_member (S O) (mkSet l3)
--expecting true

union1:set nat
union1 = set_union (mkSet l2) (mkSet l3)
--expecting mkSet (S O :: S (S O) :: S (S (S O)) :: nil)
union2:set nat
union2 = set_union (mkSet(S O :: S (S O) :: S(S(S(S O)))::nil)) (mkSet (S(S O)::S(S(S O))::nil))
--expecting mkSet (S O :: S (S O) :: S (S (S O)) :: nil)

intersect1: list nat
intersect1 = intersect l2 l3
--expecting S O :: S (S O) :: nil
intersection1:set nat
intersection1 = set_intersection (mkSet l2)  (mkSet l3)
--expecting mkSet (S O :: S (S O) :: nil)

difference1:set nat
difference1 = set_difference (mkSet l2) (mkSet l3)
--expecting mkSet mkSet (S (S (S O)) :: nil)
difference2:set nat
difference2 = set_difference (mkSet(S O :: S (S O) :: S(S(S(S O)))::nil)) (mkSet (S(S O)::S(S(S O))::nil))
--expecting mkSet (S O :: S (S (S (S O))) :: S (S (S O)) :: nil)


a:bool
a = set_forall evenb (mkSet ((S(S O))::nil))
--expecting true
b:bool
b = set_forall evenb (mkSet ((S O)::nil))
--expecting false
c:bool
c = set_exists oddb (mkSet ((S(S O))::nil))
--expecting false
d:bool
d = set_exists oddb (mkSet ((S O)::nil))
--expecting true

witness1: option nat
witness1 = set_witness evenb (mkSet l3)
--expecting some (S (S O))
witness2:option nat
witness2 = set_witness oddb (mkSet (S (S O) :: S (S (S O)) :: nil))
--expecting some (S (S (S O)))

pairlist1:list (pair nat bool)
pairlist1 = pairlist (S O) (true::false::nil)
--expecting mkPair (S O) true :: mkPair (S O) false :: nil
listproduct:list (pair nat bool)
listproduct =list_product l2 (true::false ::nil)
--expecting mkPair (S O) true :: mkPair (S O) false :: mkPair (S (S O)) true :: mkPair (S (S O)) false :: nil
setproduct:set(pair nat bool)
setproduct = set_product (mkSet l2) (mkSet (true::false ::nil))
--expecting mkSet (mkPair (S O) true ::mkPair (S O) false ::mkPair (S (S O)) true :: mkPair (S (S O)) false :: nil)

equal1:bool
equal1= eql (mkSet l2) (mkSet l3)
--expecting false
equal2:bool
equal2 = eql (mkSet (true::false :: nil)) (mkSet(false::true::nil ))
--expecting true
string1:String
string1 = toString (mkSet l3)
--expecting "(SZ, SSZ, SSSZ)"
