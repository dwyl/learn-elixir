#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Stats do
  def sum(vals),     do: vals |> Enum.reduce(0, &+/2)
  def count(vals),   do: vals |> length
  def average(vals), do: sum(vals) / count(vals)
end

