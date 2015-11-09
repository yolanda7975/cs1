module fashionTest

import list
import relation
import bool
import fashion

|||give the list of brands founded in paris
names: String
names = query2 brand paris brandname (++) ""
--expecting "ChanelYSL"

|||sum of revenue of brands founded in paris
totalRevenue: Nat
totalRevenue = query2 brand paris revenue plus 0
--expecting 79
