module DNATest

import DNA
import list
import pair
import nat

a: list base
a = complement_strand (A ::T ::C :: G :: nil)
--expecting T :: A :: G :: C :: nil

b: list base
b = strand1 ( (mkPair A T) :: (mkPair T A) :: (mkPair C G) :: (mkPair G C) ::nil)
--expecting A :: T :: C :: G :: nil

c: list base
c = strand2 ( (mkPair A T) :: (mkPair T A) :: (mkPair C G) :: (mkPair G C) ::nil)
--expecting T :: A :: G :: C :: nil

d: list (pair base base)
d = complete (A ::T ::C :: G :: nil)
--expecting mkPair A T :: mkPair T A :: mkPair C G :: mkPair G C :: nil

e: Nat
e = countBase (A :: T :: T :: G :: C :: T :: nil) T
--expecting 3
