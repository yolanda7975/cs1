module boolTest

import bool

data boolTest = true | false
{-
t= true f= false
-}

--boolTest for and function
and_t_t: bool
and_t_t = and true true
--expecting true
and_t_f: bool
and_t_f = and true false
--expecting false
and_f_t: bool
and_f_t = and false true
--expecting false
and_f_f: bool
and_f_f = and false false
--expecting false

--boolTest for or function
or_t_t: bool
or_t_t = or true true
--expecting true
or_t_f: bool
or_t_f = or true false
--expecting true
or_f_t: bool
or_f_t = or false true
--expecting true
or_f_f: bool
or_f_f = or false false
--expecting false

--boolTest for xor function
xor_t_t: bool
xor_t_t = xor true true
--expecting false
xor_t_f: bool
xor_t_f = xor true false
--expecting true
xor_f_t: bool
xor_f_t = xor false true
--expecting true
xor_f_f: bool
xor_f_f = xor false false
--expecting false

--boolTest for nand function
nand_t_t: bool
nand_t_t = nand true true
--expecting false
nand_t_f: bool
nand_t_f = nand true false
--expecting true
nand_f_t: bool
nand_f_t = nand false true
--expecting true
nand_f_f: bool
nand_f_f = nand false false
--expecting true
