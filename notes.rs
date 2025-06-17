//       :::::::::  :::    :::  :::::::: :::::::::::
//      :+:    :+: :+:    :+: :+:    :+:    :+:
//     +:+    +:+ +:+    +:+ +:+           +:+
//    +#++:++#:  +#+    +:+ +#++:++#++    +#+
//   +#+    +#+ +#+    +#+        +#+    +#+
//  #+#    #+# #+#    #+# #+#    #+#    #+#
// ###    ###  ########   ########     ###


////-- THE BASICS --////

// this is a comment, which is apparently the idiomatically preferred sort

/* this is a
   multiline comment, which is also allowed */

/// This is a documentation comment, with three slashes. They support _Markdown_
/// (CommonMark) notation. They should be placed just before the item they
/// document. `rustdoc` is used to generate HTML files from these comments.
/// More info here: https://doc.rust-lang.org/rustdoc/what-is-rustdoc.html
/// How (and whether) you document things like function arguments is basically
/// up to you, but this is conventional:
/// * `arg_name` - Description of the argument

// defining variables
let x: i8 = 12;        // this value is immutable (and type-annotated)
let mut y = 14;        // this value is mutable and can be reassigned
y = 16;                // like so
const ZEE: i32 = 160;  // this value is an immutable compile-time constant
// constants are special in that they can be declared
// globally, their types must always be annotated, and
// they can't depend on values not known at compile time

// variables can be shadowed even in the same scope
let x = 12;
let x = x + 2;  // 14
{
    let x = x * 2;  // 28
}
// back out here, value of x is once again 14
// the types of variables can also be changed when shadowing, which is not true
// when using regular assignment. although why would you?

// numeric literals come in a few forms:
let dec  = 42_069;
let hex  = 0xff0055;
let oct  = 0o77;
let bin  = 0b1011_0100;
let byte = b'L';  // only available for u8; not the same as a char

// literals can be suffixed with their types
let unsigned_int64 = 95u64;

// printing is done with a macro, which looks like a function call, but ends
// with an exclamation mark. more on macros will come later, but for now:
println!("The number twelve can be written as {}.", 12);
let number = 32;
println!("Thirty-two, on the other hand, would be {number}.");



////-- MATH --////

// basic math syntax
12 + 12;
12 - 6;
12 * 2;
12 / 5;      // truncates
12.0 / 5.0;  // does not
12 % 5;

// when integer overflows happen in a dev build it causes a PANIC, crashing the
// whole programs. in release builds, it just overflows like it would in C. but
// this is bad to rely on; instead, there is a collection of math methods for
// various behaviors desired upon overflow
wrapping_add()     // wraps around to the other end of the range
checked_div()      // returns None on overflow
overflowing_mul()  // wraps + returns a bool indicating whether it overflowed
saturating_sub()   // returns value at either end of range rather than overflow
// even more integer methods can be found here:
// https://doc.rust-lang.org/std/primitive.u32.html



////-- STATEMENTS AND EXPRESSIONS --////

// another thing to remember is what statements and expressions are. they're
// basically the same thing as in every language. expressions return a value,
// statements do not. this is a statement:
let a = 1;
// that's right baby, no return value for an assignment. hell yeah
// this is a statement that assigns an expression's return value to a variable:
let b = {
    let c = 12;
    c + 12
};
// the expression contains other interesting stuff as well, for that's allowed.
// in such an expression, the final expression within is its return value.
// calling a function or a macro is an expression

// a strange idiosyncracy of all this is that adding a semicolon to the end of
// an expression makes it a statement, which then does not return the value
// this expression returns nothing, for it only contains a statement:
{
    12 + 8;
}



////-- FUNCTIONS --////

// familiarly, a main function is required for a program to run
fn main() {
    println!("hehe");
}

// and thank GOD by the way the Rust convention is in fact snake_case
fn do_something() {
    another_function_being_called(8, 16);
}
// the order of function declarations doesn't matter; function declared earlier
// in the file can call this one. as long as it's in scope, you're good. kind of
// like JavaScript's hoisting I guess
fn another_function_being_called(x: i32, y: i32) {
    // ...
}

// functions will return the value of the final expression within, given, as
// implied before, that there is no semicolon after that expression
fn add_five(n: i32) -> i32 {
    n + 5  // returns this value
}
// if no return type is specified, like in the earlier examples, this represents
// a void (or "unit"; see #TUPLES) return type

// you can also return something manually of course, which... is a statement
fn add_ten(n: i32) -> i32 {
    return n + 10;
}



////-- DATA TYPES --////

// data types are thankfully consistent in all environments

// for integers we got i8, i16, i32, i64, i128, and finally isize, which is
// either 32 or 64 depending on your arch. there are unsigned analogues for each
// type: u8, u16, u32, u64, u128, and usize. the default for literals is i32

