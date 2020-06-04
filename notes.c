/*                      
        ,o888888o.    
       8888     `88.  
    ,8 8888       `8. 
    88 8888           
    88 8888           
    88 8888           
    88 8888           
    `8 8888       .8' 
       8888     ,88'  
        `8888888P'    
*/

// DO NOT TRY TO COMPILE THIS FILE. it would be entirely pointless to even attempt it

#include <stdio.h>  // standard I/O library precompiled header
#include <stdlib.h> // standard library, containts atoi function which turns a string that looks like an integer into an integer
#include <string.h> // adds some string functions, such as strlen
#include <ctype.h>  // adds some more string stuff, such as toupper and islower
#include <math.h>   // adds math functions like round and sin
#include <cs50.h>   // CS50-specific library that adds some functions (like GetInt, and the ability to create strings)
// I will list library dependencies for each example (big examples will simply contain the #includes)

// requires stdio
int main(void) {
	printf("hello, world\n"); // \n means newline
}

// requires stdio, cs50
int main(void) {
    printf("Give me an integer: ");
    int x = GetInt();
    printf("Give me another: ");
    int y = GetInt();
    printf("The sum of %i and %i is %i!\n", x, y, x + y); // this shows how to put variables in a print output (also, apparently it important that %i specifically is used, no other letter)
}

// if and else. requires stdio, cs50
int main(void) {
    printf("I'd like an integer, please: ");
    int x = GetInt();
    if (x > 0) {
    	printf("You picked a positive number!");
    }
    else if (x == 0) {
    	printf("You picked zero!");
    }
    else {
    	printf("You picked a negative number!\n");
    }
}

// switch
int main(void) {
	switch(n) {
		case constant1:
			//do this if n == constant1
			break;
		case constant2:
			//do this if n == constant1
			break;
		default:
			//do this if n is not equal to any of the cases
	}
}

// do while. requires stdio, cs50
int main(void) {
	do {
		printf("Pick a positive number: ");
		n = GetInt();
	}
	while(n < 1);
}

/**********MARIO**THING**********/

#include <stdio.h>
#include <cs50.h>

// gets a number between 1 and 23 from the user
int getPositiveInt(void) {
	int n;
	do {
		printf("Pick a positive number lower than 24: ");
		n = GetInt();
	}
	while(n < 1 || n > 23);
	return n;
}

// draws the pyramid
int makePyramid(int height) {
	// creates the rows
	for(int r = 0; r < height; r++){
		// makes the spaces then hashes
		for(int s = 0; s < height - r - 1; s++) {
			printf(" ");
		}
		for(int h = 0; h < r + 2; h++) {
			printf("#");
		}
		printf("\n");
	}
	return 1;
}

int main(void) {
	int x = getPositiveInt();
	makePyramid(x);
}

/**END**MARIO**/

/**********CHANGE**THING**********/

#include <stdio.h>
#include <math.h>
#include <cs50.h>

// gets from the user a positive float that is at least 0.0
float getPositiveFloat(void) {
	float n;
	do {
		printf("Pick an amount of change owed: ");
		n = GetFloat();
	}
	while (n < 0.0);
	return n;
}

// convert that positive float to an integer that represents the amount of change, rather than dollars
int convertToCents(float fl) {
	return round(fl * 100);
}

// this set of variables is for the next two functions
int quarCount = 0;
int dimeCount = 0;
int nickCount = 0;
int pennCount = 0;

// with input and conversion covered, time to count out the change
void countChange(change) {
	while (change > 24) {
		quarCount++;
		change-= 25;
	}
	while (change > 9) {
		dimeCount++;
		change-= 10;
	}
	while (change > 4) {
		nickCount++;
		change-= 5;
	}
	while (change > 0) {
		pennCount++;
		change-= 1;
	}
	int coins = quarCount + dimeCount + nickCount + pennCount;
	if (coins > 1) {
		printf("You can give the customer change with %i coins!\n", coins);
	}
	else {
		printf("You can give the customer change with only %i coin!\n", coins);
	}
}

// asks the user if they'd like more detail, and if they do, it tells them how many of each coin is actually needed
void giveDetail(void) {
	printf("Would you like more detail? 1 for yes, 0 for no. ");
	int ans = GetInt();
	if (ans == 1) {
		printf("Quarters: %i\nDimes: %i\nNickels: %i\nPennies: %i\nThank you for using this program!\n",quarCount, dimeCount, nickCount, pennCount);
	}
	else {
		printf("Thank you for using this program!\n");
	}
}

int main(void) {
	float f = getPositiveFloat();
	int i = convertToCents(f);
	countChange(i);
	giveDetail();	
}

/**END**CHANGE**/

// command-line arguments. requires stdio, cs50
int main(int argc, string argv[]) {
	for (int i = 1; i < argc; i++) {
		printf("%s\n", argv[i]); // prints each argument on a line
	}
}
// for example, running "./args two three" in the command line will print "two" on one line and "three" on the next