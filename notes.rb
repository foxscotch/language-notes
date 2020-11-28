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
# You can also make anonymous functions as blocks:
6.times do
    puts "hello!!!"
end  # prints "hello!!!" six times

# Ruby's got lists and dicts, known as arrays and hashes.
words = ["wouldn't", "you", "like", "to", "know"]
words[2]        # "like"
words.join " "  # "wouldn't you like to know"
data = {
    "name" => "Foxscotch",
    "favorite_color" => "#FF0055"
}
data["favorite_color"]  # "#FF0055"

# Which can both be used with .each to loop through them.
names = ["John", "Jacob", "Jingleheimer", "Schmidt"]
names.each { |name| puts name }  # prints each name in succession
animals = {
    "wolf" => "Canis lupus"
    "bottlenose dolphin" => "Tursiops truncatus"
    "boa constrictor" => "Boa constrictor"  # ha ha
    "jaguar" => "Panthera onca"
}
animals.each do |common, scientific|
    puts "The common name of #{scientific} is #{common}."
end  # prints a nice sentence about the names of each animal :)
