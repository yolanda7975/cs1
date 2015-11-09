module colors


import pair
import bool

%default total -- force functions to be total

data colors  = red | yellow | green | cyan | magenta | blue

complement: colors -> colors
complement red = cyan
complement cyan = red
complement green = magenta
complement magenta = green
complement blue = yellow
complement yellow = blue

additive: colors -> bool
additive red = true
additive green = true
additive blue = true
additive _ = false

substractive: colors -> bool
--substractive c = not (additive c) better
substractive cyan = true
substractive magenta = true
substractive yellow = true
substractive _ = false

complements: pair colors colors -> bool
complements (mkPair red cyan) = true
complements (mkPair red _) = false
complements (mkPair cyan red) = true
complements (mkPair cyan _) = false
complements (mkPair green magenta) = true
complements (mkPair green _) = false
complements (mkPair magenta green) = true
complements (mkPair magenta _) = false
complements (mkPair blue yellow) = true
complements (mkPair blue _) = false
complements (mkPair yellow blue) = true
complements (mkPair yellow _) = false

mixink: pair colors colors -> colors
mixink (mkPair magenta cyan) = blue
mixink (mkPair cyan magenta) = blue
mixink (mkPair yellow cyan) = green
mixink (mkPair cyan yellow) = green
mixink (mkPair magenta yellow) = red
mixink (mkPair yellow magenta) = red

