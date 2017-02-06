# Exercise: ModulesAndFunctions-4 implement sum(n) with recursion
# return the result of adding all number up to n
# e.g: Sum.sum(5) is 15 (1+2+3+4+5)
defmodule Sum do
  def sum(0), do: 0
  def sum(n) when n > 0, do: n + sum(n - 1)
end
