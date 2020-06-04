#   _______  __   __  _______  __   __  _______  __    _ 
#  |       ||  | |  ||       ||  | |  ||       ||  |  | |
#  |    _  ||  |_|  ||_     _||  |_|  ||   _   ||   |_| |
#  |   |_| ||       |  |   |  |       ||  | |  ||       |
#  |    ___||_     _|  |   |  |       ||  |_|  ||  _    |
#  |   |      |   |    |   |  |   _   ||       || | |   |
#  |___|      |___|    |___|  |__| |__||_______||_|  |__|
#

# Introduction
# 
# This is Python. A weird, curly-bracketless programming language. It's named after Monty Python, not the genre of snake.
# Syntax is pretty different, compared to most other languages. Whitespace is important for some reason.

# These are single-line comments. Everything after them is commented. They can be placed at the end of a line of code, without any problems, as you'll see later.

""" This is a multiline comment.
    Everything until you make a second set of three double quotation marks will be commented.
    I don't really like them, other than for commenting out blocks of code to be dealt with later.
"""

# variables require no declaration beforehand. also, I'm showing some data types
my_int = 7
my_float = 1.23
my_bool = True
my_string = "Hi!"

# changing a variable looks exactly the same as initially assigning one (could be confusing...?)
change = 12
change = 10 # "change" is now 10 instead of 12

# lists. that's right, arrays are called lists in Python. why??
weird_stuff = ["Nissan Cube", "eyelid tattoos", "Python"]
weird_stuff[1]                              # equates to "eyelid tattoos". btw, they're zero-indexed. in other words, list[0] is the first item in the list, list[1] is the second, etc.
weird_stuff[0:2]                            # slicing. includes "Nissan Cube" and "eyelid tattoos". the first index number is included, but not the second. I have no idea why
weird_stuff[2] = "hairless kitties"         # changes "Python" to "hairless kitties"
weird_stuff.append("mayonnaise")            # adds "mayonnaise" to the end of the list
weird_stuff.index("eyelid tattoos")         # returns the index (position) of "eyelid tattoos" which is super duper useful and convenient
weird_stuff.insert(0, "Ouya controllers")   # inserts "Ouya controllers" at index 0, moving everything else up one (so that "Nissan Cube" is now 1, and so on)
weird_stuff.sort()                          # sorts weird_stuff in alphanumeric order
weird_stuff.remove("Nissan Cube")           # removes "Nissan Cube" from the list
weird_stuff.pop("Ouya controllers")         # returns "Ouya controllers" and removes it from the list
# note: a value in a list can also be a list

# more about list slicing
# basically it works like this: [start:stop:step]
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
nums[0:5]       # includes the numbers 1, 2, 3, 4, and 5
nums[0:10:2]    # third value determines the steps between chosen numbers. this one includes the numbers 1, 3, 5, 7, and 9
# the index "10" for the stopping point is fine as long as you aren't trying to access the tenth index of the list, since it doesn't exist
# some numbers in the brackets can be omitted if you want:
nums[5:]        # starts at five and stops at the end. includes 6, 7, 8, 9, and 10
nums[:3]        # starts at the beginning and stops at three (index three, not the 3 value). includes 1, 2, and 3
nums[2::2]      # starts at 2, ends at the end, taking steps of two. includes 3, 5, 7, and 9
nums[::3]       # starts at beginning, ends at end, taking steps of three. includes 1, 4, 7, and 10
# negative step values can be used to reverse the list
nums[::-1]      # simply a reversed version of the list. includes 10, 9, 8, 7, 6, 5, 4, 3, 2, and 1 in that order
nums[7:2:-2]    # starts at seven, ends at two, taking BACKWARDS steps of 2. includes 8, 6, and 4 in that order

# join function. kinda related to lists, but a little odd
a_list = ["hyphenate", "this", "list"]
print "-".join(a_list) # prints "hyphenate-this-list". see what I mean by odd? despite it seeming like it operates on the list, it's a method of a string object

# dictionaries. they're like lists, but with keys that you define instead of using simple number indexes. similar to PHP's associative arrays
dict = {"Color": "Blue", "Size": 7, 12: "Hey"}
dict["Color"]   # equates to "Blue". it's important to note that they're still accessed with regular brackets
dict["Size"]    # equates to 7
dict[12]        # equates to "Hey"
# a value in a dictionary can be a list, too

# dictionaries can also be formatted in a more reading-friendly way
alice = {
    "name":     "Alice",
    "homework": [100.0, 92.0, 98.0, 100.0],
    "quizzes":  [82.0, 83.0, 91.0],
    "tests":    [89.0, 97.0]
}

# some dictionary functions
example = {
    "Key": "Value",
    "Quantity": 12
}
example.items()     # result is an array of tuples for key-value pairs:   [('Key', 'Value'), ('Quantity', 12)]
example.keys()      # result is an array of the keys in the dictionary:   ['Key', 'Quantity']
example.values()    # result is an array of the values in the dictionary: ['Value', 12]

# in the last section, I shortly mentioned tuples
# they are like lists, but immutable, meaning they can not be changed (but they CAN be deleted)
a_tuple = ("Can't change this", 123)

# delete stuff. I wouldn't suggest using it for entire variables, though. just overwrite the variable if you want to get rid of it for some reason
x = [1, 2, 3]
del x[1]  # deletes only the 2 value
del x     # deletes the entire x list (also will work for other kinds variables)

# simple math operators
addition = 72 + 23
subtraction = 108 - 204
multiplication = 108 * 0.5
division = 108 / 9          # important notes: int divided by int will be a floored int. int divided by float will be a float
exponentiation = 2 ** 3     # two to the power of three
modulo = 3 % 2              # remainder of 3 divided by 2 (1)

# you can straight-up get a single character from a string with the index thing. not sure if you can do this in other languages, never tried. it seems pretty useless anyway
fifth_letter = "monty"[4] # valued at "y"

# string functions
string = "Norway"
len(string)                                     # length of the word "Norway"
string.lower                                    # "norway"
string.upper                                    # "NORWAY"
num = 5.1
str(num)                                        # turns num into a string; "5.1"
new_string = "This is, absolutely, a sentence."
string_array = new_string.split()               # splits a string into an array by its words. resulting array is ["This", "is,", "absolutely,", "a", "sentence."]
new_string_array = new_string.split(",")        # argument specifies a delimiter. resulting array is ["This is", "absolutely", "a sentence."]
# P.S. the methods only work on strings (e.g. .lower and .upper) but the functions will work on other data types (e.g. len() and str() )


#      ____   ______
#     /  _/ _/_/ __ \
#     / / _/_// / / /
#   _/ /_/_/ / /_/ /
#  /___/_/   \____/
#


# print is Python's console.log()
print "Hello world!"                                                # prints "Hello World!" without quotes to the console
print "Welcome " + "to" + "Earth."                                  # prints "Welcome toEarth" (the typo-esque lack of a space is on purpose, to show that it takes your input rather literally)
print "Beep boop I am a robot. Here is my favorite number: " + 13   # gives an error. you can't combine a string and a number together (although printing a number alone is fine). use str()
print "Then again, it might be this: ", 6                           # ignore the second part of that last comment, you just can't ADD a number and a string. this is how you can attach something

# a neat print thing. separated from the others because it involves more than one line
print "Hi",
print "everyboty."
# prints "Hi everybody.". the added comma means the next print will be on the same line. the comma adds spaces though, for some reason (even when used for a single print command)

print(["Astroboy", "MechaGodzilla", "Liberty Prime"])

# sticking variables in console output. better alternative to using str() on a number for print
first_name = Jeff
last_name = Jefferson
print "Hi, %s %s." % (first_name, last_name) #prints "Hi, Jeff Jefferson." note: parentheses in last part are required even when there's only one variable

# user input in the console
name = raw_input("What's your name?") # prompts the user for their name, and puts the answer in the "name" variable

#
# File I/O
#

# open function lets you open files
file = open("file.txt", "r+")       # the second argument ("r+" in this example) decides whether to read, write, or both. "w" is write, "r" is read, and "r+" is read/write
# (variable name is unimportant)    # furthermore, the "a" argument is "append" mode, which will let you add stuff after the current contents of the file
                                    # using "w" or "a" modes, you can make a new file; with the other modes, you can't (how could you read a file that doesn't exist?)
# writing to the file
file.write("Hi")                    # writes "Hi" to the file
for x in range(1,11):
    file.write(str(x) + "\n")       # writes the numbers 1 through 10, each on a new line (\n means "new line", e.g. "Hi \n there" will write "Hi" on one line, and "there" on the next)

# so you know what we're looking at, here's the file's current contents:
# 
#   Hi1
#   2
#   3
#   4
#   5
#   6
#   7
#   8
#   9
#   10

# reading the file
print file.read()                   # prints the contents of the file. in this case, it's "Hi1" on the first line, then 2-10 on the following lines

# just reading one line at a time
print file.readline()               # prints "Hi1". you can specify a number as the argument, but it only affects how many characters of the line it reads
print file.readline()               # prints "2"

# gotta close the file
file.close()                        # closing the file is necessary. if you don't do it, it won't save your changes
                                    # according to Codecademy, that isn't the only issue, but it's being unclear about any other problems...

# wanna check whether or not it's really closed?
print file.closed                   # "closed" is a property of all file objects; this particular one will print "True" because the file IS closed

# additional notes:
# you can open the same file more than once at a time, if you want (such as reading it and writing to it, with two different instances), but I don't see why you would need to, really
# naturally, you can also have two different files open at a time (such as reading information from one and writing it to another), which I can see the use of


#     ______            __             __   ________                                 __   __  ___
#    / ____/___  ____  / /__________  / /  / ____/ /___ _      __   ____ _____  ____/ /  /  |/  /___  ________
#   / /   / __ \/ __ \/ __/ ___/ __ \/ /  / /_  / / __ \ | /| / /  / __ `/ __ \/ __  /  / /|_/ / __ \/ ___/ _ \
#  / /___/ /_/ / / / / /_/ /  / /_/ / /  / __/ / / /_/ / |/ |/ /  / /_/ / / / / /_/ /  / /  / / /_/ / /  /  __/
#  \____/\____/_/ /_/\__/_/   \____/_/  /_/   /_/\____/|__/|__/   \__,_/_/ /_/\__,_/  /_/  /_/\____/_/   \___/
#
# slightly more complicated aspects of programming, including loops, functions, and if statements

# logical comparison operators. all commented because I'm pretty sure it's invalid code
# ==        equal to
# !=        not equal to
# <, >      less than, greater than
# <=, >=    less than or equal to, greater than or equal to

# boolean operators, which have an order of operations. they are listed in the order they are evaluated. parentheses can be used to help you
# not       self-explanatory    (e.g. not True is False)
# and       "              "    (e.g. True and True is True)
# or        "              "    (e.g. True or False is True)

# if/elif/else. idk why "else if" is called "elif" here. this is where syntax starts to get kinda weird
cond = 2
if cond == 3:
    print "The variable is 3!"
elif cond == 2:
    print "The variable is 2!"
else:
    print "The variable is some other number!"
    
# functions. couldn't tell you why they use the keyword "def", it's pretty vague. but whatever
def this_is_a_function():
    return "A function printed this."   # the return keyword means that this value is put out when the function is run
print this_is_a_function()              # prints "A function printed this."

# functions with arguments
def say_hi(name):
    name = raw_input("What's your name?")
    print "Hi, %s." % (name)
say_hi("Timmy") # prints "Hi, Timmy."

# a few more functions that come with Python
max(1, 3, 5)    # maximum value of arguments. result is 5
min(1, 3, 5)    # minimum value of arguments. result is 1
abs(-5)         # absolute value. result is 5
type(3)         # data type of argument. result is int. when printed it looks like "<type 'int'>" but when you're referring to a data type in a script, like in a condition, it's just "int"
float(5)        # converts an int to a float. result is equal to 5.0

# for loops. for loops are NOT like JavaScript's for loops. rather, they're like its foreach loops. there is nothing similar to JS for loops
list = [1, 3, 5]
for placeholder in list:
    print placeholder # prints 1, then 3, then 5, each on separate lines
# more info: for every object in "list", it does the stuff that comes after the "for" statement, with "placeholder" being a placeholder for the current object
# when used with a dictionary, the placeholder will stand for the key, not the value

# break keyword. only works with loops (both for and while)
list = [0, 1, 2]
for i in list:
    if i == 1:
        break
    else:
        print i
# the loop will end when it reaches 1

# range() can be used to make fake JavaScript for loops. the function is used as a shortcut for creating simple lists without declaring a variable
range(5)            # creates [0, 1, 2, 3, 4]
range(1, 4)         # creates [1, 2, 3] (just like the the string/list-slicing thing, the first number is included, but not the second)
range(1, 11, 2)     # creates [1, 3, 5, 7, 9, 11]
# three "versions" of it:
# range(stop)
# range(start, stop)
# range(start, stop, step)

# example of using range() for a loop
for i in range(5)
    print "Hi"
# it will print "Hi" five times

# while loops. uses conditions, like the ones used in if statements. be careful of infinite loops
count = 0
while count < 5:
    print "Hi"
    count += 1  # this adds 1 to count. just a quicker way of saying "count = count + 1"
# like the last for loop, this prints "Hi" five times. neither method is a perfect replacement for JS for loops, but there's no other choice

# while/else. it's a weird thing... but I guess useful. the else part will always execute at the end of the loop
count = 1
while count == 1:
    print count
else:
    print "Done."
# this will print 1, and then "Done." pls note that the else statement is part of the loop. therefore if a break is used, the else part will NOT run

# list comprehension. syntax is similar to for loops with if statements. super cool stuff, with lots of possible uses
even_numbers = [x for x in range(1, 11) if x % 2 == 0]      # simple example. just makes a list of the even numbers from 1 to 10

# lambda. creates a fake ("anonymous") function, for passing into another function, or whatever. kind of interesting, I guess, but I think I'd just make a real function
lambda x: x % 3 == 0
# ^^that is basically the same as this:
def by_three(x):
    return x % 3 == 0
# not going into much detail because I honestly don't see the point of these, they're just confusing


#     ________
#    / ____/ /___ ______________  _____
#   / /   / / __ `/ ___/ ___/ _ \/ ___/
#  / /___/ / /_/ (__  |__  )  __(__  )
#  \____/_/\__,_/____/____/\___/____/
#
# classes!! woo! finally. the good stuff. similar to PHP's, which is nice. doesn't require the weird prototyping stuff found in JavaScript

class Animal(object):
    def __init__(self, name, age):  # this function will be used by the interpreter to make new instances of this class. "self" argument refers to the object being created with this constructor
        self.name = name            # self.name = name means it will create a "name" property on the object being created, with a value equal to the "name" argument
        self.age = age
    is_alive = True                 # this property is available to all Animal objects, but it can't be individualized when it's made, since it isn't part of the constructor
    overwrite_this = 12
    def describe(self):             # like the above property, this method is available to all Animal objects. the result is individualized, but the method itself is the same for all of them
        print "My name is %s, and I am %i years old!" % (self.name, self.age)

zebra = Animal("Jeffrey", 8)        # creates an object of the class Animal, with the name property set to "Jeffrey" and age to 8
print zebra.name                    # equates to "Jeffrey"
zebra.describe()                    # prints "My name is Jeffrey, and I am 8 years old!"

# class inheritance. any object of a class that inherits from another class will also have the methods and properties that are in the original class
class Bird(Animal):                 # the part in parentheses determines what class it will inherit from
    has_feathers = True
    overwrite_this = 8              # you can overwrite inherited values
    def describe(self):
        print "Tweet tweet! I'm a bird named %s! I'm %i years old!" % (self.name, self.age)
    def describe_simple(self):
        return super(Bird, self).describe(self)         # after overwriting the describe method, maybe we end up needing to call it anyway! use this to do that
                                                        # btw, this example of super() doesn't work. idk why. google it if you need it. it's another function I don't see the use of
robin = Bird("Nathan", 2)
robin.describe()                    # prints "My name is Nathan, and I am 2 years old!"
print robin.has_feathers            # prints True

# you can tell Python how to show off objects of your class, such as when using print, by defining a __repr__() function
# normally, an object of a class you make will look odd, like "<__main__.Animal instance at 0x02859468>", but with this you can make it actually show the contents of the object
class Point:                        # as shown, it's not *required* to set a new class you make to inherit "object". but you should. some functions may not work right otherwise
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z
    def __repr__(self):
        return "(%i, %i, %i)" % (self.x, self.y, self.z)
spot = Point(1, 12, 8)
print spot                          # now, instead of something like the weird thing from earlier, this will print "(1, 12, 8)"

# more "magic methods" (like __init__ and __repr__)
# __enter__         used with "with" statements. called when the with statement starts
# __exit__          used with "with" statements. called when the with statement ends
# __bool__          in Python 3, determines what the bool() function will result in
# __nonzero__       same as __bool__(), but for Python 2


#      ____  _
#     / __ )(_)___  ____ ________  __
#    / __  / / __ \/ __ `/ ___/ / / /
#   / /_/ / / / / / /_/ / /  / /_/ /
#  /_____/_/_/ /_/\__,_/_/   \__, /
#                           /____/
#
# this is a small section, but big enough to justify it being separate. it's only about bitwise operations
# if you need an explanation of bits or binary numbers, google it. that's kinda out of the scope of this file

# straight-up binary numbers. the prefix 0b means the following number will be in binary form
print 0b1       # prints 1
print 0b00101   # prints 5. as shown, the number can be prefaced by zeros if you want. that could help with organization
print 0b11111   # prints 31
# the numbers are considered by Python to simply be integers. nice and simple. but it does mean you shouldn't do bitwise operations on floats

# bin function. doesn't do any real converting; just returns a STRING (that is important) version of the integer you pass into it, in binary form
print bin(12) # prints "0b1100"
# hex and oct functions also exist, with analogous uses

# int function has a second argument. when an integer is passed after the string, that is used to represent the base the number is in (binary is base 2)
int("101", 2) # returns 5

# bitwise operators. these are very unlike logical operators, and have entirely different practical uses
# <<    left bit shift      Moves the number's bits left.
# >>    right bit shift     Moves the number's bits right.
# &     AND                 Compares two numbers and returns a number with bits turned on that correspond to places in the original numbers where both numbers were 1.
# |     OR                  Similar to AND, but the bit is 1 where EITHER of the original numbers contained 1.
# ^     XOR                 Exclusive OR; resulting bits are 1 where the original bits were not the same.
# ~     NOT                 "Flips all the bits in a single number." Codecademy isn't explaining exactly what this means, so I guess that will have to be enough for now.

# more about the shift operators
0b01 << 2 # result is 0b100
0b10 >> 1 # result is 0b001
0b10 >> 2 # result is 0b000. as you can see, it literally just moves them left or right

# AND operator
a       = 0b1010
b       = 0b0011
a & b  == 0b0010
#             ^  that is the only bit where the value was 1 in both; therefore it's also the only bit that is 1 in the new number

# OR operator
a       = 0b1010
b       = 0b0011
a & b  == 0b1011
#           ^ ^^ places where the resulting value is 1. notice the zero is in the only place where the original numbers BOTH had zero

# XOR operator
a       = 0b1010
b       = 0b0011
a & b  == 0b1001
#           ^  ^ the spots with the same value in the originals became 0 in the result

# using a binary number as a mask for checking what bits are on or off
def check_bit4(input):
    mask = 0b1000
    if input & mask > 0:
        return "on"
    else:
        return "off"
# if the fourth from the right bit in the input was 1, then this will return "on". otherwise, the resulting integer (of input & mask) would have been 0, and the condition would be false

# OR can be used to turn on a specific bit in any number
a    = 0b101001
mask = 0b100    # I want to turn on the third from the right bit, so that one (and that one alone) is on in the mask
a | mask        # returns 101101

# XOR can be used to flip every bit
a    = 0b101001
mask = 0b111111 # all bits are on, which will make every bit in the original number opposite of what it was
a ^ mask        # returns 010110

# using shifts to control masks
def flip_bit(number, n):
    result = number ^ (0b1 << (n - 1))
    return bin(result)
# when run, it returns a string that shows the binary form of the argument "number", with the nth bit flipped


#      ______                           __         
#     / ____/  ______ _____ ___  ____  / /__  _____
#    / __/ | |/_/ __ `/ __ `__ \/ __ \/ / _ \/ ___/
#   / /____>  </ /_/ / / / / / / /_/ / /  __(__  ) 
#  /_____/_/|_|\__,_/_/ /_/ /_/ .___/_/\___/____/  
#                            /_/                   
#
# generally there will not be many comments within the examples. only one at the beginning to summarize the goal of the script, and one at the end to describe the results
# two empty lines separate each example

# pig latin "translator"
pyg = 'ay'
original = raw_input('Enter a word:')
word = original.lower()
first = word[0]
new_word = word[1:len(word)] + first + pyg
if len(original) and original.isalpha():
    print new_word
else:
    print 'empty'
# if the user inputs "kitties" the script will print "ittieskay"


# returns median value from list
def median(listy):
    new = sorted(listy)
    odd_mid = 0
    even_mid = 0
    med = 0
    if len(new) % 2 == 0:
        even_mid = len(new) / 2
        odd_mid = even_mid + 1
        return (new[even_mid - 1] + new[odd_mid - 1]) / 2.0
    else:
        odd_mid = (len(new) / 2) + 1
        return new[odd_mid - 1]
# if the argument was [1, 2, 3] the result is 2, if the argument was [1, 2, 3, 4] the result is 2.5, etc.


# find the cost of a vacation
def hotel_cost(nights):
    return 140 * nights

def plane_ride_cost(city):
    if city == "Charlotte":
        return 183
    elif city == "Tampa":
        return 220
    elif city == "Pittsburgh":
        return 222
    elif city == "Los Angeles":
        return 475

def rental_car_cost(days):
    cost = 40
    cost = cost * days
    if days >= 7:
        return cost - 50
    elif days >= 3:
        return cost - 20
    else:
        return cost

def trip_cost(city, days, spending_money):
    return hotel_cost(days) + plane_ride_cost(city) + rental_car_cost(days) + spending_money

print trip_cost("Los Angeles", 5, 600)
# prints the total cost of the trip, taking into consideration the hotel, plane ticket, and rental car costs, with an added amount for spending money


# gradebook   !!! reworked !!!
class Student:
    _all = []
    
    def __init__(self, name, homework, quizzes, tests):
        self.name = name
        self.homework = homework
        self.quizzes = quizzes
        self.tests = tests
        
        Student._all.append(self)
    
    def get_average(self):
        homework = sum(self.homework) / len(self.homework)
        quizzes = sum(self.quizzes) / len(self.quizzes)
        tests = sum(self.tests) / len(self.tests)
        return (0.1 * homework) + (0.3 * quizzes) + (0.6 * tests)
    
    def get_letter_grade(self):
        score = self.get_average()
        if score >= 90:
            return "A"
        elif score >= 80:
            return "B"
        elif score >= 70:
            return "C"
        elif score >= 60:
            return "D"
        else:
            return "F"
    
    @classmethod
    def get_all(cls):
        return cls._all
    
    @classmethod
    def get_class_average(cls):
        try:
            results = []
            for student in cls._all:
                results.append(student.get_average())
            return sum(results) / len(results)
        except ZeroDivisionError:
            raise ValueError("Can't get the average of an empty class.")


lloyd = Student(name='Lloyd',
                homework=[90.0, 97.0, 75.0, 92.0],
                quizzes=[88.0, 40.0, 94.0],
                tests=[75.0, 90.0])

alice = Student(name='Alice',
                homework=[100.0, 92.0, 98.0, 100.0],
                quizzes=[82.0, 83.0, 91.0],
                tests=[89.0, 97.0])

tyler = Student(name='Tyler',
                homework=[0.0, 87.0, 75.0, 22.0],
                quizzes=[0.0, 75.0, 78.0],
                tests=[100.0, 100.0])

print(Student.get_class_average())
# prints the numeric average of the grades of all the students in the class


# some more grade-related functions
grades = [100, 100, 90, 40, 80, 100, 85, 70, 90, 65, 90, 85, 50.5]

def print_grades(scores):
    for grade in scores:
        print grade

def grades_sum(scores):
    total = 0
    for grade in scores: 
        total += grade
    return total
    
def grades_average(scores):
    return grades_sum(scores) / float(len(scores))

def grades_variance(scores):            # variance is the average of the squared differences from the mean. to be clear: avg(for each score: (score - mean)^2)
    avg = grades_average(scores)
    variance = 0
    for score in scores:
        variance += (avg - score) ** 2
    return variance / float(len(scores))

def grades_std_deviation(variance):
    return variance ** 0.5              # x to the power of 0.5 finds the square root of x

def print_all(scores):
    print_grades(scores)
    print grades_sum(scores)
    print grades_average(scores)
    print grades_variance(scores)
    print grades_std_deviation(grades_variance(grades))
# for a list of grades, this has functions for finding their sum, average, variance, and standard deviation. also includes a function for printing all of these


#      __  ___          __      __         
#     /  |/  /___  ____/ /_  __/ /__  _____
#    / /|_/ / __ \/ __  / / / / / _ \/ ___/
#   / /  / / /_/ / /_/ / /_/ / /  __(__  ) 
#  /_/  /_/\____/\__,_/\__,_/_/\___/____/  
#                                          
# basically, libraries


# how to include them
import mod              # imports the entire "mod" module; everything is under the namespace "mod"
from mod import func    # individually imports only the "func" function in the "mod" module
from mod import *       # universal import; individually imports everything in "mod"
# avoid doing a universal import

# getting a list of things in a module. use this to see what's in a module, rather than me listing all the functions and stuff here
import mod              # imports the module
everything = dir(mod)   # sets "everything" to a list of things from math. rather than having me list everything in the modules, just use this function to get info beyond my examples
print everything        # prints everything from the module


# ================
# Standard Library
# ================

# Not a whole lot needs to go here, as long as I have the docs on whatever computer I'm using.

# including the datetime function from the datetime module, followed by some functions it has. in the examples, the date and time is Janurary 27, 2015 at 5:30 and 25.5 seconds
from datetime import datetime
now = datetime.now() # current date and time. format: 2015-1-27 5:30:25.500000
print '%s/%s/%s' % (now.day, now.month, now.year) # example of method use. prints 27/1/2015
print(now.strftime('%d/%m/%Y')) # prints exactly the same as the one above, but better

# math module
import math
print math.sqrt(25) # prints "5," the square root of 25

# randint function from the random module
from random import randint
randint(0, 1) # randomly chooses either 0 or 1
randint(1, 5) # randomly chooses a number from 1 to 5, inclusive


# ===================
# Third-Party Modules
# ===================

# win32api
# ========

# I'm just leaving this here as a placeholder.


# win32ui
# =======

