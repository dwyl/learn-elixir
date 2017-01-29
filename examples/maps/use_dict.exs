#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Sum do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

# Sum a HashDict
hd = [ one: 1, two: 2, three: 3 ] |> Enum.into HashDict.new
IO.puts Sum.values(hd)  # => 6

# Sum a Map
map = %{ four: 4, five: 5, six: 6 }
IO.puts Sum.values(map) # => 15
