#--- "Fizz Buzz" reader exercise on p.41 of Programming Elixir 1.3

fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, 1) -> "Have A Banana!" # Cabin Pressure is Pure Genius! ;-)
  (_, _, a) -> a
end # see: https://www.youtube.com/results?search_query=Fizz+Buzz+Have+a+banana

IO.puts fizzbuzz.(0,1,1)
IO.puts fizzbuzz.(1,0,3)
IO.puts fizzbuzz.(0,0,1)
IO.puts fizzbuzz.(1,1,1)
IO.puts fizzbuzz.(1,1,4)
IO.puts "\n"

# Exercise Functions-3
fb = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts fb.(1)
IO.puts fb.(2)
IO.puts fb.(3)
IO.puts fb.(4)
IO.puts fb.(5)
IO.puts fb.(6)
IO.puts fb.(7)
IO.puts fb.(8)
IO.puts fb.(9)
IO.puts fb.(10)
IO.puts fb.(11)
IO.puts fb.(12)
IO.puts fb.(13)
IO.puts fb.(14)
IO.puts fb.(15)
IO.puts fb.(16)
IO.puts "\n"
