module DNA

import list
import nat
import pair

data base = A | T | C | G

complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base C = G
complement_base G = C

complement_strand: list base -> list base
complement_strand nil = nil
complement_strand (a :: b) = map complement_base (a :: b)

strand1: list (pair base base) -> list base
strand1 nil = nil
strand1 (a::b) = map fst (a::b)

strand2: list (pair base base) -> list base
strand2 nil = nil
strand2 (a::b) = map snd (a::b)

p: base -> pair base base
p a = mkPair a (complement_base a)
complete: list base -> list (pair base base)
complete (a :: b) = map p (a::b)

baseNat: base -> base -> Nat
baseNat A A = 1
baseNat T T = 1
baseNat C C = 1
baseNat G G = 1
baseNat _ _ = 0

countBase: list base -> base -> Nat
countBase nil a = 0
countBase (a::b) c = list.foldr plus 0 (map (baseNat c) (a::b))
