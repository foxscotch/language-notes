//  _______ _       _______ _______ _______
// (_______|_)     (_______|_______|_______)
//  _   ___ _       _____   _______ _  _  _
// | | (_  | |     |  ___) |  ___  | ||_|| |
// | |___) | |_____| |_____| |   | | |   | |
//  \_____/|_______)_______)_|   |_|_|   |_|

// language overview: https://tour.gleam.run/everything/
// standard library docs: https://hexdocs.pm/gleam_stdlib/

// quick note: Gleam can be compiled for the Erlang VM (BEAM) or to JavaScript.
// this can affect some things, so when necessary, I'll note any differences.
// the standard library is fully supported on BEAM (Erlang/OTP 26+) and JS (all
// major platforms; browsers, Node, Deno, and Bun)


// |==-- THE BASICS --==|

// this is a comment. no multi-line, it seems
/// this is a doc comment
//// this is a doc comment for a module, so it would normally be up top!

// assignment to variables uses the let keyword, constants uses const
// p.s. variable AND CONSTANT and function naming is snake_case
let thing_that_will_change = "hehe"
const lowest_positive_whole_number = 1
// a variable can be reassigned
let x = 5
let x = x + 2  // x == 7
// unused variables warn, can be marked deliberate with an underscore prefix
let _never_used = "ok"
// types are inferred, but can also be explicitly annotated if desired
let thing: Int = 15

// type names are PascalCased
type UserId = Int
// btw this is effectively an alias, not a fully distinct type. which is nice

// functions. implicitly returns final expression, like blocks, discussed later.
// the types could be inferred, but it's best to annotate them explicitly
fn multiply(a: Int, b: Int) -> Int {
  a * b
}
// more on functions later

// code is organized into modules, one module per file, imported like so:
import something/x  // imports a file named x.gleam in a folder named something, accessible via the name "x"
import gleam/string as text  // renaming an import
import gleam/io.{println}  // unqualified import; not preferred, but could be useful sometimes. maybe. lol
// for convenience I will be leaving import statements out of future examples

// if a module exports a _type_, either use it qualified, or use a type keyword
// apparently more common than other unqualified imports, for some reason?
import gleam/string_tree.{type StringTree}

// module exports can be achieved with the pub keyword (but not with variables)
pub import something/x  // re-exports x
pub type Whatever = SomethingElse
pub const magic_number = 5189163
pub fn main() {}

// basic I/O:
io.println("hi!")  // only accepts a string
echo 12  // similar, but used for debug; accepts a value of any type

// lastly, Gleam has a few more keywords that crash the program
todo  // used to signal that a piece of code is unfinished; crashes if reached
panic  // signals that a given place in the code should never be reached; also crashes
assert True  // crashes if the provided boolean value is False, intended for testing
let assert [first, ..] = list  // crashes if the pattern doesn't match
// each of these can accept an "as" clause at the end of the expression, e.g.:
todo as "not finished yet!"
let assert Ok(n) = some_value as "this should never be an error"


// |==-- OPERATORS --==|

// equality operators are type safe (same type on both sides) and check for
// structural equivalence, _not_ identity
15 == 15  // True
15 != 15  // False

// boolean operators
True && False  // False
True || False  // True
True && False && True  // False; short-circuits
!True  // False

// number stuff is mostly normal
1 + 1 == 2
5 - 1 == 4
5 / 2 == 2  // truncated!
3 * 3 == 9
5 % 2 == 1
2 > 1 == True
2 < 1 == False
2 >= 1 == True
2 <= 1 == False

// except that floats have their own operators; no overloading
1.0 +. 1.5 == 2.5
5.0 -. 1.5 == 3.5
5.0 /. 2.5 == 2.0
3.0 *. 3.5 == 10.5
2.2 >. 1.3 == True
2.2 <. 1.3 == False
2.2 >=. 1.3 == True
2.2 <=. 1.3 == False

// also division by zero results in zero, no errors, no NaN
5 / 0 == 0

// strings concatenated with <>
"hello " <> "world"


// |==-- BUILT IN TYPES --==|

// furthermore, there's no null*, no implicit conversions, and no exceptions
// and type checking is always performed in full

Int  // whole numbers; arbitrary size int on BEAM, built-in Number on JS
// literals: 15, 1_500_000, 0b0011, 0o12, 0xFF

Float  // floating-point numbers; represented as a double
// literals: 12.0, 89.65, 5.2e4, 2.3e-6
// platform-specific behavior is retained: on BEAM, overflow will raise an
// error, and in JS, it will return (-)Infinity instead

String  // always UTF-8, can span multiple lines
// literals: "gatita 🐈", "\u{1F408}\u{200D}\u{2B1B}"
//   "SELECT * FROM users
//    WHERE id = 1;"
// other escape sequences are as you'd expect

