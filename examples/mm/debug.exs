#---
# Excerpted from "Programming Elixir 1.3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir13 for more book information.
#---
defmodule Debug  do
  def value(val) when is_integer(val), do: "integer: #{val}"
  def value(val) when is_atom(val),    do: "atom: #{val}"
  def value(val) when is_list(val),    do: "list: #{inspect val}"
  def value(val), do: "#{val}"
end