// for floats, just f32 and f64, the latter of which is the default

// bool, predictable, true or false

// char on the other hand is special. char isa unicode scalar value. apparently
// (always?) four bytes. more later on char/string types in general

// all primitive types are defined in the standard library:
// https://doc.rust-lang.org/std/index.html



////-- TUPLES --////

// tuples, like in other languages, are sequential collections of values that
// may be of different types. the tuple itself, however, has a single type: a
// tuple type comprised of the types of each value

let tup: (i32, f64, u8) = (200, 6.9, 4);

// a tuple's type can be inferred:
let tup = (200, 2.9, 4);  // of type (i32, f64, i32)
// and you can use pattern matching to extract individual values
let (a, b, c) = tup;
// or access elements by index
let two_hundred = tup.0;  // == 200
// mutables tuples can be modified in the way you'd expect
tup.1 = 5.8;  // tup == (200, 5.8, 4)

// a tuple with no elements is a "unit". it is both a value and a type, in both
// cases written as `()`. expressions that don't return another value implicitly
// return the unit value. the unit type is the equivalent of void in C



////-- ARRAYS --////

// arrays are like C arrays; all one type, fixed-length. syntax is reasonably
// familiar to other languages, although the type specification is a bit new
let a = [1, 2, 3];
let b: [i32; 5] = [5, 4, 3, 2, 1];
// you can initialize all entries with a syntax similar to the type spec
let c = [0.4; 5]  // == [0.4, 0.4, 0.4, 0.4, 0.4]

// access and assignment is as expected
a[2];  // == 3
b[1] = 12;  // b == [5, 12, 3, 2, 1]

// if you attempt to access an index that is not within the bounds of the array,
// Rust panics; i.e., crashes at runtime



////-- VECTORS --////

// vectors are variable-length collections, still single-type though. they are
// allocated on the heap, rather than the stack, as arrays are
// creating a new empty vector:
let v: Vec<i32> = Vec::new();
// this uses a generic in the type (the angle brackets), which will be covered
// in detail in a later section

// a macro is available for conveniently creating a vector with some values
let v = vec![1, 2, 3];

// you can add values to one with .push, so long as it's mutable
let mut v = Vec::new();
v.push(4);  // v == vec![4]
// note the lack of type annotation there. Rust can infer it even from later
// lines. very interesting...

// access can be achieved with indexing syntax
let v = vec![1, 2, 3];
let two = v&[1];  // == 2
// if you attempt to access an element that doesn't exist, the program panics.
// more on that & symbol later. the safer alternative is .get, which returns an
// Option (more on that later also)
let three: Option<&i32> = v.get(2);
match three {
    Some(three) => println!("Third element: {three}"),
    None => println!("No third element!"),
}



////-- CONTROL FLOW --////

// the most basic type: if expressions. that's right, EXPRESSIONS
let x = 12;
if x > 5 {
    // do something
} else if x <= 3 {
    // do something different
} else {
    // do something in the final case
}
// non-boolean-returning conditions will fail to compile. no coercion
// as mentioned, it's an expression, so you can do stuff like this:
let y = if true { 2 } else { 4 };

// Rust has three types of loop expressions: loop, while, and for
// loop is basically `while true { ... }`. just loops forever or until a break
loop {
    println!("hahahaha. again!");
}
// break and continue work as you would expect them to

// loop is sometimes used for retrying code that may fail, like checking the
// results of a thread. to this end, break will return its value, like return
let mut counter = 0;
let result = loop {
    counter += 1;
    if counter == 10 {
        break counter * 2;
    }
};
// result == 20

// loops can be labelled to disambiguate between which loop you're breaking from
'outer_loop: loop {
    loop {
        if breaking_on_inner_loop {
            break;
        } else if breaking_on_outer_loop {
            break 'outer_loop;
        }
    }
}

// while loops work as expected with similar syntax, including the labels
let mut i = 0;
while i < 5 {
    i += 1;
}

// and for loops are used for looping through collections
let a = [2, 4, 6, 8, 10];
for element in a {
    println!("Value: {element}");
}
// the standard library has ranges, similar to (but less flexible than) Python's
for element in (1..4) {
    // consecutively, `element == i` where i is 1 through 3; end value excluded
    // ..= for end-inclusive ranges
}


////-- OWNERSHIP --////

// Rust's ownership feature is how it gets its memory safety and avoids
// requiring garbage collection. it is a vital concept to understand when
// writing Rust code

// I already understand the basics of how memory works, so I'm not going to
// cover that here!! just read that chapter of the book again if needed:
// https://rust-book.cs.brown.edu/ch04-01-what-is-ownership.html

