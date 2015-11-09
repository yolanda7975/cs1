module foo

import list
import nat

fancyplus: list nat -> nat
fancyplus nil = O
fancyplus (h :: t) = add h (fancyplus t)

fancymult: list nat -> nat
fancymult nil = (S O)
fancymult (h ::t) = mult h (fancymult t)

--binary operator
--identity element, abstract algebra
--type of lsit element

fancy:  (a -> a -> a) ->a -> (list a ) ->a
fancy f id nil = id
fancy f id (h::t) = f (h) (fancy f id t)
--fancy (++) "" ("Hello" :: "World" :: "!" :: nil)
-- expecting : "HelloWorld!"

fancyappend: list String -> String
fancyappend nil = ""
fancyappend (h::t) = h ++ (fancyappend t)

foldr: (a -> a -> a) ->a -> (list a) ->a
foldr f id nil = id
foldr f id (h::t) = f (h) (list.foldr f id t)
