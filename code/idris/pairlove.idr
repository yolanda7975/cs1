module love

import pair 

data people = mary | mau
loves: people -> people
loves mary = mau
loves mau = mau 

p1: pair people people
p1 = mkPair mary mau

p2: pair people people
p2 = mkPair mau mau