// one important detail I will note is that assigning variables copies the value
// of the assigned variable into the memory slot for the new one. this may seem
// obvious, and might even be true of C idk, but it's good to remember given
// that I spend most of my time with JS, Ruby, Python, etc. see this example:
let a = [0; 1_000_000];
let b = a;
// this gives us two separate copies of the array, using memory for all 2
// million elements in the array!!

// so, to let us pass data around without copying all of the memory for the
// values, Rust, like C, has pointers. instead of malloc (et. al.), Rust
// provides the Box construct, which allocates data on the heap
let a = Box::new([0; 1_000_000]);
let b = a;
// this will only allocate the array once. the value of a, itself, is a pointer
// to that data, and so is b. furthermore, after assignment to b, the value is
// no longer accessible from a, because it has been _moved_... hmmm...

// Rust doesn't allow you to manually free heap memory like C does. instead, a
// heap allocation is freed automatically when its "owner" is freed from the
// stack. in the previous example, ownership of the Box was transferred to b
// upon its assignment. to maintain safety, data can not be accessed from a
// variable that does not own it

// operations that require resizing a heap allocation will allocate an entirely
// new block of memory for the new size and free the old one, which helps to
// understand this rule preventing you from accessing "moved" data. assignment
// within a function moves ownership, as previously established, but so does
// passing a variable into a function call. the return value of the function
// will in turn be moved to wherever it's assigned in the caller

// this more involved example from the book illustrates this behavior
fn main() {
    let first = String::from("Ferris");
    let full = add_suffix(first);
    println!("{full}");
}

fn add_suffix(mut name: String) -> String {
    name.push_str(" Jr.");
    name
}
// at the end of main, first is no longer accessible, as ownership was passed to
// the add_suffix function. add_suffix allocates a new block of heap memory with
// the original "Ferris" concatenated with " Jr.", and returns it, moving
// that ownership back to main, where it's assigned to full. the original block
// of memory is freed at the end of add_suffix, and it would cause UB to attempt
// access after that point in execution

// sometimes you need to keep the original value around too, and .clone will
// allow you to do that. note, however, that it will create a whole new copy of
// the cloned data!
let a = String::from("Fox");
let a_clone = a.clone();
// a_clone can now be moved to another variable/function while preserving our
// access to a. String is another heap type, like Box, Vec, and others



////-- BORROWING --////

// another important concept in Rust memory management, borrowing allows us to
// pass values around without moving ownership. a reference, denoted with an
// ampersand, is a non-owning pointer. without ownership, the memory it points
// to will not be freed when the stack frame containing it is freed, allowing us
// to continue to access it from the prior owner

// a similar example to the longer one from OWNERSHIP, using references:
fn main() {
    let first = String::from("Ferris");
    say_hi(&first);
    println!("{first}");  // still accessible here!
}

fn say_hi(name: &String) {
    println!("hi, {}!", name);
}
// as you can see, in the called function, the ampersand is added to the type,
// indicating that it accepts a reference to a String. in the caller, the
// ampersand is instead on the variable name, since we're getting the reference
// from the variable

// references are themselves pointers to the referenced object; in that example,
// name is a pointer to first from the main function, which in turn is a pointer
// to the heap allocation with the string. in a simpler example, the reference
// would be a pointer to the actual value
fn main() {
    let x = 12;
    let a = &x;  // pointer to the value of x; 12

    let bx = Box::new(12);  // pointer to 12
    let ax = &x;  // pointer to pointer to 12
}

// dereferencing is also pretty familiar
let x = Box::new(12);
let x_abs_explicit = i32::abs(*x)  // explicitly dereferencing x, which gets the value within: 12
let x_abs_implicit = x.abs()  // implicitly dereferencing x with call using dot operator; also 12
let y = &x;  // get a reference to x
let y_abs_implicit = x.abs()  // implicitly dereferencing _twice_ with call using dot operator; still 12!
// the book promises to discuss this more later but it's not clear when from the
// headings so we'll see I guess. I know this dot operator bit has some relation
// to implementations of methods for types...?

// a "place", as the book calls it, is anything that can go on the left hand
// side of an assignment; field access for tuples and structs, array index
// access, dereferences, regular variables, and any combination of these

// a place, at any given time, has three categories of permissions: read, write,
// and own. the meanings of these should be pretty obvious at this point, but
// for clarity, the own permission determines whether the data can be moved or
// dropped.

// the "borrow checker" is part of the compiler, responsible for ensuring that
// the code doesn't violate these access rules

// references can be mutable, which is made part of its type
let mut v = vec![1, 2, 3];
let num: &mut i32 = &mut v[2];
// num itself is not mutable, but you can mutably access the referenced data
*num += 1;  // v == [1, 2, 4]