Bool  // boolean..
// literals: True, False (exhaustive this time)

List  // lists! homogenous, immutable, singly-linked lists
// literals: [1, 2, 3]
// the cons operator .. can be used to prepend an element to a list
let letters: List(String) = ["b", "c", "d"]
["a", ..letters]  // ["a", "b", "c", "d"]
// adding items in the middle or at the end is expensive and discouraged

Tuple  // tuples! heterogenous, immutable... structs? how are tuples implemented?
// literals: #(1, 2.2, "three")
// tuple types match their values; the above example is a #(Int, Float, String)
let tup = #("x", "y", "z")
tup.0  // "x"
let #(a, b, _) = tup  // can be used in variable binding: a == "x", b == "y"

Nil  // slightly lied earlier; null exists as Nil, Gleam's unit type
// Nil is not a valid value of any other type, so the other types are therefore
// non-nullable, which is nice

// bit arrays... not gonna write a whole lot about them here, check the docs:
// https://tour.gleam.run/everything/#data-types-bit-arrays
// https://www.erlang.org/doc/programming_examples/bit_syntax.html
// but I WILL note that they are apparently not well-supported in JS currently

Result  // like in Rust, used in place of exceptions
// two variants: Ok(value) and Error(err)

// see the HexDocs for information on other data structures you might want to
// use. note, however, that the nature of Gleam and the underlying BEAM types
// they are comprised of can mean that the performance characteristics are not
// what you might expect from similar structures in other languages
// dict: https://hexdocs.pm/gleam_stdlib/gleam/dict.html
// set: https://hexdocs.pm/gleam_stdlib/gleam/set.html


// |==-- CUSTOM TYPES --==|

// custom types can be defined, they're are like Rust enums or something
type Individual {
  Person(name: String, age: Int)  // record variant of Person with some fields
  Nobody  // empty variant
}
let fox = Person("Fox", 841985)  // record variant instance; labels optional like with functions
fox.name  // "Fox"

// it's conventional to use single-variant types as structs, or... well, records
type Property {
  Property(address: String, city: String, state: String, zip: String)
}

// types can be generic
type Option(a) {  // Option implementation from gleam/option
  Some(a)
  None
}

// records are immutable, of course, but there's an "update" syntax for creating
// a new copy with some values taken from another
let fox_but_young = Person(..fox, age: 7)

// an _opaque_ type is one that can not be constructed directly within other
// modules. instead, a function in the defining module can be used to get an
// instance. notably, the types themselves can still be used externally!
pub opaque type PositiveInt {
  PositiveInt(value: Int)
}
pub fn new(i: Int) -> PositiveInt {
  case i > 0 {
    True -> PositiveInt(i)
    False -> PositiveInt(0)
  }
}


// |==-- CONTROL FLOW --==|

// blocks aren't really control flow but we're putting them here anyway. they're
// expressions! great! the final expression contained within is the return value
let sum = {
  let a = 3
  a + 5
}  // sum == 8; a is no longer in scope
// they... don't have parentheses, and instead suggest using blocks for that
{ 5 + 5 } * 10  // == 100
// kind of weird but it doesn't seem bad so whatever I guess

// case expressions are used for pattern matching
case 1 {
  0 -> "nada"
  1 -> "uno"
  _ -> "something else"
}  // "uno"

// cases can bind to variables to be used within the matched clause
case 2 {
  1 -> "one"
  anything_else -> int.to_string(anything_else)  // anything_else == 2
}  // "2"

// strings can do some interesting stuff in cases
case "hello freak" {
  "hello " <> designee -> designee  // will match any string starting with "hello "
  _ -> ""
} // "freak"

// lists too, in combination with the cons operator
case [1, 2, 3] {
  [] -> "empty!"
  [i] -> "single length list containing " <> int.to_string(i)
  [_, _, ..etc] -> "list of at least two elements"  // etc == [3]
  _ -> "anything else"
}  // "list of at least two elements"

// guards can be used to check the _value_ of a value, rather than the structure
// unfortunately, the guard can't contain function calls, other cases, or blocks
case 3 {
  0 -> "zero"
  i if i <= 4 -> "between 1 and 4 inclusive"
  _ -> "5 or greater"
}  // "between 1 and 4 inclusive"

// a case can have multiple subjects
case 1, 2 {
  0, 0 -> "both numbers zero"
  0, _ -> "first number zero"
  _, 0 -> "second number zero"
  a, _ -> "neither zero; first number == " <> int.to_string(a)
}

// and a pattern can have alternates
case 3 {
  2 | 4 | 6 -> "even"
  1 | 3 | 5 -> "odd"
  _ -> "shrug"
}  // "odd"
// at the moment it isn't possible to have nested alternates, so e.g. no [1 | 2]

// aaand you can match on types, of course
case Ok(12) {
  Ok(v) -> "okay!"
  Error -> "uh oh"
}


