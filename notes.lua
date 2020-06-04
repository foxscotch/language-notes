--[[
.---.
|   |
|   |
|   |
|   |               __
|   |   _    _   .:--.'.
|   |  | '  / | / |   \ |
|   | .' | .' | `" __ | |
|   | /  | /  |  .'.''| |
'---'|   `'.  | / /   | |_
     '   .'|  '/\ \._,\ '/
      `-'  `--'  `--'  `"
]]

-- This is a single-line comment.

-- printing to console
print('hi') -- naturally, prints "hi" to the console

-- defining variables
x = 12
print(x)    -- prints "12"

-- you can also declare multiple variables at once
a, b, c = "1, 2, 3"
-- now variables a, b, and c, are all equal to "1, 2, 3"

-- and declare them similarly, but with different values for each
a, b, c = 1, 2, 3
-- now a equals 1, b equals 2, and c equals 3

-- logical comparison operators
-- ==       equal to
-- ~=       not equal to. THIS IS IMPORTANT BECAUSE IT IS WEIRD AND DIFFERENT. PLS PAY ATTENTION TO THIS AND DO NOT FORGET
-- <, >     less than, greater than
-- <=, >=   less than or equal to, greater than or equal to

-- boolean operators
-- not      self-explanatory    (e.g. not True is False)
-- and      "              "    (e.g. True and True is True)
-- or       "              "    (e.g. True or False is True)

-- some more operators
-- ..       string concatenation
-- #        used to get the lengths of tables and strings

-- note that there is nothing like, for example, x += 2. you MUST use x = x + 2 instead
-- a = b = "Hi" will also not work, use a, b = "Hi" instead

-- if/elseif/else
cats = 3
if cats == 1 then
    print("Yep, there's a cat.")
elseif cats == 2 then
    print("There are two cats!")
else
    print("Wow! So many cats!")
end

-- while loop
x = 0
while x < 10 do
    x = x + 2
    print(x)
end
-- prints "2", then "4", then "6", "8", "10"

-- repeat loop (similar to do-while in other languages)
i = 5
repeat
  i = i - 1
  print(i)
until i == 1

-- NUMERIC for loop
x = 1
for i = 1, 11, 2 do
  x = x * i
  print(x)
end

-- GENERIC for loop; see line 133

-- like in python, you can use "break" to end a loop before it normally would; however there is no "continue"

-- functions
function rofl()
    print('rolling on the floor laughing')
end
rofl()  -- prints "rolling on the floor laughing"

-- local variables must be specifically local, also, YOU CAN RETURN MORE THAN ONE VALUE omg
function addThenMultiply(x, y)
    local addResult = 0
    local multResult = 0
    addResult = x + y
    multResult = x * y
    return addResult, multResult
end
a, b = addThenMultiply(1, 2)
-- a equals 3, b equals 2

-- using default arguments
function func(x, y, z)
  y = y or 0
  z = z or 1
end
-- now, when called, if no arguments are used for y or z, they will default to 0 and 1, respectively

-- you can also use a varying number of arguments
function sum(...)
  local ret = 0
  for i, v in ipairs{...} do ret = ret + v end
  return ret
end
sum(3, 4, 5, 6) -- 18

-- tables: the only data structure in lua
x = 5
a = {} -- empty table
b = { key = x, anotherKey = 10 } -- strings as keys
c = { [x] = b, ["string"] = 10, [34] = 10, [b] = x } -- variables and literals as keys

-- table assignment (using same tables)
a[1] = 20
a["foo"] = 50
a[x] = "bar"

-- table retrieval (using same tables)
print(a["foo"])
print(b["key"])     -- 5
print(c["string"])  -- 10
print(c[34])        -- 10
print(c[b])         -- 5

-- syntax for tables using dots
t = { foo = 1, bar = 2 }
print(t.foo) -- 1
t.bar = 3

-- you can also use tables like normal arrays
lol = {"hi", "hello", "hey"}
print(lol[2])   -- note that the dot syntax can not be used here; prints "hello"
print(#lol)     -- just showing off that # operator real quick; prints "3"
-- ALSO NOTE THAT THE INDICES START AT 1, NOT 0. very important

-- a very useful feature, you can put functions inside tables. there are two ways
t = {}
-- normal way:
function t.func(self, x, y)
  self.x = x
  self.y = y
end
t.func(t, 1, 1)
-- better way:
function t:func(x, y)
  self.x = x
  self.y = y
end
t:func(1, 1)

-- METATABLES. a table can have a "metatable" with certain items in them; these items will define special aspects of the original table
t = {}              -- our normal table
mt = {}             -- our metatable, which contains nothing right now
setmetatable(t, mt) -- sets mt to be t's metatable
getmetatable(t)     -- this will return mt

-- you can also use this instead:
t = setmetatable({}, {})
-- presuambly this works because setmetatable() returns t

-- GENERIC for loop (this one will loop through objects)
a = {5, 4, x = 3, 2, 1}

-- using pairs() which... does stuff. idk what exactly. but it's necessary
for key, val in pairs(a) do
  print(key, val)
end
-- this one will print this:
-- 1    5
-- 2    4
-- 4    2
-- 5    1
-- x    3   (take notice of the fact that this is last despite being third in the real table)

-- using ipairs() which is only for things with indices. it will ignore keys
for ind, val in ipairs(a) do
  print(ind, val)
end
-- this one prints this:
-- 1    5
-- 2    4
-- 4    2
-- 5    1   (take notice of the fact that the one with the key, x, is completely ignored)

-- some more detailed information about strings
s = "foo\nbar"              -- escaping "n" for a new line
t = 'he said "hello world"' -- using double quotes inside single ones will make the double ones part of the string
u = "Hello \"world\""       -- escaping the double quotes instead
v = [[
<html>
  <body>
    <p>Hello world!</p>
  </body>
</html>
]]              -- this last one is for multi-line strings

-- loading other lua files
-- this is useful for libraries because it basically treats a lua file as a function
-- it even goes as far as being able to return a value with a file!


-------------------------
--                     --
-- --    MODULES    -- --
--                     --
-------------------------

-- It's worth noting that you don't have to use any commands to include a standard library module; they're already accessible.


------------------------------
-- --  The table Module  -- --
------------------------------

-- This module adds some nice functions for use with tables.

t = { 24, 25, 8, 13, 1, 40 }
table.insert(t, 50)     -- inserts 50 at end
table.insert(t, 3, 89)  -- inserts 89 at index 3
table.remove(t, 2)      -- removes item at index 2
table.sort(t)           -- sorts via the < operator

-------------------------------
-- --  The string Module  -- --
-------------------------------

-- Adds some helpful functions for strings.

string.lower("HeLLO") -- hello
string.upper("Hello") -- HELLO
string.reverse("world") -- dlrow
string.char(87) -- W
string.sub("hello world", 2, 5) -- ello

-- something about string patterns? the tutorial I'm using doesn't really cover this
-- I probably won't need it for LÖVE, but go here, I guess: http://www.lua.org/manual/5.1/manual.html#5.4.1
string.gsub("hello 42", "(%d+)", "%1 3") -- hello 42 3
string.gsub("heLLo", "(%u)", "") -- heo
-- 4 + 4 = 8
string.gsub("2 + 2 = 4", "(%d)", function(s)
  return s * 2
end)
-- prints each word
for w in string.gmatch("good morning chaps", "%w+") do
  print(w)
end

-----------------------------
-- --  The math Module  -- --
-----------------------------

--[[
The math module contains many of the mathematical functions you would expect from a language such as math.sin, math.cos, math.floor, etc.
There's a few things you'll want to be aware of:

math.huge is the largest value a number can be.
Although math.floor and math.ceil are present, there's no math.round.
Not to worry though, you can easily achieve the same thing with code like math.floor(x + .5).
You can use math.random to generate pseudo-random numbers.
Before using it, it's a good idea to set the seed with math.randomseed.
A common thing to do is math.randomseed(os.time()).
]]
