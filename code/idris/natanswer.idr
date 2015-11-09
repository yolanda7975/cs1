it. Work with friends. Explain it to each
other. Test each other. -}

{- We capture this idea with the following deceptively simple data
type definition. What it says is that nat is a type, and there are two
ways to construct a nat. One is to use the constructor, O. The other
is to apply the constructor S to a value that is already known to be
of type nat.  Because O is already known to be of type nat, you can
thus apply S to O (yielding the term (S O)) and the result is also of
type nat. And now because it is a value of type nat, you can apply S
to it to get another value of type nat. Ad infinitum.

HOMEWORK #2: Study and think about this example as many times as
necessary to get it. Work with friends. Teach each other. Test each
other.  -}


||| A data type to represent the natural numbers.  We use a lower case
||| "n" in the name to distinguish our nat type from Idris's Nat type
data nat = O | S nat

-- HOMEWORK #3: In the REPL ask what are the types of nat, O and S.
-- Be sure you understand the answers! Teach, learning from and test
-- friends.

{-
ANSWER #3: The type of O is nat; the type of S is nat -> nat; and
the type of nat is Type. In other words, O is a value of type nat.
The constructor S is basically a function that takes a nat and gives
you back a (one bigger) nat. And nat is a type, which makes it a
value of the type called Type.
-}

{-
Here are some examples of some objects (named values) of type nat.
-}

-- zero
z: nat
z = O

-- one
o: nat
o = S O

-- two
t: nat
t = S (S O)

-- three
r: nat
r = S t

-- HOMEWORK #5: Make up some examples of your own. Add them below this
-- comment.

-- One possible answer

s: nat
s = S (S (S (S (S (S (S O))))))

-- HOMEWORK #6: In the REPL, evaluate the types and values of z, o, t
-- and r, as well as your own values. (E.g., ":t o" will report the
-- type of o, and "o" will report its value (along with its type). Be
-- sure you understand the answers. In particular be sure you
-- understand how the variable expression, "r" is evaluated! Yup: r is
-- unfolded to S t; t is unfolded to S (S O); so the whole expression
-- unfolds to S (S (S O)). Be able to explain this evaluation process
-- verbally and in writing. Teach and test each other.

{-
The rest of this file contains functions operating on nats.
-}

||| returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero _ = false

-- HOMEWORK #7 Bind x to the result of applying isZero to r. Add your
-- code below this comment.

x: bool
x = isZero r

||| returns the successor of any given nat
succ: nat -> nat
succ n = S n

-- HOMEWORK #8 Bind y to the result of applying succ to O. Add code here.

y: nat
y = (succ O)

||| returns the predecessor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n

{- Next we define a function that when given a natural number returns
true if it's even and false otherwise. It is very, very important to
understand this example, your first example of a recursive function -}

||| return true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

||| return false if the argument is even otherwise true
||| i.e., return true if it's odd and false if it's even
oddb: nat -> bool
oddb n = not (evenb n)


-- HOMEWORK #9 Bind a, b, c, d, e respectively to the results of
-- applying evenb to O, (S O), (S (S O)) r, and (S r),
-- respectively. Add your code here.

a: bool
a = evenb O

b: bool
b = evenb (S O)

c: bool
c = evenb (S (S O))

d: bool
d = evenb (S r)

--HOMEWORK #10 In English, describe all of the steps involved in
--evaluating the function application expression, evenb (S r). You
--must be able to explain this process to yourself and your friends!
--The idea is that you keep on applying reduction (simplification)
--rules until you get to a value that cannot be reduced further. Write
--your answer by filling in the following block comment.

{-
First the expression (S r) is evaluated, then evenb is applied to the
Boolean result of that process. To evaluate (S r) first r is evaluated,
then S is applied to the nat result to produce a new nat. r is evaluated
by unfolding it to (S t) and by then evaluating that expressions. (S t)
is evaluated by first evaluating t and then applying S to the result to
produce a nat. The final part of this answer is that t is evaluated by
unfolding it to (S (S O)), evaluating this expression, and returning the
result, which is just the term (S (S O)).
-}

-- HOMEWORK #11 Here's a function that takes a pair of natural numbers
-- (values of type nat) and that returns their sum (as another value
-- of type nat). We give you the function name and type along with the
-- left hand sides of the two rules that you'll need. We've filled in
-- the right hand sides with placeholders. Your task is to replace the
-- right hand sides of the two rules.

-- Here are a few examples of how this function should work, to get
-- you going. We use ==> to mean "reduces to" or "returns"

-- addp (mkPair O O) ==> O
-- addp (mkPair O (S (S O))) ==> S (S O)
-- addp (mkPair (S O) O) ==> S O
-- addp (mkPair (S (S O)) (S (S (S O)))) ==> S (S (S (S (S O))))

-- Completing the first rule should be pretty easy. Just think about
-- the most basic properties of arithmetic. The second rule is more
-- challenging. Go back and study the evenb example. Notice how we
-- used evenb within its own definition! The idea is that we can
-- compute evenb for a big number by returning the result that we get
-- when we apply it to a number that is two less than the number that
-- we started with. You're going to use a similar idea here.

-- This is the hardest but also the most important problem in this
  -- problem set. There is *no grading penalty* for not getting an
  -- answer to this problem. There is no grading reward for getting
  -- it. Really: do *not* collaborate on this problem. It will help
  -- us instructors to see how you do.

||| given a pair of natural numbers, return its sum
addp: pair nat nat -> nat
addp (mkPair O m) = m
addp (mkPair (S n) m) = S (addp (mkPair n m))

{-
The first rule represents, in Idris, the arithmetic rule that zero
plus any value is just that value. The second rule represents, in Idris,
the arithmetic rule that the sum of (1 + n) + m = 1 + (n + m). Why these
two rules? The answer is that, together, they define a recursive function
for computing sums. The function is total because it covers both possible
cases for n (it's either O or the successor of some one-smaller nat) and
m matches any possible nat, so the rules cover all possible pairs of nats.

The real trick to understanding such a recursive function definition is
to understand how the application of this function to an argument will be
evaluated. In particular, the argument will match with one of the two
rules. If it matches the first rule, then the answer is returned, and
it is obviously correct. If the argument matches the second rule, then
(and here's the key) the result that is returned is the result obtained
by *evaluating* the right hand side of the rule, in the context of the
bindings of m and n to values. The evaluation of the right hand side
will in turn apply addp again. This *recursion* will stop only when the
*base case* is reached. It is guaranteed that the base case will be
reached because the first element of the pair passed to addp on each
recursive application of addp is "one smaller," and one can reduce a
nat by one only a finite number of times (because of the way in which
inductive types are defined!)

One can actually now prove that this definition of addition has all of
the usual properties of addition, such as commutativity, associativity,
and so forth; but we won't try to do any such proofs in this class!
-}

-- HOMEWORK #12 -- Use the REPL to verify that these tests return the
-- expected results

-- Yup, it works!

||| a test, expecting O
h1: nat
h1 = addp (mkPair O O)

||| a test, expecting S (S O)
h2: nat
h2 = addp (mkPair O (S (S O)))

||| a test, expecting (S O)
h3: nat
h3 = addp (mkPair (S O) O)

||| a test, expecting (S (S (S (S (S O)))))
h4: nat
h4 = addp (mkPair (S (S O)) (S (S (S O))))
