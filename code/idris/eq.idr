module eq

import public bool

class eq a where
  eql:a -> a -> bool  -- line 6/9 press "tab"

instance eq bool where
  eql b1 b2 = eql_bool b1 b2
