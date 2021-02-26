# Write a function that will find all the anagrams of a word from a list. 
# You will be given two inputs a word and an array with words. 
# You should return an array of all the anagrams or an empty array if there are none. 
# https://www.codewars.com/kata/523a86aa4230ebb5420001e1/

def anagrams(word, words)
  words.select { |w| w.chars.sort.join('') == word.chars.sort.join('') }
end

# Didn't have to join('') because Ruby will just compare the two character lists.

# Divisors of 42 are : 1, 2, 3, 6, 7, 14, 21, 42. These divisors squared are: 1, 4, 9, 36, 49, 196, 441, 1764. 
# The sum of the squared divisors is 2500 which is 50 * 50, a square!
# Given two integers m, n (1 <= m <= n) we want to find all integers between m and n whose sum of squared divisors is itself a square.
# https://www.codewars.com/kata/55aa075506463dac6600010d

def list_squared(m, n)
  result = []
  m.upto(n) { |num| 
    sum = sum_divisors(num)
    if square?(sum)
      result << [num, sum]
    end
  }
  return result
end

def sum_divisors(n)
  get_divisors(n).reduce { |sum, divisor| sum += divisor ** 2 }    
end

def get_divisors(n)
  divisors = [1]
  1.upto(Integer.sqrt(n)) { |i|
    if n % i == 0
      divisors += [i, n / i]
    end
  }
  divisors.uniq
end

def square?(n)
  Integer.sqrt(n) == Math.sqrt(n)
end

# My solution kept timing out, but that was because I was looping to n / 2 instead of sqrt(n). The top rated answer was a single 
# map, which makes a lot of sense. Learnt a lot looking up how to optimize Ruby code. 

# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, 
# which is the number of times you must multiply the digits in num until you reach a single digit.

def persistence(n)
  persistence = 0
  until n.to_s.length == 1 do
    n = n.to_s.chars.map(&:to_i).reduce { |product, n| product = product * n}
    persistence += 1
  end
  persistence
end

# Not the most Ruby solution

#Given an array (arr) as an argument complete the function countSmileys that should return the total number of smiling faces.
#Rules for a smiling face:
#Each smiley face must contain a valid pair of eyes. Eyes can be marked as : or ;
#A smiley face can have a nose but it does not have to. Valid characters for a nose are - or ~
#Every smiling face must have a smiling mouth that should be marked with either ) or D

def count_smileys(arr)
  arr.count { |face| /[:;][-~]*[)D]/.match(face) }
end

# =~ is a shorter way to do .match

# As the name may already reveal, it works basically like a Fibonacci, but summing the last 3 (instead of 2) numbers of the sequence to generate the next. 
# Well, you may have guessed it by now, but to be clear: 
# you need to create a fibonacci function that given a signature array/list, returns the first n elements - signature included of the so seeded sequence.

# Signature will always contain 3 numbers; n will always be a non-negative number; 
# if n == 0, then return an empty array (except in C return NULL) and be ready for anything else which is not clearly specified ;)

def tribonacci(signature,n)
  if n < 3
    return signature.first(n)
  end
  (n - 3).times do
    signature.append(signature[-1] + signature[-2] + signature[-3])
  end
  signature
end

# The top solution is very similiar but doesn't do the first if statement, but the method is correct. 

# A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.
# He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).
# His mother looks out of a window 1.5 meters from the ground.
# How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

def bouncingBall(h, bounce, window)
    if h > 0 && (0...1) === bounce && window < h
      count = 0
      until h <= window do
        h = h * bounce
        h > window ? count += 2 : count += 1
      end
      return count
    else
      -1
    end
end

# Definitely too wordy - the top solutions used recursion. I saw one use logarithms too which is super smart.

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