// |==-- FUNCTIONS IN DEPTH --==|

// only module-level functions can be named, all others must be anonymous

// Gleam of course has proper tail calls, so take advantage. in BEAM, that's
// just how it works, but for JS compilation, it rewrites the recursive function
// as a while loop, so you can depend on "TCO" (in some manner) either way

// functions can be passed as args just how you would in many other languages
fn times_two(i) { i * 2 }
list.map([2, 4, 6], times_two)  // [4, 8, 12]
// or:
list.map([2, 4, 6], fn (i) { i * 2 } )  // [4, 8, 12]

// function captures are this sick feature that makes it easy to use higher
// order functions in fun and meaningful ways. the last example, with a capture:
fn multiply(a, b) { a * b }
list.map([2, 4, 6], multiply(_, 2))  // [4, 8, 12]

// the type of a function is expressed similarly to the actual definition
type StringFunctionThing = fn(String) -> Int

// argument types can be generic. t doesn't mean anything, it can be any name
fn get_two(thing: t) -> List(t) {
  [thing, thing]
}
get_two(5)  // [5, 5]
get_two("e")  // ["e", "e"]
// honestly I don't super love that it's gotta be lowercased, but I get it

// you can label arguments, allowing them to be passed with an optional name
// that may help keep the purpose clear at the calling site
fn do_something(some arg1, thing arg2, done done) {
  // within the function, the second name is used
  arg1 + arg2 + done
}
// outside of it, the first name is used (if desired!)
do_something(some: 5, thing: 4, done: 3)
do_something(5, 4, 3)
// the order can be changed if using the labels when calling
do_something(done: 3, thing: 4, some: 5)

// kind of similar to Python, Ruby, etc., labeled arguments must come after any
// unlabeled arguments. however, being labeled doesn't make them optional. Gleam
// has no optional arguments, nor function overloading

// also similar to them, there's a shortcut for passing labeled arguments:
let some = 5
let thing = 4
do_something(some:, thing:, done: 3)

// functions can be marked as deprecated with the @deprecated attribute
@deprecated("we don't do this anymore")
fn garbage_function() {}


// |==-- ON CALLING FUNCTIONS --==|

// to make it easier to bear the FP idiosyncracies of Gleam (affectionate), it
// provides some useful syntax that helps reduce indentation and nesting

// pipelines are common in FP languages but I don't think I've ever covered them
// in this repo. this is used to make it easier to call functions that accept
// the results of other calls in a way that looks nice
io.println(string.append(string.append("1", "2"), "3"))
// can be re-written as...
"1"
|> string.append("2")
|> string.append("3")
|> io.println  // 123

// the pipe operator applies its left operand as the first argument to the
// function on the right. the order can be affected with captures:
"1"
|> string.append("2")
|> echo  // inserting an echo like this will print the value at that point, with no other effect
|> string.append("3", _)  // 312

// furthermore, if it is not possible to pass the value as the first argument,
// that is, there are no free argument "slots" remaining, then it will instead
// call the _result_ of the method call with the value as the sole argument, as
// long as some other argument is passed to it (for some reason?)
fn thing(s: String) { fn (_s: String) { s } }
"1"
|> string.append("2")
|> string.append("3")
|> thing("hehe")  // "hehe"

// then there's use, which helps with functions that take final-arg callbacks
fn plain() {
  result.try(get_username(), fn(username) {
    result.try(get_password(), fn(password) {
      result.map(log_in(username, password), fn(greeting) {
        greeting <> ", " <> username
      })
    })
  })
}
// can be re-written as...
fn special() -> Result(String, Nil) {
  use username <- result.try(get_username())
  use password <- result.try(get_password())
  use greeting <- result.map(log_in(username, password))
  greeting <> ", " <> username
}
// it's kind of similar conceptually to await in JS, in a certain sense. when
// use is used, the rest of the containing block after the use expression is
// turned into the callback argument passed to the function call on the right.
// none of the Promise stuff though, just callbacks. on the left side is the
// list of arguments passed to the callback, bound to (a) variable(s), if any


// |==-- RANDOM OTHER STUFF --==|

// functions definitions that should refer to external, non-Gleam code can be
// annotated with the @external attribute. when this is done, the compiler uses
// the provided type information for Gleam purposes, but the compiled code will
// use the external implementation when it is actually called
@external(javascript, "./my_package_ffi.mjs", "now")
pub fn now() -> DateTime

// you can specify source locations for each platform
@external(erlang, "calendar", "local_time")
@external(javascript, "./my_package_ffi.mjs", "now")
pub fn now() -> DateTime
// cool!

// it's even possible to have both external and Gleam implementations. if the
// function is defined with a body, that will be used when building for a target
// that doesn't have a corresponding @external attribute. pretty neat
