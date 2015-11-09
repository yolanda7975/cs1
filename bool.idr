module bool
data bool = true | false

id: bool -> bool
-- id true =  true
-- id false = false
id x = x


constTrue: bool -> bool
--constTrue true =  true
--constTrue false = true
--constTrue b = true
constTrue _ = true

not: bool -> bool
not true = false
not false = true

