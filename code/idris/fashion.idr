module fashion

import bool
import list

|||fashion.idr contains three domains, which describes whether the fashion brand
|||is headquatered in Paris, the founders' first name (usually brand is named
|||after founders' last name), and the founding year.

record fashion where
    constructor Mkfashion
    brandname: String
    paris: bool --if headquater in Paris
    firstname : String -- founder's first name
    year : Nat -- founding year
    revenue: Nat --  in million*100

burberry: fashion
burberry = Mkfashion "Burberry" false "Thomas" 1856 23

chanel: fashion
chanel = Mkfashion "Chanel" true "Coco" 1909 67

ysl: fashion
ysl = Mkfashion "YSL" true "Yves" 1961 12

brand: list fashion
brand = burberry::
         chanel::
         ysl::
         nil

--testing fashion functions
t1: bool
t1 = paris burberry
--epecting "false"

t2: String
t2 = firstname chanel
--expecting "Coco"

t3: Nat
t3 = year ysl
--expecting "1961"
