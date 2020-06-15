{-
      ___           ___           ___           ___           ___           ___       ___ 
     /\__\         /\  \         /\  \         /\__\         /\  \         /\__\     /\__\
    /:/  /        /::\  \       /::\  \       /:/  /        /::\  \       /:/  /    /:/  /
   /:/__/        /:/\:\  \     /:/\ \  \     /:/__/        /:/\:\  \     /:/  /    /:/  / 
  /::\  \ ___   /::\~\:\  \   _\:\~\ \  \   /::\__\____   /::\~\:\  \   /:/  /    /:/  /  
 /:/\:\  /\__\ /:/\:\ \:\__\ /\ \:\ \ \__\ /:/\:::::\__\ /:/\:\ \:\__\ /:/__/    /:/__/   
 \/__\:\/:/  / \/__\:\/:/  / \:\ \:\ \/__/ \/_|:|~~|~    \:\~\:\ \/__/ \:\  \    \:\  \   
      \::/  /       \::/  /   \:\ \:\__\      |:|  |      \:\ \:\__\    \:\  \    \:\  \  
      /:/  /        /:/  /     \:\/:/  /      |:|  |       \:\ \/__/     \:\  \    \:\  \ 
     /:/  /        /:/  /       \::/  /       |:|  |        \:\__\        \:\__\    \:\__\
     \/__/         \/__/         \/__/         \|__|         \/__/         \/__/     \/__/
-}

-- Licensed under CC BY-NC-SA 3.0
-- https://creativecommons.org/licenses/by-nc-sa/3.0/
-- Some code examples come from Learn You a Haskell for Great Good - http://learnyouahaskell.com/

-- This is a single-line comment.


-- Before we really get started, I feel as if it's important to make note that
-- everything is a function, including operators. Reminiscent of Lisps, and...
-- little else. Binary operators like those used for math are "infix" functions,
-- meaning that their arguments can be found on each side of the operator. Most
-- function calls will be of the "prefix" form, however.


-- Basic math is essentially the same as everywhere else:
6 + 3         --   9
12 - 14       --  -2
20 * 12       -- 240
10 / 4        --   2.5
2 ** 8        -- 256.0   (Exponentiation returns a float)
5 + 10 * 2    --  25
(5 + 10) * 2  --  30

-- However, due to some of Haskell's weirdness, negation isn't so simple.
5 * -2    -- This causes an error! Instead, one must do this:
5 * (-2)  -- -10

-- Boolean operators are shared with JavaScript.
True && False  -- False
True || False  -- True
-- ...except for boolean negation, which is like Python's. ok.
not True  -- False

-- Comparisons are mostly normal, aside from the syntax of not-equals.
5 == 5  -- True
5 /= 4  -- True
5 > 4   -- True
5 < 6   -- True
5 >= 2  -- True
5 <= 8  -- True


 ---           ---
-- Flow control! --
 ---           ---

-- let allows you to bind variables to be visible in a single expression. Unlike
-- where, from the function section, let is itself an expression.
let x = 12 in x * 2  -- 24
let next x = x + 1 in next 12  -- 13
-- let can also be used in a list comprehension.
[y | x <- [1..5], let y = x * 2]  -- [2, 4, 6, 8, 10]

-- ifs are easy.
if 5 > 4 then 6 else 3  -- 6
-- Some extra whitespace is ok too.
if 5 < 4
    then 6
    else 3  -- 3

-- case expressions are familiar. However, it only works with pattern matching.
-- The predicates can't be expressions.
case 5 of 4 -> "four"
          5 -> "five"
          _ -> "idk"  -- "five"


 ---    ---
-- Lists! --
 ---    ---

-- All normal lists using square brackets [] are homogenous, containing values
-- of only a single type. Lists are, vitally, immutable.
[1, 2, 3, 4, 5]
-- This operator (called the "cons" operator) adds items to the front of a list.
1 : 2 : [3, 4, 5]  -- [1, 2, 3, 4, 5]
-- String literals are just syntactic sugar for lists of chars.
"hello" == ['h', 'e', 'l', 'l', 'o']  -- True
-- Two lists (including strings, of course) can be combined with ++
"hello " ++ "world"  -- "hello world"
-- The !! operator can be used to index into lists.
exList !! 1  -- 4
-- Lists can be compared if their contents can be, starting with the first
-- element. If one is greater, that list is greater. If they're equivalent, it
-- moves on to the second element, and so on.
[1, 1, 1] > [2, 2, 2]  -- False
[2, 1, 1] > [1, 5, 5]  -- True

