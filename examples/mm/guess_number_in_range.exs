# Exercise: ModulesAndFunctions-5 implement Chop.guess(n, low..range)
# run the file to see output
defmodule Chop do
  def guess(n, low..high) do
    number = div(high + low, 2)
    IO.puts "Is it #{number}? (#{n}, #{low}..#{high})"
    make_guess(number, n, low..high)
  end

  def make_guess(number, n, _) when number == n do
    IO.puts "Found it: #{n}"
  end

  def make_guess(number, n, low.._) when number > n do
    guess(n, low..number)
  end

  def make_guess(number, n, _..high) when number < n do
    guess(n, number..high)
  end
end

Chop.guess(273, 1..1000)

Chop.guess(911, 1..1000)
