#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
@count = 0
def fib(n)
  @count += 1
  puts "fib(#{n})"
  if n < 2
    n
  else
    fib(n-1) + fib(n-2)
  end
end

(5..5).each do |i|
  @count = 0
  result = fib(i)
  puts @count
#  puts sprintf("%2d %-10d %s", i, @count, result)
end