-- 2D (or greater) lists must have consistently-typed lists as values, just as
-- the immediate contents of a list must be of the same type. For example:
[[1, 2, 3], ['a', 'b', 'c']]  -- NOT VALID

-- Now for some simple list functions.
let exList = [2, 4, 6, 8, 10]
head exList     -- 2
tail exList     -- [4, 6, 8, 10]
last exList     -- 10
init exList     -- [2, 4, 6, 8]
length exList   -- 5
null exList     -- False  (determines whether a list is empty)
reverse exList  -- [10, 8, 6, 4, 2]

-- Aaand some more complex ones:
take 3 exList   -- [2, 4, 6]  (first n elements in l, or l if n >= length l)
drop 3 exList   -- [6, 8, 10]  (essentially the opposite of take)
maximum exList  -- 10  (greatest element in a list of _comparable_ values)
minimum exList  -- 2
sum exList      -- 30
elem 6 exList   -- True  (whether the first argument is found in the second)

-- Lists also get some cool little range shortcuts.
[1..10]  -- [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
['a'..'f']  -- "abcdef"
-- They can also be defined with a step, shortening that exList to:
[2,4..10]  -- In English: first value, second value, then ..last value.
-- That is the only way to get reverse lists with this feature.
[10,9..1]
-- Haskell's lazy value calculation allows you to do interesting things like
-- get only the first n values of what would otherwise be an infinite range.
take 5 [10,20..]  -- [10, 20, 30, 40, 50]
-- There are infinite-list-generating functions that you can use that fact with.
take 7 (cycle "uw")  -- "uwuwuwu"
take 3 (repeat 7)  -- [7, 7, 7]
-- replicate serves a similar purpose as repeat, with simpler usage
replicate 3 7  -- [7, 7, 7]

-- List comprehensions are simple enough, if you ignore the strange separators,
-- which are apparently based on mathematical notation.
[x*2 | x <- [1..10]]  -- [2, 4, 6, 8..20]  (equivalent to (x*2 for x in range(10)) in Python)
-- Predicates can be used to filter the results. More than one can be used.
[x*2 | x <- [1..10], mod x 2 == 0]  -- [4, 8, 12, 16, 20]
[x | x <- [1..50], odd x, mod x 5 /= 0]  -- odd numbers from 1-50 excluding those divisible by 5
-- Multiple source lists can be used too; it will produce all combinations of
-- values from each list.
[(x, y) | x <- [1, 2], y <- [3, 4]]  -- [(1,3), (1,4), (2,3), (2,4)]


 ---     ---
-- Tuples! --
 ---     ---

-- Tuples are sequences of values that do not have to be of the same type.
-- However, two tuples constituted of different types, or even tuples that have
-- different lengths, are considered to be different types themselves.
(5, 10)
("hello", 12.4, False)
-- Pairs, specifically, have a couple of functions for retrieving each value:
fst (6, 4)  -- 6
snd (1, 3)  -- 3
-- zip works like similar functions in other languages, taking two lists and
-- returning a list of pairs, until one of the two inputs runs out.
zip [1, 2, 3] [4, 5, 6]  -- [(1, 4), (2, 5), (3, 6)]
zip "abc", [1..] -- [('a', 1), ('b', 2), ('c', 3)]


 ---        ---
-- Functions! --
 ---        ---

-- Function calls consume the function arguments first, before anything else is
-- done. If an argument needs some calculation to be done, you'll have to use
-- parentheses to group the operation into a single value.
min 9 10       -- Returns the lesser of its two arguments.
max 5 4        -- Returns the greater of its two arguments.
max 4 2 + 1    -- Essentially (max 4 2) + 1, i.e. 5
min 4 (2 + 1)  -- 3

-- You can add type annotations when calling a function where the desired return
-- type is unclear. In fact, this works as casting in general.
read "16" :: Int  -- 16
20 :: Float       -- 20.0

-- Two-arg prefix functions can be surrounded by backticks to make them infix:
12 `div` 6  -- 2

-- Defining a function is pretty simple.
timesTwo x = x * 2
timesTwo 12  -- 24
addTimesTwo x y = timesTwo (x + y)
addTimesTwo 10 5  -- 30
-- Function names can't begin with a capital letter, but they can contain '
-- You can use type annotations when inference won't cut it. The items on the
-- right side of :: are all of the arguments, in order, then the return type.
timesTwo :: Int -> Int
addTimesTwo :: Int -> Int -> Int
-- More complex example, showing some pattern matching:
test :: (Int, [Char]) -> Int -> (Int, [Char])
test (age, name) i = (age*i, name ++ " doubled")
-- Type variables are like generics, such as in this reimplementation of fst:
fst :: (a, b) -> a
fst (a, b) = a

-- Pattern matching can be used sorta like overloads to match specific inputs:
oneOrTwo :: (Integral i) => i -> String  -- that part before the => defines typeclass constraints for the argument
oneOrTwo 1 = "one"
oneOrTwo 2 = "two"
oneOrTwo i = "something else"
-- If called with the argument 1 or 2, it will return the respective string, but
-- if you call it with any other number, it returns "something else". The
-- patterns are checked in order, and will use the first one that matches.

-- Haskell is basically built for recursion.
-- Laziness means no need for tail call optimization in the first place.
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)
-- More complicated example implementation of maximum:
maximum :: (Ord a) => [a] -> a
maximum [] = error "maximum of empty list"
maximum [x] = x
maximum (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum xs

-- "As patterns" allow you to use the full object even when pattern matching:
firstLetter :: String -> String
firstLetter "" = "empty string"
firstLetter full@(s:xs) = "first letter of " ++ full ++ " is " ++ [s]

-- Guards are somewhere between a switch and pattern matching. Pattern matching
-- can also be used with guards.
howBad :: (Floating a, Ord a) => a -> a -> String
howBad spec actual
    | diff <= not    = "not bad"
    | diff <= little = "a little bad"
    | diff <= pretty = "pretty bad"
    | otherwise      = "really bad"  -- otherwise just evaluates to True
    where diff = (abs (spec - actual)) / spec
          (not, little, pretty) = (0.00, 0.10, 0.25)
howBad 100 100   -- "not bad"
howBad 100  95   -- "a little bad"
howBad 100  25   -- "really bad"

-- Recursive implementation of quicksort:
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in  smallerSorted ++ [x] ++ biggerSorted


 ---                     ---
-- Higher-Order Functions! --
 ---                     ---

-- So: In Haskell, functions can technically only accept one argument. A
-- function that appears to accept two arguments is actually a function that
-- accepts one argument and returns a function that then accepts the second.
-- This fact also means that we can partially apply functions, i.e. provide it
-- with some arguments, to allow another function to provide the other(s). With
-- infix functions specifically, you can use parens to partially apply either
-- the first or second argument, depending on where you place it.

-- A good example of this is with map/filter/reduce. The first argument is a
-- function. In an earlier example, I used (*5) for a map call. That's a
-- partially-applied function, with the second argument applied. So when map
-- finished the application using the contents of the list, it's as if it's
-- calling x*5 each time; however, from its perspective, it's just calling a
-- regular single-argument function. The order of application isn't as useful
-- there as you can imagine it might be with other functions like / or mod.

-- First I want to make note of the function application operator, which has
-- value in being low-precendence. The following expressions are equivalent.
sum (map (*2) [1..5])
sum $ map (*2) [1..5]
-- And we can do this:
map ($2) (map (*) [1..5])  -- [2, 4, 6, 8, 10]

-- Here's some simple examples of partial application.
test x y z = (x, y, z)
test 1 2 3      -- (1, 2, 3)
((test 1) 2) 3  -- (1, 2, 3)
(`test` 2) 1 3  -- (1, 2, 3)
testPartial y z = test 4
testPartial 5 6  -- (4, 5, 6)

-- Functions as arguments need parentheses when in type signatures.
runTwice :: (a -> a) -> a -> a
runTwice f v = f (f v)
runTwice (subtract 2) 12  -- 8

-- Lambda expressions can be used to define short functions inline.
filter (\x -> and [x>2, x<6]) [1..10]  -- [3, 4, 5]
foldl (\acc x -> acc + x) 0 [1..10]    -- sum [1..10]

-- Function composition lets us avoid having to use lambdas for simple chains.
-- . is defined as (f . g = \x -> f (g x))
filter (\x -> not (even x)) [1..5]  -- [1, 3, 5]  (you could just use odd, but for example's sake)
filter (not . even) [1..5]          -- [1, 3, 5]
((*2) . (+2) . (/2)) 12  -- 16.0  (((12 / 2) + 2) * 2)

-- Lists can contain functions.
manyFunctions = map (+) [1..]  -- list of partially-applied functions, equivalent to [(1+), (2+)..]
(manyFunctions !! 105) 2  -- 108  (i.e. 106 + 2)

-- Map, filter, and folds (the last otherwise known as reduce) are probably the
-- most important examples of higher-order functions.
map (*5) [1..5]  -- [5, 10, 15, 20, 25]
filter (>=3) [1..5]  -- [3, 4, 5]
foldl (/) 1 [1,2,5]  -- 0.1  (typical reduce function)
foldr (/) 1 [1,2,5]  -- 2.5  (similar, but iterates in reverse order)
-- Note for foldr: the order of the function's arguments is also reversed. The
-- accumulator value is applied second, while in foldl, it's applied first.

-- There's also foldl1 and foldr1, which use the initial list item as the
-- initial accumulator, rather than taking it as an argument.
foldl1 (+) [1..5]  -- 15
foldr1 (-) [1..5]  -- 3  (remember, the order of application is also swapped)

-- scanl/scanr are essentially the same as foldl/foldr, but the return value is
-- a list of ALL the values produced, including the initial accumulator value.
-- The last/head respectively contain what foldl/foldr would normally return.
scanl (/) 1 [1,2,5]  -- [1.0, 1.0, 0.5, 0.1]
scanr (/) 1 [1,2,5]  -- [2.5, 0.4, 5.0, 1.0]
-- Not gonna bother with examples for this but there's also scanl1/scanr1.

-- Here are some other useful higher-order functions in Haskell:
takeWhile (<5) [1..10]  -- [1, 2, 3, 4]
dropWhile (<5) [1..10]  -- [5, 6, 7, 8, 9, 10]


 ---      ---
-- Modules! --
 ---      ---

 -- Standard library modules: https://downloads.haskell.org/~ghc/latest/docs/html/libraries/
 -- Search engine for Haskell package APIs: https://hoogle.haskell.org/

-- Modules must be imported before anything else is defined. All of the defined
-- names in the module are brought into the importing file's global scope.
import Data.List
import Data.List (nub)  -- Import only nub from Data.List
import Data.List hiding (nub)  -- Import everything from Data.List except nub
import qualified Data.List  -- Import everything from Data.List, but members must be accessed like Data.List.nub
import qualified Data.List as L  -- Same as above, but you'll use L.nub for access
:m + Data.List  -- This is just for GHCi.

-- Defining modules is only a little bit strange:
module Something (
    doesSomething,
    doesAnotherThing
) where
-- Then you simply define doesSomething and doesAnotherThing like normal.
-- The name of the file should be the name of the module plus ".hs", and in
-- order to import it with "import Something" the file needs to be in the same
-- directory as the calling code.

-- Modules can also be defined heirarchically.
module Something.Test (
    testSomething,
    testAnotherThing
) where
-- Then the definitions. In this case, the filename is "./Something/Test.hs".


 ---          ---
-- Typeclasses! --
 ---          ---

-- Typeclasses are like interfaces. Here are some examples:
Eq        -- describes types that can be tested for equality
Ord       -- types that can be ordered
Show      -- types that can be converted to strings
Read      -- types that can be converted from strings.
Enum      -- sequentially ordered types, for expressions like [1..5] or succ 'D'
Bounded   -- types that have an upper and lower bound; maxBound and minBound return these bounds
Num       -- generic number typeclass, includes Int, Integer, Float, and Double
Integral  -- subset of Num that includes only Int and Integer whole numbers
Floating  -- subset of Num that includes only floating-point number types
