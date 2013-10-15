#!/usr/env/bin/ruby
#
# Collatz Conjecture
#
# Start with a number *n > 1*.
# Find the number of steps it takes to reach one using the following process:
#
#  If *n* is even, divide it by 2.
#  If *n* is odd, multiply it by 3 and add 1.
#
def collatz(n=1)
  steps = 0
  until n == 1
    steps += 1
    n = (n % 2 == 0 ? (n/2) : ((n*3)+1))
  end
  steps
end

puts collatz(1)
puts collatz(2)
puts collatz(3)
puts collatz(45)

