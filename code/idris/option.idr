module option
import bool

data option t = some t | none

o1: option bool
o1 = none

o2: option bool
o2 = some true
