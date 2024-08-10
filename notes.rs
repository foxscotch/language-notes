//       :::::::::  :::    :::  :::::::: :::::::::::
//      :+:    :+: :+:    :+: :+:    :+:    :+:
//     +:+    +:+ +:+    +:+ +:+           +:+
//    +#++:++#:  +#+    +:+ +#++:++#++    +#+
//   +#+    +#+ +#+    +#+        +#+    +#+
//  #+#    #+# #+#    #+# #+#    #+#    #+#
// ###    ###  ########   ########     ###


////-- BASIC SYNTAX --////
//#region

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
// when using

// numeric literals come in a few forms:
let dec  = 42_069;
let hex  = 0xff0055;
let oct  = 0o77;
let bin  = 0b1011_0100;
let byte = b'L';  // only available for u8; not the same as a char

// literals can be suffixed with their types
let unsigned_int64 = 95u64;

//#endregion


////-- DATA TYPES --////
//#region

// data types are thankfully consistent in all environments

// for integers we got i8, i16, i32, i64, i128, and finally isize, which is
// either 32 or 64 depending on your arch. there are unsigned analogues for each
// type, too: u8, u16, u32, u64, u128, and usize. the default is i32

// for floats, just f32 and f64, the latter of which is the default

// bool, predictable, true or false

// char on the other hand is special. char isa unicode scalar value. apparently
// (always?) four bytes. more later on char/string types in general

// all primitive types are defined in the standard library:
// https://doc.rust-lang.org/std/index.html

//#endregion


////-- TUPLES --////
//#region

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

//#endregion


////-- ARRAYS --////
//#region

// arrays are like C arrays; all one type, fixed-length

//#endregion


////-- MATH --////
//#region

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

//#endregion


////-- TEMPLATE --////
//#region
//#endregion
