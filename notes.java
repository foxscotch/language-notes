/*                                                      
 *              _____        _____     _______    ______    _____         
 *             |\    \_    /      |_   \      |  |      | /      |_       
 *             \ \     \  /         \   |     /  /     /|/         \      
 *              \|      ||     /\    \  |\    \  \    |/|     /\    \     
 *               |      ||    |  |    \ \ \    \ |    | |    |  |    \    
 *       ______  |      ||     \/      \ \|     \|    | |     \/      \   
 *      /     / /      /||\      /\     \ |\         /| |\      /\     \  
 *     |      |/______/ || \_____\ \_____\| \_______/ | | \_____\ \_____\ 
 *     |\_____\      | / | |     | |     | \ |     | /  | |     | |     | 
 *     | |     |_____|/   \|_____|\|_____|  \|_____|/    \|_____|\|_____| 
 *      \|_____|                                                          
 */


// ╔════════════╗
// ║ THE BASICS ║
// ╚════════════╝


// General structure of a program:

public class Blah {
    public static void main() {
        // stuff
    }
}


// Writing to stdout

System.out.println('Hi');


// Variables

[type] [variable name] = [value];

// e.g.

int width = 640;
char grade = 'A';


// Base types

byte tinyNumber = 1;              // Very small integer. min: -128, max: 127
short smallNumber = 24;           // Small integer. min: -32,768, max: 32,767
int number = 184;                 // Integer. min: -2^31, max: 2^31 - 1
long bigNumber = 5000;            // Large integer. min: -2^63, max: 2^63 - 2
float decimal = 6.5;              // Single-precision floating-point number.
double accurateDecimal = 3.1415;  // Double-precision float.
boolean yesOrNo = true;           // True or false.
char letter = 'A';                // Single Unicode character.

// Double and single quotes are only for strings and chars, respectively.
// For more info, especially on floats, visit this page:
// https://docs.oracle.com/javase/specs/jls/se7/html/jls-4.html


// Simple math

int num = 10;
num = 10 + 2;  // num == 12
num = 10 - 4;  // num == 6
num = 10 * 5;  // num == 50
num = 10 / 3;  // When the variable is an int, division floors it. num == 3
num = 10 % 6;  // Modulo; num == 4


// Comparison operators

int red   = 255;
int green = 255;
int blue  = 153;
red == green  // == true
blue != red   // == true
red > blue    // == true
green < blue  // == false
red >= green  // == true
red <= blue   // == false


// Boolean operators

true && false  // == false
true || false  // == true
!true          // == false

// During evaluation, ! comes first, then &&, then ||


// Access control

//             | Class | Package | Subclass | World
// ————————————+———————+—————————+——————————+———————
// public      |  y    |    y    |    y     |   y
// ————————————+———————+—————————+——————————+———————
// protected   |  y    |    y    |    y     |   n
// ————————————+———————+—————————+——————————+———————
// no modifier |  y    |    y    |    n     |   n
// ————————————+———————+—————————+——————————+———————
// private     |  y    |    n    |    n     |   n
// 
// y: accessible
// n: not accessible


// ╔══════════════╗
// ║ FLOW CONTROL ║
// ╚══════════════╝


// For loop

for (int i = 0; i < 10; i++) {
    System.out.println(i);
}
// That will print 0-9.


// For each loop

// Imagine there's an array named nums: [1, 2, 3]
for (Integer currentNumber : nums) {
    System.out.println(currentNumber);
}
// Prints 1-3. A marked difference from JS, which would print the indices...


// If

if (number > 12) {
    // Do something
}
else if (number >= 6) {
    // Do something else
}
else {
    // Do yet another thing
}


// Ternary expression
// This exists in other languages, e.g. Javascript, but I've never touched it.

char testResult = (20 > 10) ? 'Y' : 'N';
// testResult == 'Y'. if 20 was less than 10, it would be 'N'


// Switch

int restaurantRating = 3;

switch (restaurantRating) {
    case 1:
        System.out.println("This restaurant is not my favorite.");
        break;
    case 2:
        System.out.println("This restaurant is good.");
        break;
    case 3:
        System.out.println("This restaurant is fantastic!");
        break;
    default:
        System.out.println("I've never dined at this restaurant.");
        break;
}


// Looping

for (int counter = 0; counter < 5; counter++) {
    System.out.println(counter);  // prints 0-4
}


// ╔═════════╗
// ║ CLASSES ║
// ╚═════════╝


class Person {
    // Here are some attributes/properties/whatever you wanna call them.
    private int age;
    private String name;
    
    // This here is the constructor.
    public Person(int personAge, String personName) {
        age = personAge;
        name = personName;
    }
    
    // A getter.
    int getAge() {
        return age;
    }
    
