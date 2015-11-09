module ite

import nat
import bool

|||define ite
ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb
