=begin
██▀███   █    ██  ▄▄▄▄ ▓██   ██▓
▓██ ▒ ██▒ ██  ▓██▒▓█████▄▒██  ██▒
▓██ ░▄█ ▒▓██  ▒██░▒██▒ ▄██▒██ ██░
▒██▀▀█▄  ▓▓█  ░██░▒██░█▀  ░ ▐██▓░
░██▓ ▒██▒▒▒█████▓ ░▓█  ▀█▓░ ██▒▓░
░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ░▒▓███▀▒ ██▒▒▒ 
  ░▒ ░ ▒░░░▒░ ░ ░ ▒░▒   ░▓██ ░▒░ 
  ░░   ░  ░░░ ░ ░  ░    ░▒ ▒ ░░  
   ░        ░      ░     ░ ░     
                        ░░ ░     
=end

# Single-line comment.


# puts and print
puts 'hello'   # adds a newline after the string
print "world"  # does not ;)

# Numbers and maths is ezpz, pretty much Python. The default Integer type even
# supports arbitrarily-large numbers like Python does. At least on 2.4+?
x = 12
y = x + 14.8  # 26.8
x**2  # 144
# And booleans are simple too. Lowercase! Got both wordy and symbol operators.
sweet = true
sour = sweet and false       # false
spicy = not (sour || sweet)  # false

# The conditional assignment operator assigns to the variable only if its
# current value is false or nil.
a = false
b = true
a ||= 

# Calling methods on objects is done as you'd expect; although the parentheses
# are optional if you don't need them.
x = 'foxscotch!'
x.length   # 10
x.reverse  # '!hctocsxof'
x.upcase   # 'FOXSCOTCH!'

# String interpolation works with double-quoted strings only.
age = '23'.to_i  # bonus info: String.to_i converts string to integer :)
"I'm #{age} years old!"   # "I'm 23 years old!"
'I\'m #{age} years old!'  # "I'm \#{age} years old!"

# Command-line input is done with gets
gets.chomp  # waits for input, with chomp removing the newline at the end
# Passing an argument tells it to stop reading at the provided string, instead
# of simply at a newline.
gets "x"  # waits for input, reading until it encounters "x"

# Control flow uses no colons, and _does_ have explicit ends.
if x > 5
    puts "over 5"
elsif x < 10
    puts "under 10"
else
    puts "not between 5 and 10"
end

unless x == 12  # this is just an inverted if
    puts "x is not 12"
end

# An if expression is available, though it doesn't provide an else option.
puts "wow" if 5 > 3  # prints "wow"

# We also got case statements. Like switches, just with different terms.
x = "hello"
case x
    when "hello"
        puts "said hello!"  # this will be printed
    when "goodbye"
        puts "said goodbye :("
    else
        puts "said something else"
end

# For loops:
for i in 1..10  # inclusive of both 1 and 10   note: using ... instead would make it exclusive of the final number
    if i == 5
        next  # equivalent to continue in other languages
    end
    next if i == 8  # can also be used like this
    puts i
end  # will print every number from 1-10 except 5 and 8

# While/until is similar:
i = 0
while true
    break if i > 15
    puts i
    i += 1
end  # prints every number from 0-15

i = 0
until i >= 10
    puts i
    i += 1
end  # prints every number from 0-9

# A method of integers allows us to run some code a specific number of times:
5.times { puts "a" }    # prints the letter "a" five times
3.times { |x| puts x }  # prints 0, 1, then 2, since .times passes an integer as an argument
# You can also use "do" syntax for code blocks like this:
6.times do
    puts "hello!!!"
end  # prints "hello!!!" six times

# Ruby's got lists and dicts, known as arrays and hashes.
words = ["wouldn't", "you", "like", "to", "know"]
words[2]        # "like"
words << "weather" << "boy"  # concatenation operator, also works for strings
words.join " "  # "wouldn't you like to know weather boy"
data = {
    "name" => "Foxscotch",
    "favorite_color" => "#FF0055"
}
data["favorite_color"]  # "#FF0055"

# Functions are defined like so:
def add_5(num)
    return 5 + num
end
add_5(4)  # 9

# The "splat" operator works like the same symbol does in Python, and also the
# final expression is implicitly returned if you don't explicitly return:
def sum(*numbers)
    acc = 0
    numbers.each { |num| acc += num }
    acc  # implicit return here. this specific example seems bad but I imagine you wouldn't normally do it like that
end
sum(15, 25, 5)  # 45

# Symbols are essentially immutable, interned strings (which hints that strings
# are mutable, and indeed, they are...).
me = {
    :name => foxscotch,
    :yes_underscore => true,
    :"with space" => 12
}
me[:yes_underscore]  ## true

# Hash maps get some sick syntax if you wanna use symbols.
next_words = {
    light: "bulb",
    apple: "sauce",
    iced: "coffee"
}
next_words[:light]  # "bulb"

# Some useful iterable methods.
names = ["John", "Jacob", "Jingleheimer", "Schmidt"]
names.each { |name| puts name }  # prints each name in succession
names.select { |name| name.start_with? 'S' }  # ["Schmidt"]
names.map { |name| name[0] }  # ["J", "J", "J", "S"]

# Much of the same applies to hashes.
animals = {
    "wolf" => "Canis lupus",
    "bottlenose dolphin" => "Tursiops truncatus",
    "boa constrictor" => "Boa constrictor",  # ha ha
    "jaguar" => "Panthera onca"
}
animals.each do |common, sci|
    puts "The common name of #{sci} is #{common}."
end  # prints a nice sentence about the names of each animal :)
# And so on. Hashes also have some that arrays don't:
animals.each_key { |name| puts name }  # prints each common name
animals.each_value { |name| puts name }  # prints each scientific name

# .respond_to? can be used to determine whether an object has a certain method.
"a".respond_to? :upcase  # true
"b".respond_to? :push    # false

# Lambdas are essentially self-contained functions. (Also works with do syntax.)
test = lambda { |x| puts x }
test.call("hello")  # prints "hello"

# They are probably most useful as closures:
def multiplier(factor)
    lambda { |n| n * factor }
end
m = multiplier(16)
m.call(4)  # 64

# Procs are similar, but behave differently with arguments and returning. In
# particular, extra arguments are ignored, and missing ones are filled with nil.
# Lambdas, by the way, are just a particular type of Proc.
test = Proc.new { |x| puts x }
test.call # prints an empty line, because x is nil!

# As for returning, it will return from the context in which it was created.
def test
    p = Proc.new { return 12 }
    p.call
    puts "hello"  # this code will never be reached
end
puts test  # prints 12

# Therefore, Procs defined outside of a function can't return.
p = Proc.new { return 12 }
p.call  # causes a LocalJumpError

# Procs (including lambdas) can be turned into blocks when passing with &.
l = lambda { |i| i*2 }
[1, 2, 3].map &l  # [2, 4, 6]

# Classes are defined like this:
class Person
    @@people = 0  # this is a class property

    def initialize(name, age)  # will be called by Person.new
        @name = name  # this is an instance property
        @age = age
        @@people += 1  # incrementing the class property for each created Person
    end

    def name  # getter for @name, which would otherwise be inaccessible
        @name
    end

    def self.people  # getter for class property @@people
        @@people
    end
end

p = Person.new "Foxscotch", 23
p.name         # "Foxscotch"
p.age          # causes a NoMethodError
Person.people  # 1, the number of instances thus far created

# Inheritance:
class Human < Person  # sure, a human is a type of person
    attr_reader :job
    attr_writer :job  # these two serve as shortcuts to making getters and/or setters
    # a single attr_accessor instead would accomplish both in one fell swoop

    def initialize(name, age, job)
        super name, age  # note: if the overriding function had the same number of arguments, you could omit them here
        @job = job
    end
end
h = Human.new "James", 22, "Accountant"
h.name        # "James"
h.job = "Senior Accountant"
h.job         # "Senior Accountant"
Human.people  # 2, assuming we're working in the same continuity as the Person example
Person.people # also 2. cus it's the same property in the end. this feels weird to me, but I guess it makes sense?

# Modules:
require 'date'  # imports the date module

module Example
    EXAMPLE_CONSTANT = "an example!!!"
end
Example::EXAMPLE_CONSTANT  # "an example!!!", accesses a member of a namespace
