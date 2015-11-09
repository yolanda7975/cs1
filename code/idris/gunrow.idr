module gunrow

import list

data country = Argentina | Australia | Austria | Honduras | USA

|||A record of this tye represetns a country and the death rate per 10,000,000
|||by gun for homocides, suicides, uintentional, other deaths

data gunrow = mkGunrow country Nat Nat Nat Nat

data list gunrow = nil | cons gunrow (list gunrow)

argen:gunrow
argen = mkGunrow Argentina 190 279 64 362

aust:gunrow
aust = mkGunrow Australia 11 62 5 8

austr:gunrow
austr = mkGunrow Austria 18 268 1 8

hond:gunrow
hond = mkGunrow Honduras 648 0 0 0

usa:gunrow
usa = mkGunrow USA 355 670 16 9

lst:list gunrow
lst = cons argen (cons aust (cons austr (cons hond (cons usa nil))))


countryname: gunrow -> country
countryname (mkGunrow c h s u o) = c

homicidePer10M: gunrow -> Nat
homicidePer10M (mkGunrow c h s u o) = h

suicidePer10M: gunrow -> Nat
suicidePer10M (mkGunrow c h s u o) = s

unintentionalPer10M: gunrow -> Nat
unintentionalPer10M (mkGunrow c h s u o) = u

otherPer10M: gunrow -> Nat
otherPer10M (mkGunrow c h s u o) = o
