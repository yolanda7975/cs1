module unit
import bool
import eq
import Serialize
data unit = mkunit

unit_id: unit -> unit
unit_id mkunit = mkunit

eql_unit: unit -> unit -> bool
eql_unit v1 v2 = true

instance eq unit where
  eql u1 u2 = true

instance Serialize unit where
  toString u = "()"
