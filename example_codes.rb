# These are examples from the book to study

total = 0
[1, 2, 3].each { |number| total += number }
puts total # 6

total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total # 6

name = 'Somebody Else'

def print_full_name(first_name, last_name)
  name = first_name + ' ' + last_name
  puts name
end

# puts name will print 'Somebody Else'

# scope.rb

a = 5             # variable is initialized in the outer scope

3.times do |n|    # method invocation with a block
  a = 3           # is a accessible here, in an inner scope?
end

puts a            # this will output 3

# scope.rb

a = 5

3.times do |n|    # method invocation with a block
  a = 3
  b = 5           # b is initialized in the inner scope
end

puts a
puts b            # is b accessible here, in the outer scope?

# b is not accessible so it will return an error

arr = [1, 2, 3]

for i in arr do
  a = 5      # a is initialized here
end

puts a       # is it accessible here? yes because a for does not create a block

MY_CONSTANT = 'I am available throughout your app.'  # example constant variable declaration

$var = 'I am also available throughout your app.'  #example global variable declaration

@@instances = 0  # example class variable declaration

@var = 'I am available throughout the current instance of this class.' #example instance variable declaration

var = 'I must be passed around to cross scope boundaries.'  # example local variable declaration

def say(words='hello')
  puts words + '.'
end

say()          # this will output hello
say("hi")
say("how are you")
say("I'm fine")

def some_method(number)
  number = 7 # this is implicitly returned by the method
end

a = 5
some_method(a)
puts a  # this will output 5

def add_three(number)
  return number + 3 # this return will just return number + 3 without executing the next line of code 
  number + 4
end

returned_value = add_three(4)
puts returned_value

# chaining methods

def add_three(n)
  n + 3
end

add_three(5).times { puts 'this should print 8 times'}
# this will return 8 at the end which we can keep chaining

# Method calls as arguments

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(num1, num2)
  num1 * num2
end

multiply(add(20, 45), subtract(80, 10))
=> 4550
# returns 4550

def scream(words)
  words = words + "!!!!"  # words can be used again here
  return
  puts words
end

scream("Yippeee")

foo = nil
bar = 'qux'
isOk = foo || bar # 'qux' is a truthy value

isOk = (foo || bar) ? true : false # this will output true

isOk
if (foo || bar) 
  isOk = true;
else 
  isOk = false;
end # this will output true. not sure if ; is needed?

# Example 1
if x == 3
  puts "x is 3"
end

# Example 2
if x == 3
  puts "x is 3"
elsif x == 4
  puts "x is 4"
end

# Example 3
if x == 3
  puts "x is 3"
else
  puts "x is NOT 3"
end

# Example 4: must use "then" keyword when using 1-line syntax
if x == 3 then puts "x is 3" end

puts "x is 3" if x == 3

puts "x is NOT 3" unless x == 3

# ternary expression examples:

foo = hitchhiker ? 42 : 3.1415    # Assign result of ?: to a variable
puts(hitchhiker ? 42 : 3.1415)    # Pass result as argument
return hitchhiker ? 42 : 3.1415    # Return result

# ternary expressions that are not recommended/inappropriate:

hitchhiker ? (foo = 42) : (bar = 3.1415) # Setting variables
hitchhiker ? puts(42) : puts(3.1415)      # Printing

# case_statement.rb

a = 5

case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end

# above case statement is roughly equivalent to below if statement

# if_statement.rb

a = 5

if a == 5
  puts "a is 5"
elsif a == 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end

# main difference is we only need to specify the variable we want to test once as the argument to case

# saving the result of case into a variable:

# case_statement.rb <-- refactored

a = 5

answer = case a
  when 5
    "a is 5"
  when 6
    "a is 6"
  else
    "a is neither 5, nor 6"
  end

puts answer

# 2nd form of case statement that does't take an argument:

# case_with_no_arg_statement.rb

a = 5

case
when a == 5
  puts "a is 5"
when a == 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end

# loop_example.rb

loop do
  puts "This will keep printing until you hit Ctrl + c"
end

# useful_loop.rb

i = 0
loop do
  i = i + 1
  puts i
  break         # this will cause execution to exit the loop
end

# conditional_loop.rb

i = 0
loop do
  i = i + 2
  puts i
  if i == 10
    break       # this will cause execution to exit the loop
  end
end

# next_loop.rb

i = 0
loop do
  i = i + 2
  if i == 4
    next        # skip rest of the code in this iteration
  end
  puts i
  if i == 10
    break
  end
end


# variable scope in loops:

loop do
  x = 42
  break
end
puts x     # Raises an error -- x is not in scope outside of the block

x = 42
loop do
  puts x   # Prints 42 -- x is in scope inside the block
  x = 2    # We can even change the value of x
  break
end
puts x     # 2 -- the value was changed

# countdown.rb

x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1 # <- refactored this line
end

puts "Done!"

x = 0
while x < 5
  y = x * x
  x += 1
end

puts y # 16

# countdown.rb

x = gets.chomp.to_i

until x < 0
  puts x
  x -= 1
end

puts "Done!"

# perform_again.rb

loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end

# another Ruby construct