    // A setter.
    void setAge(newAge) {
        age = newAge;
    }
    
    String getName() {
    	return name;
    }
    void changeName(String newName) {
    	name = newName;
    }
    
    // Here's the main method. I don't get why this is how Java works, but w/e.
    public static void main(String[] args) {
        // Creates an instance of Person.
        Person jim = new Person(25, "Jim");
        System.out.println(jim.getAge());  // prints 25
    }
}


// ╔═══════════════╗
// ║ SPECIAL TYPES ║
// ╚═══════════════╝


// Every base type has a wrapper class, with some useful methods.
// byte:    Byte
// short:   Short
// int:     Integer
// long:    Long
// float:   Float
// double:  Double
// boolean: Boolean
// char:    Character


// ArrayList
import java.util.ArrayList;

ArrayList<Integer> numberArray = new ArrayList<Integer>();
// I'm not quite sure what those corner brackets are for, in general.
// I just know they determine the array type here.

numberArray.add(1);     // Appends 1 to the end of the array.
numberArray.add(3);     // etc.
numberArray.add(2);

numberArray.get(1);     // Returns the value at index 1. That is, 3.

numberArray.add(1, 4);  // Inserts 4 at index 1, moving everything else up.
numberArray.get(1);     // Returns 4.

numberArray.size();     // Returns 4, the number of items in the array.


// HashMap (dictionary)
import java.util.HashMap;

HashMap<String, Integer> peopleAges = new HashMap<String, Integer>();
// First item in the brackets is the key type, second is the value type.

peopleAges.put("Jim", 25);  // Adds the key "Jim" with a value of 25.
peopleAges.put("Kim", 23);
peopleAges.put("Tim", 21);

peopleAges.get("Kim");      // Returns 23.

peopleAges.size();          // Returns 3.


// ╔══════════╗
// ║ EXAMPLES ║
// ╚══════════╝


// Getting the contents of a web page

import java.net.*;
import java.io.*;

public class GetWebPage {
	public static void main(String[] args) throws Exception {
		URL url = new URL("http://master2.blockland.us/");
		// Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 8888));
        // ^ That commented line is to proxy the request through Fiddler.
		
		HttpURLConnection con = (HttpURLConnection) url.openConnection(/*proxy*/);
		con.setRequestProperty("User-Agent", "Test");
        // ^ That line changes the user agent so CloudFlare won't block it.
		
		System.out.println("Status code: " + con.getResponseCode());
		System.out.println("Method: " + con.getRequestMethod());
		System.out.println("Finished");
		
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inLine;
		while ((inLine = in.readLine()) != null) {
			System.out.println(inLine);
		}
		
		in.close();
	}
}


// Time some stuff

public class TimeDifference {
	public static void main(String[] args) {
		double originalTime = System.nanoTime() / 1000000000.0;
		
		// Do stuff here.
		
		double newTime = System.nanoTime() / 1000000000.0;
		double difference = newTime - originalTime;
		System.out.print(difference + " seconds");
	}
}


// Multidimensional ArrayList

public class MDArrayList {
	public static void main(String[] args) {
		ArrayList<ArrayList<Integer>> doubleList = new ArrayList<ArrayList<Integer>>();
		ArrayList<Integer> innerList1 = new ArrayList<Integer>();
		ArrayList<Integer> innerList2 = new ArrayList<Integer>();
		ArrayList<Integer> innerList3 = new ArrayList<Integer>();
		
		doubleList.add(innerList1);
		doubleList.add(innerList2);
		doubleList.add(innerList3);
		
		innerList1.add(1);
		innerList1.add(2);
		innerList1.add(3);
		
		innerList2.add(4);
		innerList2.add(5);
		innerList2.add(6);
		
		innerList3.add(7);
		innerList3.add(8);
		innerList3.add(9);
		
		System.out.println(doubleList);  // [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
	}
}


// Multidimensional plain array

public class MDArray {
	public static void main(String[] args) {
		Integer[][] doubleList = new Integer[3][3];
		
		doubleList[0][0] = 1;
		doubleList[0][1] = 2;
		doubleList[0][2] = 3;
		
		doubleList[1][0] = 4;
		doubleList[1][1] = 5;
		doubleList[1][2] = 6;
		
		doubleList[2][0] = 7;
		doubleList[2][1] = 8;
		doubleList[2][2] = 9;
		
		/* Previous code, before coming across Arrays.deepToString()

			System.out.print("[");
			for (Integer[] list : doubleList) {
				System.out.print("[");
				for (int number : list) {
					System.out.print(number + ",");
				}
				System.out.print("],");
			}
			System.out.print("]");
			
		*/
		
		System.out.println(Arrays.deepToString(doubleList));
	}
}
