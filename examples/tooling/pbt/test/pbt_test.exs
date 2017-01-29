#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule PbtTest do
  use ExUnit.Case
  use ExCheck
  doctest Pbt

  def average(list) do
    IO.inspect list
    with sum = Enum.reduce(list, 0, &+/2),
        count = length(list)
          do
          IO.inspect { count, sum }
          sum/count
        end
  end


  property :a do
    for_all a in [int,int], do: average(a) >= -7
  end

  # property :average do
  #   for_all l in such_that(l in list(int) when length(l) > 0), do: average(l) > 0
  # end
end

IO.inspect PbtTest.average([1,2,3])
