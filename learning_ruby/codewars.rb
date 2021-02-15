# This time we want to write calculations using functions and get the results. Let's have a look at some examples:
# seven(times(five)) # must return 35
# four(plus(nine)) # must return 13
# eight(minus(three)) # must return 5
# six(divided_by(two)) # must return 3
# Requirements:

# There must be a function for each number from 0 ("zero") to 9 ("nine")
# There must be a function for each of the following mathematical operations: plus, minus, times, dividedBy (divided_by in Ruby and Python)
# Each calculation consist of exactly one operation and two numbers
# The most outer function represents the left operand, the most inner function represents the right operand
# Division should be integer division. For example, this should return 2, not 2.666666...:

def zero(expr=nil)
  expr.nil? ? 0 : expr.call(0)
end
def one(expr=nil)
  expr.nil? ? 1 : expr.call(1)
end
def two(expr=nil)
  expr.nil? ? 2 : expr.call(2)
end
def three(expr=nil)
  expr.nil? ? 3 : expr.call(3)
end
def four(expr=nil)
  expr.nil? ? 4 : expr.call(4)
end
def five(expr = nil)
  expr.nil? ? 5 : expr.call(5)
end
def six(expr=nil)
  expr.nil? ? 6 : expr.call(6)
end
def seven(expr=nil)
  expr.nil? ? 7 : expr.call(7)
end
def eight(expr=nil)
  expr.nil? ? 8 : expr.call(8)
end
def nine(expr=nil)
  expr.nil? ? 9 : expr.call(9)
end
def plus(n)
  -> (x) { x + n }
end
def minus(n)
  -> (x) { x - n }
end
def times(n)
  -> (x) { x * n }
end
def divided_by(n)
  -> (x) { x / n}
end

# I thought about church encodings at first but the operators only take in one arg. This helped me learn how to do lambdas in Ruby.

# A pangram is a sentence that contains every single letter of the alphabet at least once. 
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.
# https://www.codewars.com/kata/545cedaa9943f7fe7b000048

def panagram?(string)
  string.downcase!
  (("a".."z").to_a).all? { |letter| string.include? letter }
end

# Seems like I came with basically the highest rated solution - except I downcased first instead of just one-lining it.

# Given an array of integers, find the one that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.
# https://www.codewars.com/kata/54da5a58ea159efa38000836

def find_it(seq)
  seq.select { |n| seq.count(n).odd? }[0]
end

# Almost had the best solution, ruby has detect so it should've been

def find_odd_int(seq)
  seq.detect { |n| seq.count(n).odd? }
end

# Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.
# https://www.codewars.com/kata/523f5d21c841566fde000009

def array_diff(a, b)
  a.select { |e| !b.include? e}
end

# Ruby lets you just do a - b.

# Bob is preparing to pass IQ test. The most frequent task in this test is to find out which one of the given numbers differs from the others. 
# Bob observed that one number usually differs from the others in evenness. Help Bob — to check his answers, 
# he needs a program that among the given numbers finds one that is different in evenness, and return a position of this number.
# Keep in mind that your task is to help Bob solve a real IQ test, which means indexes of the elements start from 1 (not 0)

def iq_test(numbers)
  nums = numbers.split().map { |num| num.to_i % 2 }
  nums.count(1) == 1 ? nums.find_index(1) + 1 : nums.find_index(0) + 1
end

# I should've used even? instead of % 2 but overall seems very solid.

