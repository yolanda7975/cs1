module friend

import bool

||| A friend is someone who is or is not trustworthy
||| a name, and who has an age in yours

data friend = mkFriend bool String Nat

f1: friend
f1 = mkFriend true "Tommy" 23

f2: friend
f2 = mkFriend false "Barry" 34

getAge: friend -> Nat
getAge (mkFriend b s n) = n

getName: friend -> String
getName (mkFriend b s n) = s

getTrust: friend -> bool
getTrust (mkFriend b s n) = b
