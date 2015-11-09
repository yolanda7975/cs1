module Box
import bool
data Box = mkBox bool

b1: Box -- b1 is a type of box
b1 = mkBox true 
-- no definiton of true at this point without import command
b2: Box
b2 = mkBox false

unbox: Box -> bool
unbox (mkBox b) = b

 
