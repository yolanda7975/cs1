module Box

import bool
import unit
import eq
import Serialize

data Box t = mkBox t
unbox: Box t -> t -- ##Box is not type any more,but a type constructor, so put a parameter in it
unbox (mkBox b) = b

eql_box :(eq a)=> Box a -> Box a -> bool
eql_box (mkBox v1) (mkBox v2) = eql v1 v2

instance (eq a) => eq (Box a) where
  eql (mkBox v1) (mkBox v2) = eql v1 v2

instance (Serialize a) => Serialize (Box a) where
  toString (mkBox b) = "(" ++(toString b)++ ")"
  



--data Box = mkBox bool -- bool indicates true or false

--b1: Box
--b1 = (mkBox true)

--b2: Box
--b2 = (mkBox false)

--unbox: Box -> bool
--unbox (mkBox b) = b