begin
  puts "Do you want to do that again?"
  answer = gets.chomp
end while answer == 'Y'

# countdown3.rb

x = gets.chomp.to_i

for i in 1..x do
  puts x - i
end

puts "Done!"

# countdown4.rb

x = [1, 2, 3, 4, 5]

for i in x.reverse do
  puts i
end

puts "Done!"

# conditional_while_loop.rb

x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end # this will output 1, 3, 5, 7, 9

# conditional_while_loop_with_next.rb

x = 0

while x <= 10
  if x == 3
    x += 1
    next # this section causes 4 to be skipped
  elsif x.odd?
    puts x
  end
  x += 1
end # this will output 1, 5, 7, 9

# conditional_while_loop_with_break.rb

x = 0

while x <= 10
  if x == 7
    break # this will stop running the code at 7
  elsif x.odd?
    puts x
  end
  x += 1
end # this will output 1, 3, 5

x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end

# practice_each.rb

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end # this outputs a numbered list with the names

def doubler(start)
  puts start * 2
end

1. arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   arr.first.delete(arr.first.last)

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)])
   arr.first.delete(arr.first.last)

# arr.first is needed to select the 1st nested array

1. returns 1
    arr =  [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

2. returns [1, 2, 3]
    arr = [["b"], ["a", [1, 2, 3]]]

arr = [1, 2, 3, 4, 5]
new_arr = []

arr.each do |n|
  new_arr << n + 2 # this is a different way to do arr.map { |x| x + 2 } 
end

p arr
p new_arr

# optional_parameters.rb

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})

irb :001 > {"height" => "6 ft"}     # string as key
=> {"height"=>"6 ft"}
irb :002 > {["height"] => "6 ft"}   # array as key
=> {["height"]=>"6 ft"}
irb :003 > {1 => "one"}             # integer as key
=> {1=>"one"}
irb :004 > {45.324 => "forty-five point something"}  # float as key
=> {45.324=>"forty-five point something"}
irb :005 > {{key: "key"} => "hash as a key"}  # hash as key
=> {{:key=>"key"}=>"hash as a key"}

# key method
irb :001 > name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
irb :002 > name_and_age.key?("Steve")
=> true
irb :003 > name_and_age.key?("Larry")
=> false

# select method
irb :004 > name_and_age.select { |k,v| k == "Bob" }
=> {"Bob"=>42}
irb :005 > name_and_age.select { |k,v| (k == "Bob") || (v == 19) }
=> {"Bob"=>42, "Joe"=>19}

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end

arr = immediate_family.values.flatten

p arr

# important differene below!

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

# my_hash uses symbol x as a key
# my_hash2 uses variable x as a key

# Regex

# boolean_regex.rb

def has_a_b?(string)
  if string =~ /b/
    puts "We have a match!"
  else
    puts "No match here."
  end
end

has_a_b?("basketball") # match
has_a_b?("football") # match
has_a_b?("hockey") # no match
has_a_b?("golf") # no match

# Variables as pointers

a = "hi there"
b = a
a = "not here"
# b is pointed at "hi there" so it is never "not here"

a = "hi there"
b = a
a << ", Bob"
# here Bob is added to "hi there" so both a and b include Bob

a = [1, 2, 3, 3]
b = a
c = a.uniq
# a and b is [1, 2, 3, 3] c is [1, 2, 3]

a = [1, 2, 3, 3]
b = a
c = a.uniq!
# a, b and c are all [1, 2, 3]

# passing_block.rb

def take_block(&block)
  block.call
end

take_block do
  puts "Block being called in the method!"
end

# passing_block_2.rb passing a block and a number as a argument

def take_block(number, &block)
  block.call(number)
end

number = 42
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end

# proc_example.rb

talk = Proc.new do
  puts "I am talking."
end

talk.call

# proc_example.rb

talk = Proc.new do |name|
  puts "I am talking to #{name}"
end

talk.call "Bob"

#passing_proc.rb

def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)

# Exceptions and stack traces

def greet(person)
  puts "Hello, " + person
end

greet("John")
greet(1)

=begin
$ ruby greeting.rb
Hello, John
greeting.rb:2:in `+': no implicit conversion of 
Integer into String (TypeError) from               # this tells us where the error occured and why
greeting.rb:2:in `greet'
from greeting.rb:6:in `<main>'                     # error occured due to the call maid in the 'main' context on line 6

main -> greet -> puts -> exit and return to main   # stack trace

=end

def space_out_letters(person)
  return person.split("").join(" ")
end

def greet(person)
  return "H e l l o, " + space_out_letters(person)
end

def decorate_greeting(person)
  puts "" + greet(person) + ""
end

decorate_greeting("John")
decorate_greeting(1)

=begin
H e l l o, J o h n
greeting.rb:2:in `space_out_letters': undefined 
method `split' for 1:Integer (NoMethodError)
from greeting.rb:6:in `greet' from greeting.rb:10:in 
`decorate_greeting'
from greeting.rb:14:in `<main>'

# stack trace

main -> decorate_greeting -> greet -> 
space_out_letters (passes result back) -> greet -> 
decorate_greeting -> main

=end