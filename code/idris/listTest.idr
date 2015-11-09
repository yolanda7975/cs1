module listTest

import bool
import nat
import list
--import gunrow
import fashion
import eq


--testing length function
l:nat
l = length l3 --expecting S(S(S O))
l_O:nat
l_O = length lO --expecting O

--testing length lst,expecting S (S (S (S (S O))))
--lg: nat
--lg = length  lst

--testing append function, old , use ++
--a1:list nat
--a1 = append nil nil --expecting nil
--a2:list nat
--a2 = append nil l2  --expecting (S O) :: S (S O) :: nil
--a3:list nat
--a3 = append l3 l3 --expecting (S O) :: S (S O) :: S (S (S O)) :: (S O) :: S (S O) :: S (S (S O)) :: nil



-- ite true O (S O) -> O
-- ite false O (S O) -> (S O)

-- filter evenb nil  -> nil
-- filter evenb ((S O) :: nil) -> nil
-- filter evenb (3 ::2 ::1 :: 0 :: nil) -> 2 :: 0 ::nil

y1: list bool
y1 = map evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)
--expecting true :: false :: true :: true :: nil
y2: list nat
y2 = filter evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)
--expecting O :: S (S O) :: S (S (S (S O))) :: nil
y3: list Nat
y3 = map year (burberry :: chanel :: ysl :: nil)
y4: list fashion
y4 = filter paris (burberry :: chanel :: ysl ::nil)
y5: list String
y5 = map firstname (burberry :: chanel :: ysl ::nil)

isThree: bool
isThree = (member (S (S (S O))) l2)
